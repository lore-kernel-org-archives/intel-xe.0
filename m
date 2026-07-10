Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A7CC44506
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB8E10F86F;
	Fri, 10 Jul 2026 11:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ivu0UtjB";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30310F86F;
 Fri, 10 Jul 2026 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682097;
 bh=VKp7JmQs37vESgep6V4fNy1EmKEJw2SoLGZk9/klYr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ivu0UtjBH9IB2TxJ72iNOoAGBRrGPMOFngB1wXnWFi51OSpv+4qQcXDFRNYvMRvRh
 1wRZcE/cwo9oe8PBzdn4WRV/pKQ91s1FsdK2SHCmdZs6FIZFhuE4zLo5pPaSp35ZVQ
 JxdGQ8642+bXnuzX+5C++fkV8DG2DHS9VgJKZTPnWJwWUtGRZ3lFA1uo5k5ogRoHc5
 DW82gB/tQlhzszp23IfO2SwAlSD//Sj7ybXuX2lQv0IvrtmpczmFu9WdzoIveK3yzG
 w0WOvj2TdFfids11gjf4iZ9taBBHi7DYFpT+UnnT4otiEG+mW8po59NLnuBuN4nJio
 vko/CLdLzVb9g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 03/11] drm/i915: Throw away the BIOS fb if has the wrong
 depth/bpp
Date: Fri, 10 Jul 2026 13:15:30 +0200
Message-ID: <20260710111539.1274555-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Respect the user's choice of depth/bpp for the fbdev framebuffer
and throw out the fb we inherited from the BIOS if it doesn't
match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-4-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index bc267776106e8..db0e36dd8722f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -268,6 +268,8 @@ static bool bios_fb_ok(const struct intel_framebuffer *fb,
 	struct intel_display *display = to_intel_display(fb->base.dev);
 	int width = fb->base.width;
 	int height = fb->base.height;
+	int depth = fb->base.format->depth;
+	int bpp = fb->base.format->cpp[0] * 8;
 
 	if (sizes->fb_width > width || sizes->fb_height > height) {
 		drm_dbg_kms(display->drm,
@@ -276,6 +278,13 @@ static bool bios_fb_ok(const struct intel_framebuffer *fb,
 		return false;
 	}
 
+	if (sizes->surface_depth != depth || sizes->surface_bpp != bpp) {
+		drm_dbg_kms(display->drm,
+			    "BIOS fb using wrong depth/bpp (%d/%d), we require (%d/%d), releasing it\n",
+			    depth, bpp, sizes->surface_depth, sizes->surface_bpp);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.53.0

