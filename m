Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C171C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 05:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5E10E685;
	Tue, 14 Jul 2026 05:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4z7ij73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC06F10E685
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 05:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784007090; x=1815543090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AI0IyB6WX+lei5a0wY5hQz0MbpmUQAmZXZNYohR16yw=;
 b=c4z7ij733Sd6KWQ0RdsiBkPLa1ocre7+kyVgYqY+YV9sgAVs+j+SfOjZ
 30PYXa+y7e+LuPen6AXeKZnJLtrJ8ueeF2p/cOX6UZ39krL/U0yHsOQIa
 JpgMEXY5IZQx62WlyrhtV04K+e1NW26/RzVZWJz3FEcmoi7OwgNoc6PoU
 F520flrJcAJUa5+m+9CUQT4vaRbAERUAE8SYRqg4ddYD0H1Hd2VTrcz1g
 kgfYmgMgTuBl2cMWirTq/4lVdS+jV0PvM4/1s+dxThMd8d6xCqxcQdc0g
 9o6o+jlf3qkhK0qmJgdX+euMz0w+zmXVpO/VxdMx1cOo40LCrXf57OfFy w==;
X-CSE-ConnectionGUID: Agnt8bkERs6bYt8MPVrsuQ==
X-CSE-MsgGUID: bqALSccnRrSQJjNUUiyTKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83742052"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="83742052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 22:31:30 -0700
X-CSE-ConnectionGUID: M4yaY3UcRcSGn7Hp/6yvXg==
X-CSE-MsgGUID: qQj9f3khQ0m07xrPJ++zOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="249393550"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa009.fm.intel.com with ESMTP; 13 Jul 2026 22:31:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/pf: Disable display in admin only PF mode
Date: Tue, 14 Jul 2026 11:03:00 +0530
Message-ID: <20260714053259.504308-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Admin-only PF mode does not expose media or 3D execution capabilities
to userspace, so display pipelines cannot receive rendered content.

Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin-only PF mode")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

---
V2 -> V3:
- Missed RB while resolving rebase conflicts. Fixed it.

V1 -> V2:
- Rebased to resolve merge conflicts.
---
 drivers/gpu/drm/xe/xe_device.c | 2 --
 drivers/gpu/drm/xe/xe_pci.c    | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ad7f3e61d457..785222d54701 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -427,7 +427,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
 
 static const struct drm_driver admin_only_driver = {
 	.driver_features =
-	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM | DRIVER_RENDER,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
@@ -439,7 +438,6 @@ static const struct drm_driver admin_only_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	XE_DISPLAY_DRIVER_OPS,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a3b968bccd40..3133e1b99565 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -822,7 +822,8 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-				 desc->has_display;
+				 desc->has_display &&
+				 !xe_device_is_admin_only(xe);
 
 	xe_assert(xe, desc->max_gt_per_tile > 0);
 	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
-- 
2.53.0

