Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19683C021B3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851C10E0E9;
	Sat, 22 Feb 2025 00:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkPIPwgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE710EB46
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yskEa7Qu0GRG4lwiRNJVGSVeN5Es79Tv6le7U6vJyzM=;
 b=PkPIPwgJqbgoaRz2UM1qDCLcqwZdusOVndm4oPmXAke4/5Jgr/2l3XAn
 gqdWHj5sKx/zSJwxqKkgMYM2vz/ycTYEuVnVNjC18oqJyV8kxaWx0PtzJ
 n8CvB1zpmho/6N7Kp6RCRyjwUELoXqcaVGtKSWxdkUcRqJHtF6EAPQi+P
 YOswo4n3jNQT0Yhg4DI+2rwIHwwHCAXPJiv1KMcNBxpA8fQ0jkqN/5fPr
 MDQn1XrS1xlLQW1DrJXJjWCj3aab6PEvzOBVtJvE6pGJkZ5He6WNYOXEM
 Lz1gERr4RuV/KbXcDAUMYITzZX8eSyffgD4MylUKIFoI/mOL7FyG5N6dh A==;
X-CSE-ConnectionGUID: LuKxITTmRZyIWUbfrmNAQg==
X-CSE-MsgGUID: u2Uzj4dETcyR7WBu6nY9/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926393"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: vebJKo26T0OL3Ghs5lZmrQ==
X-CSE-MsgGUID: GormVxHXQL69QBnh5j2bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704949"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 07/11] drm/xe/display: Drop xe_display_driver_remove()
Date: Fri, 21 Feb 2025 16:10:47 -0800
Message-ID: <20250222001051.3012936-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Handle it as part of xe_display_fini(). The error handling was already
calling it if a step after xe_display_init() failed. Just re-use the
same xe_display_fini() for driver remove.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
 drivers/gpu/drm/xe/display/xe_display.h |  1 -
 drivers/gpu/drm/xe/xe_device.c          |  8 ++------
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index c26108f54389f..d5d453dc927a1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -170,6 +170,7 @@ static void xe_display_fini(void *arg)
 	intel_hpd_poll_fini(xe);
 	intel_hdcp_component_fini(display);
 	intel_audio_deinit(display);
+	intel_display_driver_remove(display);
 }
 
 int xe_display_init(struct xe_device *xe)
@@ -209,16 +210,6 @@ void xe_display_unregister(struct xe_device *xe)
 	intel_display_driver_unregister(display);
 }
 
-void xe_display_driver_remove(struct xe_device *xe)
-{
-	struct intel_display *display = &xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	intel_display_driver_remove(display);
-}
-
 /* IRQ-related functions */
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 685dc74402fb8..46e14f8dee28a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -14,7 +14,6 @@ struct drm_driver;
 
 bool xe_display_driver_probe_defer(struct pci_dev *pdev);
 void xe_display_driver_set_hooks(struct drm_driver *driver);
-void xe_display_driver_remove(struct xe_device *xe);
 
 int xe_display_create(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e76d233025a69..83e64525839db 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -868,11 +868,11 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_pxp_init(xe);
 	if (err)
-		goto err_remove_display;
+		return err;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
-		goto err_remove_display;
+		return err;
 
 	xe_display_register(xe);
 
@@ -899,8 +899,6 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
-err_remove_display:
-	xe_display_driver_remove(xe);
 
 	return err;
 }
@@ -911,8 +909,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	drm_dev_unplug(&xe->drm);
 
-	xe_display_driver_remove(xe);
-
 	xe_heci_gsc_fini(xe);
 }
 
-- 
2.48.1

