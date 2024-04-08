Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6ADC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 14:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0811112694;
	Mon,  8 Apr 2024 14:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yiz+kRbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D6B112693
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712586969; x=1744122969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRFpysoTI+x/hrLpOoBDNcl6YHE5RZ9YpMm5qo0czsA=;
 b=Yiz+kRbs2PPYNA/68Ip9TQ/0fqOlnxxsyvGbbVbUyOFIuCkEVzVG+WWK
 8mpzetYlZ8xnMwKy7uu7FwyIwjATRlbVVxrcSL1PbMZEJpP8LBdFRukYg
 33Sz7wfH0RcvvmM+Jafp8dlGTG/3oPyu4m1wIF1qoVfBCMonEfjPFQR1c
 mxF9nae9h9/jSr6c4a/MwQGtD+AQLD5d2ztr7neZZjJoEV+Tqhxi6lInA
 ErVK1jii84fGNdEyYOxZoq9I0UGLKUspzeUu6ccKYRgsGMw1DpzuhOrxN
 vvH5Eequ4+S7RCFbH7/PstlTiuMcYgyhj8TrVDxcq8RwNpCAsKH9/SeN0 Q==;
X-CSE-ConnectionGUID: lZhGFC5oSfOGferlRU2q/w==
X-CSE-MsgGUID: PaWNQmCWQ5y/4EU29nj7UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33264152"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="33264152"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 07:36:08 -0700
X-CSE-ConnectionGUID: LP4bWXylTaOYj5jbOYLgQw==
X-CSE-MsgGUID: KdjFsyPeQnyS/Pv22Yzfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24673139"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 08 Apr 2024 07:36:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 2/4] drm/xe: Incase of action add failure,
 remove sysfs only once.
Date: Mon,  8 Apr 2024 20:19:42 +0530
Message-Id: <20240408144944.604448-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
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

The drmm_add_action_or_reset function automatically invokes the action
(sysfs removal) in the event of a failure; therefore, there's no
necessity to call it within the return check. Additionally, it issues a
warning regarding the failure to add the action. Consequently, there's
no requirement to print a nearly identical warning within the xe driver.

Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 529fc286cd06..31d615ce0d90 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -183,9 +183,6 @@ void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	}
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
-	if (err) {
-		sysfs_remove_files(gt->sysfs, gt_ccs_mode_attrs);
-		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-	}
+	if (err)
+		drm_warn(&xe->drm, "Sysfs removed for ccs_mode.\n");
 }
-- 
2.25.1

