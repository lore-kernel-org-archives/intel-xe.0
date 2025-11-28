Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E24D116EA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 17:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8897D10E18B;
	Fri, 28 Nov 2025 17:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OG2YDkea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F50B10E18B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764350666; x=1795886666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q+sYjO3V+mGgPXvfI2YMNGo7lhwGH+of1oaG84gxd80=;
 b=OG2YDkeagKFZReTsZEer1sYg8HvzycA8KYU9uSIBA/yCEUqEKpNb5SG3
 9Is9yxNqkLIK1LZ1a4yvnRHHalpnHXmZmQZGrLky4OBQJBjce56rqPeUj
 vkk1OrtyQgkF0uWa4271bgQhjkb9Il/5ENEmhTGVqotNEoRhsfUpTQzG3
 C4OCFiksHIrOJIyPWiIPl0Ae4uT4oYHmtjeT1mbDEB9kGAaqcb/KI6680
 LZA9a0QIsEMjPQJgkaTolnkmdiJlf00qecwXfvnL/6AvanivahcXdyMRF
 3UrOvzApt5ipAJ2/OUd7QlIheMojIgQJjdaogv8hFtnk42Mw3sjbZBUP4 g==;
X-CSE-ConnectionGUID: 5Frf4VzZT+CKoT3cbN3jxQ==
X-CSE-MsgGUID: /HkabPD5Q6OIi+wQVPJXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77489085"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77489085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 09:24:25 -0800
X-CSE-ConnectionGUID: jGJJtOCgTlaJb4IWyQGpkQ==
X-CSE-MsgGUID: lTkXLKmOSAueOLpr7ZSnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224453693"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 09:24:23 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v1 0/2] drm/xe:Mutual exclusivity between CCS-mode and PF
Date: Fri, 28 Nov 2025 22:48:00 +0530
Message-ID: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

Nareshkumar Gollakoti (2):
  drm/xe: Fix Prevent VFs from exposing the CCS mode sysfs file
  drm/xe: Mutual exclusivity between CCS-mode and PF

 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 61 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
 2 files changed, 58 insertions(+), 15 deletions(-)

-- 
2.43.0

