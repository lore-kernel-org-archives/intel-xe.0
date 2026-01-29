Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96604D73E80
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5518010E8D1;
	Thu, 29 Jan 2026 17:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8gPKdoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465310E8D6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769707708; x=1801243708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYk0KSzWLdTeHoG32wY+IwIEgfYYieHvUqSTObipPHs=;
 b=H8gPKdoiv/5Vk/nraciiRvfIc+s/7bvRAMf/bMkTlmUAXQOWD09D+0Vr
 54Ghplz1QvV7d5rvD9VIS/ktP9G4UUmfIxNO2RRnVXGD3L2GVKksmqW23
 f4eupiM0fIAjwiF2WwJywwkVCXCXeBEXQQ84zFIV1lsf0cPaU9Vo/2OGf
 TXs8/Ssp4GnzcMNC2Ss5VBI7qnja47AkGpkHf8DK1YOnngtVPUIOrm/VJ
 oR4t0QcrTcL6/rO77+X516HcYoPbrer019j5+TCKWhn74JZUhj5xyNC4O
 PhjuFZmBVERBSpP0NJzh2i+9zfLGY95YjVJHMyE2avwIS2tYbXVUXUxmz A==;
X-CSE-ConnectionGUID: wwQYLaVQQ7aqBLWMjN28ZQ==
X-CSE-MsgGUID: 1k8GSmaeScO8okWFBhRIQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70849959"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70849959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:28:28 -0800
X-CSE-ConnectionGUID: rOsOUhP5TtONQOaLR7arrg==
X-CSE-MsgGUID: STURfkynSACo9MuNZByHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208989869"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2026 09:28:26 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 0/2] drm/xe:Mutual exclusivity between CCS-mode and PF
Date: Thu, 29 Jan 2026 22:52:47 +0530
Message-ID: <20260129172246.1106097-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

     Due to SLA agreement between PF and VFs,the alternate CCS-mode
cannot be changed when VFs are already enabled.
Similarly, enabling VFs is not permitted when the alternate
CCS-mode is active. Also skipping populating
CCS-mode sysfs entry in VF Mode.

---
v2:
- function xe_device_is_vf_enabled has been refactored to
  xe_sriov_pf_has_vfs_enabled and moved to xe_sriov_pf_helper.h.
- The code now distinctly checks for SR-IOV VF mode and
  SR-IOV PF with VFs enabled.
- Log messages have been updated to explicitly state the current mode.
- The function xe_multi_ccs_mode_enabled is moved to xe_device.h

v3: Described missed arg documentation for xe_sriov_pf_has_vfs_enabled

v4:
- sysfs interface for CCS mode is not initialized
  when operating in SRIOV VF Mode.
- xe_sriov_pf_has_vfs_enabled() check is sufficient while CCS mode
  enablement.
- remove unnecessary comments as flow is self explanatory.

v5:(review comments from Michal)
- Add xe device level CCS mode block with mutex lock and CCS mode state
- necessesary functions to manage ccs mode state to provide strict mutual
  exclusive support b/w CCS mode & SRIOV VF enabling

v6:
- Re modeled implementation based on lockdown the PF using custom guard
  supported functions by Michal

v7:
- Corrected patch style as message written as subject
- Used public PF lockdown functions instead internal funcions(Michal)
- Creating CCS Mode entries only on PF Mode

v8:(Michal)
- updated short subject and few comments
- used guard for mutex
- Add a check of PF Mode to ensure use of xe_sriov_pf_lockdown only in
  PF Mode
- Added default CCS mode check to xe_gt_ccs_mode_default(gt) function

v9:(Michal)
- Added xe_gt_ccs_mode_default(gt) as static inline and it can be used
  across driver to use between default or alternate CCS mode
- removed comment from obvious code
v10[v2 as per new series]:(Michal)
- revoked gt_prepare_ccs_mode_enabling/gt_finish_ccs_mode_enabling functions
  Instead added direct code for better readability

Nareshkumar Gollakoti (2):
  drm/xe: Fix Prevent VFs from exposing the CCS mode sysfs file
  drm/xe: Mutual exclusivity between CCS-mode and PF

 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 39 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 +++++++++
 2 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.43.0

