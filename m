Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91D4D116EA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 17:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9798961D;
	Fri, 28 Nov 2025 17:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fY6tw04w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B04910E847
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764350668; x=1795886668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H91/UoyTB8RJWQcrl/bdG6GSQPh4hZDz+4/49Drqxpg=;
 b=fY6tw04w5yqAKbfVI+kMrLgUD1g5OFfFvPm3NBmUtP5JnVUNV7uqCvcG
 uEGzi9oJgGtUq6VfpmaRTo78da6J+BDke93RPFQadLDYCDX8i0Tju//iQ
 8ABwDUwKF8oCyVqiW4x+NamczqZ1KcmHA2lOiPAh9yb/xFQG4ITboJ83n
 rkgAi+dQ/+PqgMKhoH9J5IzSbhyyqCor+n8yJQXXXYGiPAU7thGWjE3EV
 d/6EMvAujljNdA219uPlrIp1vJgBoMQkCBOHClW/xEOEUUe/XAIA4pzcH
 qBwnUXn6vZyaKtzNVFhSbxXEXTHT+XL27mwMbw+pZ0EOyIdKfH76SZ7yK A==;
X-CSE-ConnectionGUID: qMzEft2IRRudN3clTaF/CA==
X-CSE-MsgGUID: 6p/jBfD4RSCQ7rIYm+JXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77489105"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77489105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 09:24:28 -0800
X-CSE-ConnectionGUID: 52FqWBy1SG+Tk7mqTm7EVA==
X-CSE-MsgGUID: j7nu0FuTSUqIAYsa7kBnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224453697"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2025 09:24:26 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v1 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
Date: Fri, 28 Nov 2025 22:48:01 +0530
Message-ID: <20251128171759.2775650-5-naresh.kumar.g@intel.com>
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

Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
CCS mode changes

Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..e146e00b0ca2 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	if (!xe_gt_ccs_mode_enabled(gt))
+	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
 		return 0;
 
 	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
-- 
2.43.0

