Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BACCD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 12:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3001010EEE7;
	Thu, 11 Jun 2026 12:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c99xH++O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4FE10EEE7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781181659; x=1812717659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VonY27CjAIrfX2EbSWuq4+77AwLNGXLDN/uISvcUbgo=;
 b=c99xH++Ol7GJbhFoj7PZTJlricWoFlDX50Q7/63nL1j/ilF2HrYkd7cc
 KDCZAFh0awkydptFzrrlTKMsZ+udMMCWhn+8ns8sGYCoREDIqA6CjFenE
 GCyMsLtrOm7ZMT9aDg7JcaE4th/CjCTpP+LEluz3gO6cRqtIpt4aTCmIX
 O9ni+cw8Gp1WfH5bXEFai5fix8qu/WBmYmUiQ1SZduWSmtttChVUXCQ+E
 AMMTwmD7qp8WgKrQcr0XR2w7j1cMkJYVueGPqHuKVX+pwMGVWv5yGwYTA
 TPtvGDat0/FuAy0V5//hkdl2yI9rBKEdVQ6Voej8sx+2RhjAwpoAjd6Zy Q==;
X-CSE-ConnectionGUID: NO+0OlmjTK+NWncPWz3epw==
X-CSE-MsgGUID: BvR19vlSTZG22Zm7Qxdvxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85831309"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="85831309"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 05:40:58 -0700
X-CSE-ConnectionGUID: cGnRuhBaQy61xeZ/qR9lAQ==
X-CSE-MsgGUID: XQvQJE/UQTiVv4ZV0hxTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="246497929"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by orviesa009.jf.intel.com with ESMTP; 11 Jun 2026 05:40:55 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pf: Disable display in admin only PF mode
Date: Thu, 11 Jun 2026 12:42:06 +0000
Message-ID: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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
---
 drivers/gpu/drm/xe/xe_device.c | 2 --
 drivers/gpu/drm/xe/xe_pci.c    | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 51e3a2dd7b22..9c02e0e314c7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -426,7 +426,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
 
 static const struct drm_driver admin_only_driver = {
 	.driver_features =
-	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM | DRIVER_RENDER,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
@@ -438,7 +437,6 @@ static const struct drm_driver admin_only_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-	XE_DISPLAY_DRIVER_OPS,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6..6fd882443fa5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -789,7 +789,9 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
-				 desc->has_display;
+				 desc->has_display &&
+				 !xe_device_is_admin_only(xe);
+
 	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	xe_assert(xe, desc->max_gt_per_tile > 0);
-- 
2.43.0

