Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DDDCED243
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 12:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29510E0B5;
	Tue, 18 Nov 2025 12:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNoM1h5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04F210E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763470065; x=1795006065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l/21lr+wAt2kx6vCCAeCCvYN307b+m2rp8U7ODJfTRE=;
 b=hNoM1h5AokkUsAZvftLxHTlTwb64B/LVg/eP9X5NBf4PUvglNE9Gsf5D
 TLOrE1xTwZfJ5KO9ZTbbdWQrbnkp6z63x+ugjaLZkyEhhdXFu+uOrU961
 C0S0FDS6PON8xp6B8lcjlCxB8dTLha4d2H6te7rqiq+D0vYOcLUuyIsME
 dy7/UQji9AUx7mdGT3TdUeMBOEZdk6/KpfmAbubVAR7w5bU/XNgKXKGPw
 T5zywkuKs8jMK4CGurvEPMafIhQnenrxHYQwTkqhnSDLzi+Q0VzPlPWLX
 zIQ1+SFDHnKimU4GMrs7FHbv+cE3jJr22naKl1heTGjhc81yTgb0eAF1+ w==;
X-CSE-ConnectionGUID: BFuej3MQR/2mAa3AZel9Bg==
X-CSE-MsgGUID: gnge2uI2Q/+x/r4WKY4/+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65194246"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65194246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:47:44 -0800
X-CSE-ConnectionGUID: zoGQ5XsLRreessyDBlNsGA==
X-CSE-MsgGUID: jCZFcTuyRPyNlJ9j2Jehzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190034350"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 04:47:44 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/2] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Date: Tue, 18 Nov 2025 12:47:39 +0000
Message-ID: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
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

When SR-IOV is enabled, a VM may suspend on one VF and resume on a
different VF after S4 sleep cycle. Because GGTT space is not virtualized,
this transition can lead to incorrect GGTT references. To address this,
validate the GGTT space during resume and apply necessary fixups if
the VF has changed.

---
V2 -> V3:
- Fixed review comments (Michal).
- Added a new function xe_gt_sriov_vf_resume_fixups() which
handshakes with GUC and does GGTT fixups.
- Updated commit message.

V1 -> V2:
- Rebased to latest drm-tip.


Satyanarayana K V P (2):
  drm/xe/vf: Split GGTT info query and fixup into separate helpers
  drm/xe/vf: Fix up GGTT mappings on S4 resume across VFs.

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 83 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c          |  7 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 30 +++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
 5 files changed, 108 insertions(+), 14 deletions(-)

-- 
2.51.0

