Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF27CCD1BC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 07:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A564A10E6D1;
	Wed, 22 Oct 2025 07:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HmEpeRZq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5815910E030
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c/GuzWf88a8qpLh/ovVFIIUIXGTSQo6ekk35ZcMMHNA=; b=HmEpeRZqVUFpfhMSoKCi1omKW7
 MXnkwnC4SgCvBkQty8GlyhLFIQH2dcaVkXdp+0GDwgRc6zFUWrV34Fyvb6U+RRLs3dgEjV4ubhquT
 N+FNNWC1Vr7GejrOuC2npQndLK+yaWUfIm/97eJ9skejmR4ZRBk7JKAtNcSTt8M61JxvrssUzGi1z
 1HgPruh8VxLlccVEtm+es50mu8MuIlue3GjUL+nlEPHaLIBiH16s1O4ov+0ehxjFVRVfRlpLYoUlS
 oBkf/aWvbhn9BDQ5XU3AHtwmdOF5vr+/Ukky81hcvc2o18hm+TdXUfsfVRKrlJARyKcSq+Ywr/PU9
 LOV2ujxg==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vBTIR-00Csvs-LK
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:30:11 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 01/13] drm/xe: Fix ggtt fb alignment
Date: Wed, 22 Oct 2025 08:29:53 +0100
Message-ID: <20251022073010.71285-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251022073010.71285-1-tvrtko.ursulin@igalia.com>
References: <20251022073010.71285-1-tvrtko.ursulin@igalia.com>
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

Pass the correct alignment from intel_fb_pin_to_ggtt() down to
__xe_pin_fb_vma().

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1fd4a815e784..b18d15cc3c53 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -378,7 +378,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 {
 	*out_flags = 0;
 
-	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, phys_alignment);
+	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, alignment);
 }
 
 void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
-- 
2.48.0

