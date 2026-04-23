Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC651FDEE2C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 16:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596F110F1E6;
	Thu, 23 Apr 2026 16:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEOIdgnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68D710F1CC;
 Thu, 23 Apr 2026 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776963262; x=1808499262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VR9cz6rnD8gyZ/WUfIdE2KbteQrUBTGYcNtajVtJMDk=;
 b=jEOIdgnGec3Ghilg4LWXyDjKUAfOQFm8aW6iGKh3BDGx7mpW2HQOgt+u
 IirhYQLOyd7cgKaQbviiQQyoTvogXOcjn5i5qY+4zPzABRS3U3y4AB96h
 VHVz4AgmA/cL1U7J5/VuuBdq+/7RGJ1Iu307JRXlCAXVEjB/mA6t8Q2s8
 egxVEBBy0qw3sUkpHRoOKC2pqBVlnrck3adcEPvz2S2N5+fyenUljD99K
 o7JsD9HZFpZVHS0kA370X/krz1li2RRVHS3uz7NCZuIdjeOG0izGqjf3i
 uwSYhArAemyz6GTmIsZ7UZF+gHA59lLpj71OulK1xJ+4P8/FttEz0R0O7 A==;
X-CSE-ConnectionGUID: yC35G3a9S12s3G3k9eDDuw==
X-CSE-MsgGUID: EKNpmYG1QYyZzqExiiLvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81799479"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="81799479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:22 -0700
X-CSE-ConnectionGUID: 7B7cxmKaTyW9F0ejlME0Lw==
X-CSE-MsgGUID: kkKscKazTCawewxQ3P81jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232560085"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 09:54:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/16] drm/xe: Move the FORCE_WC assert into __xe_pin_fb_vma()
Date: Thu, 23 Apr 2026 19:53:36 +0300
Message-ID: <20260423165346.20884-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No need to bother the higher level pinning code with the
FORCE_WC assert. Move it into the lower level function.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index afb6cdda537e..487c092cd000 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -329,6 +329,9 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
 	struct drm_exec exec;
 	int ret = 0;
 
+	/* We reject creating !SCANOUT fb's, so this is weird.. */
+	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
+
 	if (!vma)
 		return ERR_PTR(-ENODEV);
 
@@ -466,7 +469,6 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 {
 	struct drm_framebuffer *fb = new_plane_state->hw.fb;
 	struct drm_gem_object *obj = intel_fb_bo(fb);
-	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct i915_vma *vma;
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
 	struct intel_fb_pin_params pin_params = {
@@ -478,9 +480,6 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 	if (reuse_vma(new_plane_state, old_plane_state))
 		return 0;
 
-	/* We reject creating !SCANOUT fb's, so this is weird.. */
-	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
-
 	vma = __xe_pin_fb_vma(obj, intel_fb_uses_dpt(fb), &pin_params);
 
 	if (IS_ERR(vma))
-- 
2.52.0

