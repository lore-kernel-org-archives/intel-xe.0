Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74F5CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812BC10FD5A;
	Wed, 14 Oct 2026 12:06:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB85110FD2E;
 Wed, 14 Oct 2026 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979554; x=1823515554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDo8uHdtnyFD6ptbUBrafd3RaVJ+Jfw8sH1jCYrl2S0=;
 b=XpkxvH2xOlD1htBLrRkyrZSmnEYAhi1+7i8vUZfVBRTmgEYkvDDtcXco
 5cx9yxT/LeQuQUgrBX42KDsaA32m7olL+tNcodXbA60AZ62A4CTnu88JE
 u1GbsMfr45YpyxGGx0r6p/Kn5AkmJTLFjbni9FJRmJtArqznj+HC3BTIk
 htQdRCuukQyetdVH5mYgJAigm/AZopdGlfC0jHS8fCBFn7ilkSBl8z/dX
 yj0DNavHSI05QKflINmqDnReU7SwCYJhNWDUuFx2ISaykgzA9ndamS6l2
 5xoywWJ/Xw1XbObnoanQ/aEp3KD8egcFk6sgwC5SMHQqnGpZwwMu++scS g==;
X-CSE-ConnectionGUID: Kd8AmBKeTwekiLmCIlt4DQ==
X-CSE-MsgGUID: 2v+9XqGuTcaMWrms5IUXGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739796"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="739796"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:54 -0700
X-CSE-ConnectionGUID: kj0mrbpJQuWzwgJGlKhVWA==
X-CSE-MsgGUID: nNkUAjmrTAmSd99s+1/trg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1736783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Modernize PIPEFRAMEHIGH/PIPEFRAMEPIXEL bits
Date: Wed, 14 Oct 2026 15:05:38 +0300
Message-ID: <20261014120542.29675-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
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

Define the contents of PIPEFRAMEHIGH/PIPEFRAMEPIXEL using
the modern REG_GENMASK() stuff.

For the actual frame counter read we combine the registers
into a single 64bit value and then extract the frame
counter value from it, so we also need a combined 64bit
PIPE_FRAME_MASK definition as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_vblank.c       |  9 ++++++---
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index c868a71a5c9b..2f509bd06557 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1090,15 +1090,15 @@
  */
 #define _PIPEAFRAMEHIGH          0x70040
 #define PIPEFRAMEHIGH(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPEAFRAMEHIGH)
-#define   PIPE_FRAME_HIGH_MASK    0x0000ffff
-#define   PIPE_FRAME_HIGH_SHIFT   0
+#define   PIPE_FRAME_HIGH_MASK	REG_GENMASK(15, 0)
 
 #define _PIPEAFRAMEPIXEL         0x70044
 #define PIPEFRAMEPIXEL(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPEAFRAMEPIXEL)
-#define   PIPE_FRAME_LOW_MASK     0xff000000
-#define   PIPE_FRAME_LOW_SHIFT    24
-#define   PIPE_PIXEL_MASK         0x00ffffff
-#define   PIPE_PIXEL_SHIFT        0
+#define   PIPE_FRAME_LOW_MASK	REG_GENMASK(31, 24)
+#define   PIPE_PIXEL_MASK	REG_GENMASK(23, 0)
+
+/* frame counter mask for a combined 64bit value */
+#define   PIPE_FRAME_MASK	((u64)PIPE_FRAME_HIGH_MASK << 32 | PIPE_FRAME_LOW_MASK)
 
 /* GM45+ just has to be different */
 #define _PIPEA_FRMCOUNT_G4X	0x70040
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index f16988cd5321..a01be2e34bc9 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -112,8 +112,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	frame = intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display, pipe),
 					      PIPEFRAMEHIGH(display, pipe));
 
-	pixel = frame & PIPE_PIXEL_MASK;
-	frame = (frame >> PIPE_FRAME_LOW_SHIFT) & 0xffffff;
+	pixel = REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
+	frame = REG_FIELD_GET64(PIPE_FRAME_MASK, frame);
 
 	/*
 	 * The frame counter increments at beginning of active.
@@ -388,12 +388,15 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 		 */
 		position = __intel_get_crtc_scanline(crtc);
 	} else {
+		u32 val;
+
 		/*
 		 * Have access to pixelcount since start of frame.
 		 * We can split this into vertical and horizontal
 		 * scanout position.
 		 */
-		position = (intel_de_read_fw(display, PIPEFRAMEPIXEL(display, pipe)) & PIPE_PIXEL_MASK) >> PIPE_PIXEL_SHIFT;
+		val = intel_de_read_fw(display, PIPEFRAMEPIXEL(display, pipe));
+		position = REG_FIELD_GET(PIPE_PIXEL_MASK, val);
 
 		/* convert to pixel counts */
 		vbl_start *= htotal;
-- 
2.55.0

