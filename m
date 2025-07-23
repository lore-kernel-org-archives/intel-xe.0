Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B493C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3411C10E7A2;
	Wed, 23 Jul 2025 10:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fZCD41X3";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5207210E7B0
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RaaUMUsxxzizb9Ja7wxucy0vhAu4aINwG8A3ET7mhzc=; b=fZCD41X3asSobY1xgb2K3qnbnK
 RABjhn7QK1FXtP7oAZIGikYHJMSTAKm0DaEnrlMlL2OVPYG4bSkjTAHVCe8mF9p8k/vTCtVWPzzzu
 W1t5OXJ2LE/qzARD9g3/KoVc7g5PoMolgRIJpFwy52OO8slvH2G6DuPA7/ZnoPxZyKAf0mCKU5DI4
 D8otOlTShPPtzhGQ1emKOIile7SvZzb2PzM1wXrmhMiHs/6F2xQynDG25v15KUCt2w+7XW52gfsRt
 3R8Wsnn+Pj14GZQE5UG5d7s0UrYw3gpYU55Ca+QYAImPEsrbn+SOEVPdeg4Oc/dDFLbduICg12iEX
 K1zK7Tjw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueWhS-002XzS-Jm
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:27:50 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 14/14] drm/i915/display: Expose AuxCCS frame buffer modifiers for
 Xe
Date: Wed, 23 Jul 2025 11:27:36 +0100
Message-ID: <20250723102739.50425-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
References: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
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

Now that we have fixed the DPT handling we can undo the nerf which was
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if
built for Xe").

Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:

	[PLANE:32:plane 1A]: type=PRI
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
		hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

Display working fine - no artefacts, no DMAR/PIPE faults.

v2:
 * Adjust patch title. (Rodrigo)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ec3fe75f2c6c..9d2475093f40 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2927,12 +2927,6 @@ skl_universal_plane_create(struct intel_display *display,
 	else
 		caps = skl_plane_caps(display, pipe, plane_id);
 
-	/* FIXME: xe has problems with AUX */
-	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(to_i915(display->drm)))
-		caps &= ~(INTEL_PLANE_CAP_CCS_RC |
-			  INTEL_PLANE_CAP_CCS_RC_CC |
-			  INTEL_PLANE_CAP_CCS_MC);
-
 	modifiers = intel_fb_plane_get_modifiers(display, caps);
 
 	ret = drm_universal_plane_init(display->drm, &plane->base,
-- 
2.48.0

