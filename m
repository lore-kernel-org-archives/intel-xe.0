Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC840FF60F9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 09:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19E10EA11;
	Tue, 31 Mar 2026 09:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmQxVPUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E061E10EA11;
 Tue, 31 Mar 2026 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774950590; x=1806486590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mJc0lsoCwhgbQww3Lb3DA7wEp8vAyUyJcyoH7I+CVts=;
 b=BmQxVPUtbZS4WDnAheYm1CSyF77g6oz+qxk17hx4g8DIN8JCOchrYpzN
 7lZhDzLctw+Q3YX/qW/DTJ1b3qalxUhZVrqOd9wtSva4bsx2WgcUnof+N
 iVhNJtsNdQqb/JBKFlPy4kOrRTFsQnthRzYn9sNblr6cyw6LvTI0KJpYD
 rPQdRB0aOKOiVgLspqIoc7GugRc1K3FTkfzvudYcU3ZPIWcOsX/igM76B
 RwAanqkfuEEgjPkjoJvB3k22wuVD2Tb0ceKlFach8jjdkph0cgRPSVW7R
 T90+YNrvTZQ7yZT2s/zIZkk2B092bDT+TWX8Xz6XcGtCihqTRt+/cb2cm w==;
X-CSE-ConnectionGUID: aeUeAS63QtqpP7WfbyhFCQ==
X-CSE-MsgGUID: 0TzrdPEATB+hlRGVzWxVjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="98569512"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="98569512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:50 -0700
X-CSE-ConnectionGUID: tnNjUY3vTISfxcME/tdjyA==
X-CSE-MsgGUID: U7y6oy0xTHOMw8lINM2Wzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="223435213"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 5/5] drm/xe: pass struct xe_device to
 xe_display_bo_fbdev_prefer_stolen()
Date: Tue, 31 Mar 2026 12:49:18 +0300
Message-ID: <56bd532dc5cf460cdbf17c7781f18db5378a28e6.1774950508.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774950508.git.jani.nikula@intel.com>
References: <cover.1774950508.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

This is xe core code, use struct xe_device for simplicity.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 5 ++---
 drivers/gpu/drm/xe/display/xe_display_bo.h    | 4 ++--
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
index 6f372c73ab8e..f943150e4135 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.c
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
@@ -119,9 +119,8 @@ static u32 xe_display_bo_fbdev_pitch_align(u32 stride)
 	return ALIGN(stride, XE_PAGE_SIZE);
 }
 
-bool xe_display_bo_fbdev_prefer_stolen(struct drm_device *drm, unsigned int size)
+bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
 {
-	struct xe_device *xe = to_xe_device(drm);
 	struct ttm_resource_manager *stolen;
 
 	stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
@@ -149,7 +148,7 @@ static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm,
 
 	obj = ERR_PTR(-ENODEV);
 
-	if (xe_display_bo_fbdev_prefer_stolen(drm, size)) {
+	if (xe_display_bo_fbdev_prefer_stolen(xe, size)) {
 		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
 						size,
 						ttm_bo_type_kernel,
diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.h b/drivers/gpu/drm/xe/display/xe_display_bo.h
index 8980e6ecf54a..c72056884ff4 100644
--- a/drivers/gpu/drm/xe/display/xe_display_bo.h
+++ b/drivers/gpu/drm/xe/display/xe_display_bo.h
@@ -6,9 +6,9 @@
 
 #include <linux/types.h>
 
-struct drm_device;
+struct xe_device;
 
-bool xe_display_bo_fbdev_prefer_stolen(struct drm_device *drm, unsigned int size);
+bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size);
 
 extern const struct intel_display_bo_interface xe_display_bo_interface;
 
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 73ae502bb2a5..1c7a4e8c390c 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -87,7 +87,7 @@ initial_plane_bo(struct xe_device *xe,
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
 		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
-		    !xe_display_bo_fbdev_prefer_stolen(&xe->drm, plane_config->size)) {
+		    !xe_display_bo_fbdev_prefer_stolen(xe, plane_config->size)) {
 			drm_info(&xe->drm, "Initial FB size exceeds half of stolen, discarding\n");
 			return NULL;
 		}
-- 
2.47.3

