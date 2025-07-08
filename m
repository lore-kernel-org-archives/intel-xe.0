Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2411C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 03:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898D10E0A4;
	Tue,  8 Jul 2025 03:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSzrQqzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089210E0A4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 03:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751946941; x=1783482941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S4X0YIsg8bLNB16V2elyCZRITmN4RHBRp13ghjN8plY=;
 b=QSzrQqzzgHiwHyWgnwHibMpKLgBGbaFQiWm103bRiWqTfGQx83mYz4Cc
 7zPxu7Xay4jh1i/Ng/H1Zlev95tUXSKKSNZfGYGO4DbZW4zESBD1sD/Es
 SYA+hlmA6vKpXDBzNCVYWI+wBYylsuoINtysg8qIeuduIddU/Xo9kE2bP
 B1G0EL7/VSC56Ad2vHPfBT2MqoYrLMBYtaJ62u+NjymsoH44c6++yJc8C
 BAPULhqarHpgVBDZiLcgHR+CkKOHFSde+tXFUOMtJFoHFZcVBpgVJkcDp
 Lji2pZUFbeH8GmVx7GcJ1/51/HV4HJympKCUlQdCpGHpaKTTszsr76O/N g==;
X-CSE-ConnectionGUID: hOB7j6A3RDWUbNYkZGCDDg==
X-CSE-MsgGUID: 2oK8LB0OQPm2BIaowX9BGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53384095"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="53384095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 20:55:40 -0700
X-CSE-ConnectionGUID: 3N/UMAIHRHm4TpL2KP180A==
X-CSE-MsgGUID: AwyhDMdxQpmyn3RA1EKblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155509108"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 07 Jul 2025 20:55:39 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2] drm/xe/pm: Restore display pm if there is error after
 display suspend
Date: Tue,  8 Jul 2025 03:54:25 +0000
Message-ID: <20250708035424.3608190-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707015825.3522467-2-shuicheng.lin@intel.com>
References: <20250707015825.3522467-2-shuicheng.lin@intel.com>
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

xe_bo_evict_all() is called after xe_display_pm_suspend(). So if there
is error with xe_bo_evict_all(), display pm should be restored.

v2: remove Fixes tag as several patches mixed together

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..bcfda545e74f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -134,7 +134,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
-		goto err_pxp;
+		goto err_display;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
@@ -151,7 +151,6 @@ int xe_pm_suspend(struct xe_device *xe)
 
 err_display:
 	xe_display_pm_resume(xe);
-err_pxp:
 	xe_pxp_pm_resume(xe->pxp);
 err:
 	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
-- 
2.49.0

