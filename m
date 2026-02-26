Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F7FC5910
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF5910E8B1;
	Thu, 26 Feb 2026 10:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7AVCrH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2610E8B1;
 Thu, 26 Feb 2026 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100485; x=1803636485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlRfQjBTAD4fTZ9wVv8rvoeclypSQmHHr8R+OIxF4Hc=;
 b=c7AVCrH91aQLPSuIC49wE/so6qywe+IvlQFowOnBvCjD/5uVQM7NxC2V
 VFItU8wwU/AH6iSD2ZXqusnICnmpBfweIE9znVKOsE3rwxXxDodfnHw36
 melXt7RlBWIyg6H4wiYKFvemiIX+j4JEtXkNO8aKsBP7HwlLL/8UUhW2l
 /9P7a4p6xiTtiMOBteX7GZzJeTKzOpD33c5zwBuOy2GoeUQIgrimaO2eb
 +uwp2ifUNa6QK/ZJp3ZGRsfLEXwXPU9bDA669hIPgDvp0Onda6q5IdFZh
 R3wJyNG6+gPiNL0NTr1iAaBu9J6cQr/fVSmUSoYaMoYUs/LAUdZtO1PUK g==;
X-CSE-ConnectionGUID: 3CltV1BHRjukbd7atbAkcQ==
X-CSE-MsgGUID: rUQ46G5NQ8asAfungXUjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83866887"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83866887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:05 -0800
X-CSE-ConnectionGUID: 0SrlXf35RQKxEVyxUmjlEQ==
X-CSE-MsgGUID: RaSR9k/7RUCZdzaEnQVZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216533082"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:03 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/19] drm/i915/overlay: Relocate the underrun check
Date: Thu, 26 Feb 2026 12:07:24 +0200
Message-ID: <20260226100738.29997-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
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

Move the underrun check out from intel_overlay_continue()
so that the DOVSTA register access can stay on the display
side of the parent vs. display driver split.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index b2458840dfc4..8c6e9c19b3f5 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -331,18 +331,13 @@ static int intel_overlay_continue(struct intel_overlay *overlay,
 	struct intel_display *display = overlay->display;
 	struct i915_request *rq;
 	u32 flip_addr = overlay->flip_addr;
-	u32 tmp, *cs;
+	u32 *cs;
 
 	drm_WARN_ON(display->drm, !i915_overlay_is_active(display->drm));
 
 	if (load_polyphase_filter)
 		flip_addr |= OFC_UPDATE;
 
-	/* check for underruns */
-	tmp = intel_de_read(display, DOVSTA);
-	if (tmp & (1 << 17))
-		drm_dbg(display->drm, "overlay underrun, DOVSTA: %x\n", tmp);
-
 	rq = alloc_request(overlay, NULL);
 	if (IS_ERR(rq))
 		return PTR_ERR(rq);
@@ -810,6 +805,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	bool scale_changed = false;
 	struct i915_vma *vma;
 	int ret, tmp_width;
+	u32 tmp;
 
 	drm_WARN_ON(display->drm,
 		    !drm_modeset_is_locked(&display->drm->mode_config.connection_mutex));
@@ -895,6 +891,11 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 
 	iowrite32(overlay_cmd_reg(params), &regs->OCMD);
 
+	/* check for underruns */
+	tmp = intel_de_read(display, DOVSTA);
+	if (tmp & (1 << 17))
+		drm_dbg(display->drm, "overlay underrun, DOVSTA: %x\n", tmp);
+
 	ret = intel_overlay_continue(overlay, vma, scale_changed);
 	if (ret)
 		goto out_unpin;
-- 
2.52.0

