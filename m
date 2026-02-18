Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97882E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDD810E5D9;
	Wed, 18 Feb 2026 15:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdoLnEtv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729810E5E3;
 Wed, 18 Feb 2026 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428525; x=1802964525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEZnmR4Dc7S5LjvywE877rUJxjgIKFUwq4I0NQrIhdY=;
 b=XdoLnEtvknNeJTJ48WIMBL+8M0ZPTHdr34JAK4ltsXp3swJaGKZSYPIE
 93YdRJxu5dn4O5vWhmJ7SOZftFZT15F7uUIGd0yNVmAl9jpAPw5YdhDan
 OHVJN5fIrzeh21crFPxek96614v8B419eZL0ldP1zu+wFPJnyHFp7Hr2D
 MruokNO4duBC2djStkvmsUX+yknHCZyTUMgpYn285Ryq9igK6t36631I0
 yPqbo+lEkX1lk7U+ODI4Ayj33GpL64ZZVCC7LYzsukLByhMz2KYA8p4H/
 UYc/ZI3B2pA2LNQtLlf/CzFGKC9VG/A0tFhfKlYVuprlRGNUjkW2lNFUp w==;
X-CSE-ConnectionGUID: f7jBKrwGS9SC6vWhk0i4XA==
X-CSE-MsgGUID: M/LmmJG2Tbq0bzoVdlO3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60084468"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="60084468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:45 -0800
X-CSE-ConnectionGUID: 3xZnkriNRhSQSwFR/+6bfg==
X-CSE-MsgGUID: 8q0W52y0Qiu5GLaJOV45AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="218756639"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/19] drm/i915/overlay: Extract i915_overlay_reset()
Date: Wed, 18 Feb 2026 17:27:55 +0200
Message-ID: <20260218152806.18885-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

overlay->frontbuffer_bits tracking will move to the i915 side
of the parent vs. display driver split, so extract the reset
part of that into a new function (i915_overlay_reset()).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 88316c585656..8c1ed540a8e3 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -496,6 +496,17 @@ static int intel_overlay_release_old_vid(struct intel_overlay *overlay)
 	return i915_active_wait(&overlay->last_flip);
 }
 
+static void i915_overlay_reset(struct drm_device *drm)
+{
+	struct intel_display *display = to_intel_display(drm);
+	struct intel_overlay *overlay = display->overlay;
+
+	if (!overlay)
+		return;
+
+	overlay->frontbuffer_bits = 0;
+}
+
 void intel_overlay_reset(struct intel_display *display)
 {
 	struct intel_overlay *overlay = display->overlay;
@@ -506,7 +517,8 @@ void intel_overlay_reset(struct intel_display *display)
 	overlay->old_xscale = 0;
 	overlay->old_yscale = 0;
 	overlay->crtc = NULL;
-	overlay->frontbuffer_bits = 0;
+
+	i915_overlay_reset(display->drm);
 }
 
 static int packed_depth_bytes(u32 format)
-- 
2.52.0

