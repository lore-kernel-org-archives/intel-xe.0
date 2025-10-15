Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C482BCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873E510E74B;
	Wed, 15 Oct 2025 08:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEhRlmEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4E10E74B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515391; x=1792051391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAwLTgtExgWL+DQCTV9zplmSGb5GqoAMpIw5P8V3OiY=;
 b=MEhRlmEWCAWYs29XUFZBM+Cg494chds80EeQ4oGU22I2/u3woTmIFFlX
 1rLq8zk+TP19X784hFiKzh16OvCV8NbX8GkwK7PfZEleX8MFG5ODjTKlO
 JLvCIZVOTHJ1fKaYf3AdItbR9yt94dnBxCQf5flvrt6rA0veFDDSHW/48
 6IgC8IE+3dWr2x97WAbpbyAD4T0FXYjwA6ydibF09zz0T/2IsKwtODvRW
 Z/zm4DDYEBauh9jU3OLtCGiTyX6768M7JyNnsoLEsBm0CqXynud1xPdLQ
 V2144s+IYBI28dYRtyPbGlPeypWPGUT+hCGIR8s34Padaye6Zhbfl3z99 g==;
X-CSE-ConnectionGUID: q7oo/GqLQ2+2szAEwKo5Og==
X-CSE-MsgGUID: gkpWFEfXRS23/s/yW1orow==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891533"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:03:10 -0700
X-CSE-ConnectionGUID: zFNYUF6XQdKoB16t14sgcw==
X-CSE-MsgGUID: +kgS3+kET6eNg2smZH3UHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805559"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:03:06 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 11/12] drm/xe/pm/s2idle: Don't evict user BOs for D3hot and
 D3cold-VRSR state
Date: Wed, 15 Oct 2025 13:37:09 +0530
Message-Id: <20251015080710.1468409-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015080710.1468409-1-badal.nilawar@intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
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

In D3hot and D3cold-VRSR, VRAM remains active, so it is not necessary
to evict user BOs.

Cc: Matthew Auld <matthew.auld@intel.com>
Co-developed-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 84cd9e84f548..51ff9b90fbfd 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -169,7 +169,7 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 
 static void xe_pm_suspend_prepare(struct xe_device *xe)
 {
-	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+	if (pm_suspend_default_s2idle())
 		xe_pm_d3cold_target_state_toggle(xe);
 	else
 		xe->d3cold.target_state = XE_D3COLD_OFF;
@@ -191,8 +191,6 @@ int xe_pm_suspend(struct xe_device *xe)
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
-	xe_pm_suspend_prepare(xe);
-
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
@@ -543,8 +541,12 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	int err = 0;
 
 	switch (action) {
-	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
+		xe_pm_suspend_prepare(xe);
+		if (xe->d3cold.target_state != XE_D3COLD_OFF)
+			break;
+		fallthrough;
+	case PM_HIBERNATION_PREPARE:
 	{
 		struct xe_validation_ctx ctx;
 
@@ -569,8 +571,11 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		xe_pm_block_end_signalling();
 		break;
 	}
-	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		if (xe->d3cold.target_state != XE_D3COLD_OFF)
+			break;
+		fallthrough;
+	case PM_POST_HIBERNATION:
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
-- 
2.34.1

