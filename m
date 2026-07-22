Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C87C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 13:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527B10E2C9;
	Wed, 22 Jul 2026 13:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMDL490M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34FD10E2C9;
 Wed, 22 Jul 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784726703; x=1816262703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6+SPJDQ23mfrQUOkxvdMZnB1pvsuvK21pJlf+NE2sp0=;
 b=HMDL490MbZQwdYvxhgFANpobwIGBbrQgbmoDeZ3liONlLl5a6b3AfBva
 w+RxHUy+CPoHxDWrH6YBoZL1Qpp+FtjFycSJaEvhW8HmqoyVuJotkifkT
 aZ9qkp3sbbHllA3ul061ioc3+QpfxyW81uk0ULHkq89nwFXqUdMjsP/R/
 en41SjCz/JeKnwJHZFg0N/peK0EUCHO3AkKzxEQgsSLzeFSQqT8eEgOiP
 YTAUHSB4noIXXAvTQFJ4JPmpqSdZrBb2caXB60ydboUkMoKpS28pOldNO
 tF9IJUF4UQ4UG0dZZEn7NeIMPTevcmN1pkyLJGuS9y0XLLTLVrQVWSFdQ Q==;
X-CSE-ConnectionGUID: KcXz4uIZSMasU8Brq8movw==
X-CSE-MsgGUID: 0IBg4aiVSqWwrCHntngM0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96016986"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96016986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:03 -0700
X-CSE-ConnectionGUID: EHzJ5JFLSKWwAuF07N7Ejg==
X-CSE-MsgGUID: UuMf6haJQ32oxAvkZ1vofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254687762"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.191])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:25:01 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@linux.intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 1/3] drm/xe/display: Expose plane max width/height helpers
 to global scope
Date: Wed, 22 Jul 2026 16:24:46 +0300
Message-ID: <20260722132448.318112-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
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

Enabling features like FBC on platforms may depend on a plane's
maximum supported resolutions or some other arbitrary constant
values because of hw restrictions. Currently the helpers that
report a plane's max width and height are private to skl_plane
/ skl_universal_plane. Change the scope to golbal so that
this can be queried from other areas as well.

v2: function parameter alignment fixes

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/skl_universal_plane.c   | 16 ++++++++--------
 .../gpu/drm/i915/display/skl_universal_plane.h   |  9 +++++++++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 164b7d61c9a3..77d33012bdde 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1932,10 +1932,10 @@ static int intel_plane_min_height(struct intel_plane *plane,
 	return 1;
 }
 
-static int intel_plane_max_width(struct intel_plane *plane,
-				 const struct drm_framebuffer *fb,
-				 int color_plane,
-				 unsigned int rotation)
+int intel_plane_max_width(struct intel_plane *plane,
+			  const struct drm_framebuffer *fb,
+			  int color_plane,
+			  unsigned int rotation)
 {
 	if (plane->max_width)
 		return plane->max_width(fb, color_plane, rotation);
@@ -1943,10 +1943,10 @@ static int intel_plane_max_width(struct intel_plane *plane,
 		return INT_MAX;
 }
 
-static int intel_plane_max_height(struct intel_plane *plane,
-				  const struct drm_framebuffer *fb,
-				  int color_plane,
-				  unsigned int rotation)
+int intel_plane_max_height(struct intel_plane *plane,
+			   const struct drm_framebuffer *fb,
+			   int color_plane,
+			   unsigned int rotation)
 {
 	if (plane->max_height)
 		return plane->max_height(fb, color_plane, rotation);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.h b/drivers/gpu/drm/i915/display/skl_universal_plane.h
index 5e2451c21eeb..ad71105cc55a 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.h
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct drm_framebuffer;
 struct intel_crtc;
 struct intel_display;
 struct intel_initial_plane_config;
@@ -42,5 +43,13 @@ bool icl_is_hdr_plane(struct intel_display *display, enum plane_id plane_id);
 
 u32 skl_plane_aux_dist(const struct intel_plane_state *plane_state,
 		       int color_plane);
+int intel_plane_max_width(struct intel_plane *plane,
+			  const struct drm_framebuffer *fb,
+			  int color_plane,
+			  unsigned int rotation);
+int intel_plane_max_height(struct intel_plane *plane,
+			   const struct drm_framebuffer *fb,
+			   int color_plane,
+			   unsigned int rotation);
 
 #endif
-- 
2.43.0

