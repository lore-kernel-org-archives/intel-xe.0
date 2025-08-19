Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D2CA0EED
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 14:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDBC10E610;
	Tue, 19 Aug 2025 14:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qQERsNWL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB3D10E61B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8KYMRFWP3vVZkbF1S2tFKsaGM6iZPbMrNHf7rhSki2g=; b=qQERsNWLh3K5LFEZfNonDqbiFP
 mjN0vSsN2bd79q5olr5TN8jOxmIF1koyL4rZGgmrvMWJuq5UkvVMJzD5dFGxcMMY3XXhaby79QHdL
 zQhloGVgTuA8cMQGzHYbLKKAoOEtH2ZUmc15gbKRiHf4MyfLevNvh5ylWDXp8F/4re+DkCCgBXI+B
 NlMq6Woi4taklR55tlcSQ3tfsR1czu2roWxPUK0BYRymrNpeGa0BuDugpSgLpsboYHV+s5yIr/O9P
 mfydH4gIQ+T3WBsqyo8tY2S97oemf+JqSbc5SHWxyahsyIMzJ7BLsbaqNSkUReSeEvG7Dl9ifWKtQ
 eMMFvQmQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoNTr-00GLCt-Nf
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 16:38:31 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 13/13] drm/i915/display: Expose AuxCCS frame buffer modifiers for
 Xe
Date: Tue, 19 Aug 2025 15:38:20 +0100
Message-ID: <20250819143821.3158-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
References: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
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
index 950dc79dbdd4..a26a42464791 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2928,12 +2928,6 @@ skl_universal_plane_create(struct intel_display *display,
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

