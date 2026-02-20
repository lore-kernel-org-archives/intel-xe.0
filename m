Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D69C5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79FF10E827;
	Fri, 20 Feb 2026 17:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDJT4dD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7A10E824;
 Fri, 20 Feb 2026 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771607378; x=1803143378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tE83o+0vHZoV1h8NYWmZ1xMd2eWaWZIjQQvimWSKj5g=;
 b=UDJT4dD4Wm42TyKgKSv6tEVWl3Sx3JmBhw+pfA1OtwWk249ww44B3gyN
 A51QtVpzVgRy8ZxTgeAr8TNx9Ni1Zqx9jQHWhM0YLOM/JNhZjL/sr57wi
 7W0uDLZbh+ObTXQQtuyudeidOtuTUYUYYyevU0L1AY1TU9GZBMbHn4nIC
 GSULrm2tKgFpjmwjUCLDBkPJfFVqCS6i22+zx4gpuvnaRiRqFszaHatlD
 wmslh/dwCMukVmYfaIN3b0rwadXTmtqaAJIatwvyJi3sYtXT4ipkGDh8v
 mKJBJA9FSvaQioTGKhqBUsT+MmqxsWrkX8/gzkDrgvqGePIwjSwPFE22B g==;
X-CSE-ConnectionGUID: IToimD0GTySAcRl2Ov5qrQ==
X-CSE-MsgGUID: 9F4iX8LbQSKKs1gZaCV91w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98164384"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98164384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:09:38 -0800
X-CSE-ConnectionGUID: XMtQTLIQQZWl2TliGwTHcw==
X-CSE-MsgGUID: i6VRwjQHSfun/g0ix2fG9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237864017"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.18])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:09:36 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH v2 5/6] drm/xe/fbdev: print info about stolen memory
 preference for fbdev
Date: Fri, 20 Feb 2026 19:09:07 +0200
Message-ID: <20260220170908.201422-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220170908.201422-1-vinod.govindapillai@intel.com>
References: <20260220170908.201422-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

If stolen memory cannot be allocated for the fbdev and initial plane
bo because of the preference for fbc, have an info about that in
the log.

v2: log text changed

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 2 ++
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 4673614cd224..87af5646c938 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -63,6 +63,8 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
 			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
+	} else {
+		drm_info(&xe->drm, "Allocating fbdev: Stolen memory not preferred.\n");
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 13fdc51f8f50..c46e9d8115bd 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -92,8 +92,10 @@ initial_plane_bo(struct xe_device *xe,
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-		    !intel_fbdev_fb_prefer_stolen(&xe->drm, plane_config->size))
+		    !intel_fbdev_fb_prefer_stolen(&xe->drm, plane_config->size)) {
+			drm_info(&xe->drm, "Initial FB size exceeds half of stolen, discarding\n");
 			return NULL;
+		}
 	}
 
 	size = round_up(plane_config->base + plane_config->size,
-- 
2.43.0

