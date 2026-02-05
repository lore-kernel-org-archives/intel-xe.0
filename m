Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E9EC1EBE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5480C10E8CB;
	Thu,  5 Feb 2026 14:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObhSJqPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F8A10E8CC;
 Thu,  5 Feb 2026 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770300187; x=1801836187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbSk6PIImF/XHbEOIt24lxdMW9tAIQjLjfXtsIR/ibc=;
 b=ObhSJqPNmLyQSxqMLbr+WSnvRyczYyAhD1han9WFcPwXMTMBigEHzmN8
 PJq9XSMkYJgVea0P4uNTjMASK1GegHi8hf96RidwjHBVFRn5e2k+yYdGs
 dvUdGPa9LhsHvAg6/KjEdo8AR9WrWU8ajcMPAqZqyQGeSNGhBBUFvCrZn
 WQpwV7G/avGE3y0IiVF/UwVIeGmGUKncb2Es44PVWn3vMjfdhsVF5Ur9w
 XwaxyyUUzaln73uHipu9ipa80KplGZg037XE4VlBhPe355vNvt6RapiU+
 CSfxDrWe4KrFztAsCj3KiM0X2+RcHy5mVPLei8+xKaDVvO6D6kESm4lJ4 Q==;
X-CSE-ConnectionGUID: KSasbe7ERqGYaAW88gu/TQ==
X-CSE-MsgGUID: RTxpf9otQPC0vM2p6n5fEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75351001"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75351001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:03:07 -0800
X-CSE-ConnectionGUID: cdy4dtPnR2u+YAYfXFdrtQ==
X-CSE-MsgGUID: i0uQcTiHTOiTw5r5Y1WAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215508907"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.157])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:03:06 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH 5/6] drm/xe/fbdev: print info about stolen memory preference
 for fbdev
Date: Thu,  5 Feb 2026 16:02:34 +0200
Message-ID: <20260205140235.338410-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205140235.338410-1-vinod.govindapillai@intel.com>
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
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

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 2 ++
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index b713d101953f..f605998c74fd 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -65,6 +65,8 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
 			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
+	} else {
+		drm_info(&xe->drm, "Stolen memory is not preferred for the fbdev.\n");
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 28b612bf21d2..1caef978c76b 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -92,8 +92,10 @@ initial_plane_bo(struct xe_device *xe,
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
-		    !intel_fbdev_fb_prefer_stolen(xe->display, plane_config->size))
+		    !intel_fbdev_fb_prefer_stolen(xe->display, plane_config->size)) {
+			drm_info(&xe->drm, "Stolen memory is not preferred for the initial plane bo.\n");
 			return NULL;
+		}
 	}
 
 	size = round_up(plane_config->base + plane_config->size,
-- 
2.43.0

