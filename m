Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C4FD2F33E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94510E514;
	Tue, 13 Jan 2026 16:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3Y+Q8Ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F010E514
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321966; x=1799857966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhbOro/6pVIW02rKbQ479kU/sLmFKyjbCcftZJG0bsI=;
 b=e3Y+Q8IaglpsAlF/lyMfsDVDHSsqttFn7q4+JBiVXE2HqSTSyEDkxlCb
 nrEFd9dOESlTiDjiN+swT98DHtyjbmtMvVpvsp5Q9Pd20YlDwIn98IIC1
 nc8aGEWtFlHNGIM5M4NFyIrBL6YgoFu5WKk01ry2z9ZeBLAIfAVRy1ZaW
 WI0ZwB8XG7kY9uYIMAbs+LXBnkosW/RMk17wt1napTudqA5YHr1jgQmHQ
 dR0ZnPrzg8CnqsLW5W43m3CWYbI+Jk7pQKz3jfa4fZe7I0a9JS1CY0CIB
 tsffYu0OXg750++3AZf6GaFMlSuCHe0X7+YcViieGCG+0TB1bSlHvh2y9 Q==;
X-CSE-ConnectionGUID: k75iRUrqSjm7PTLBrneH1Q==
X-CSE-MsgGUID: ZpWQQ2hqSceOCrnSHTNMqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69521092"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69521092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:46 -0800
X-CSE-ConnectionGUID: H1ToScFnTm+PLtXfZmyKaA==
X-CSE-MsgGUID: ye6fDcmEQ/mu7D5yR290rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060300"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:42 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 11/12] drm/xe/pm/s2idle: Don't evict user BOs D3cold-VRSR
 state
Date: Tue, 13 Jan 2026 22:12:12 +0530
Message-ID: <20260113164200.1151788-25-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

Since VRAM stays active in D3cold-VRSR, evicting user BOs is unnecessary.

Cc: Matthew Auld <matthew.auld@intel.com>
Co-developed-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
V1: Removed D3hot handling since, on discrete cards, we do not block
    D3cold during system suspend
---
 drivers/gpu/drm/xe/xe_pm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1dd8e2c0f51e..3c7983afca9c 100644
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
@@ -192,8 +192,6 @@ int xe_pm_suspend(struct xe_device *xe, bool hibernation)
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
-	xe_pm_suspend_prepare(xe);
-
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
@@ -554,8 +552,12 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	int err = 0;
 
 	switch (action) {
-	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
+		xe_pm_suspend_prepare(xe);
+		if (xe->d3cold.target_state == XE_D3COLD_VRSR)
+			break;
+		fallthrough;
+	case PM_HIBERNATION_PREPARE:
 	{
 		struct xe_validation_ctx ctx;
 
@@ -580,8 +582,11 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		xe_pm_block_end_signalling();
 		break;
 	}
-	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		if (xe->d3cold.target_state == XE_D3COLD_VRSR)
+			break;
+		fallthrough;
+	case PM_POST_HIBERNATION:
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
-- 
2.52.0

