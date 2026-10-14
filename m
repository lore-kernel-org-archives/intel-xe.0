Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB9CCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89A810FD3A;
	Wed, 14 Oct 2026 12:05:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9610FD2C;
 Wed, 14 Oct 2026 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979551; x=1823515551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=REMPzTjXPdR/aGi72tB8l8UhqIznGteEg3e52Lq+67A=;
 b=lIUwFeKC54OkIyRKpWs9ShGSwd449jvtrbPB38ao3w8V6ZAQot2McGly
 Z/MhRdC77tmHJPlfSsBtdDEe6T9jnSGTOf2LY66ttTkGToZa9N74Dx96F
 fX8YK2V3K2bEV68ZCQt2jaHpH5cprCjc3RWEjFTHHNXzjo53/BZ0u+M3s
 ilU+fhhoC1nVXy/IV3odnzcd2nmybGiPWojEfbIbEApxrE+KwS1iDiUyW
 wAXg3P4WstTqRAc4CE9TP/ATvZ4RNpwwowVlw4d8Nn+naKo+3HIfHOI9/
 gmXH3uNkpzGxq3q/YynmRu3jpHjsRT7vYMwk+LdPoyCSIig4VDwdmW2fA g==;
X-CSE-ConnectionGUID: H8IVtiFESOGTk5M0k4TyJA==
X-CSE-MsgGUID: jcsoFIQIQ/2MoGPUQfzA+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739795"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="739795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:51 -0700
X-CSE-ConnectionGUID: xvAE8EnNQ0S/vHZZ14rP5A==
X-CSE-MsgGUID: EmTjhROrR2u/AAu0PVxtQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1736778"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:49 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915: s/PIPEFRAME/PIPEFRAMEHIGH/
Date: Wed, 14 Oct 2026 15:05:37 +0300
Message-ID: <20261014120542.29675-2-ville.syrjala@linux.intel.com>
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

Rename PIPEFRAME to PIPEFRAMEHIGH to match the spec, and
better convey what the register contains.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 8251ec15190b..c868a71a5c9b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1089,7 +1089,7 @@
  *  frame = (high1 << 8) | low1;
  */
 #define _PIPEAFRAMEHIGH          0x70040
-#define PIPEFRAME(dev_priv, pipe)		_MMIO_PIPE2(dev_priv, pipe, _PIPEAFRAMEHIGH)
+#define PIPEFRAMEHIGH(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPEAFRAMEHIGH)
 #define   PIPE_FRAME_HIGH_MASK    0x0000ffff
 #define   PIPE_FRAME_HIGH_SHIFT   0
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 28d81199792e..f16988cd5321 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -110,7 +110,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	 * register.
 	 */
 	frame = intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display, pipe),
-					      PIPEFRAME(display, pipe));
+					      PIPEFRAMEHIGH(display, pipe));
 
 	pixel = frame & PIPE_PIXEL_MASK;
 	frame = (frame >> PIPE_FRAME_LOW_SHIFT) & 0xffffff;
-- 
2.55.0

