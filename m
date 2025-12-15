Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF97D5B843
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A978D10E59A;
	Mon, 15 Dec 2025 15:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="eU7wtcT6";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4810E555;
 Mon, 15 Dec 2025 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765813667;
 bh=Bne1RUVyYhtMfwYqK3Ip48zVZdJr+u55XTL2YPV9fWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eU7wtcT6LhKjr0cTotmIkbZCuj7M3HfZ7azC968c0Oi2s/nRMPH5MfladWYV0wBwT
 KGoOLeRugnMZ+JB2f3K6KQCkZFgkaZPDSMyxw99oeehUdFDSFJYVyHyPqu0fbx2H03
 DjiJkh+zUXxSWInB/trupLHOG9dZ5gHlGUuv9uvcLOVOy1XenUa5YNRBbzf/FvKQVU
 z/BhN9vguEAHE6H84ge0zZdz6OQ691gUefn7RLWBSE8oad8J486++5vW7RKBVPykEB
 PwtEsThj8NQQeo+TcPLLUytZ6ncQqKv6SMoonJCaTPM3xK5MERDFowERwZT8+JKDZo
 S7A2ZaSvsbhaw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt 01/16] drm/i915/display: Fix intel_lpe_audio_irq_handler for
 PREEMPT-RT
Date: Mon, 15 Dec 2025 16:47:41 +0100
Message-ID: <20251215154740.1738648-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215154740.1738648-18-dev@lankhorst.se>
References: <20251215154740.1738648-18-dev@lankhorst.se>
MIME-Version: 1.0
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

The LPE audio interrupt comes from the i915 interrupt handler. It
should be in irq disabled context.

With PREEMPT_RT enabled, the IRQ handler is threaded.
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,
generic_handle_irq_safe API disables the interrupts before calling LPE's
interrupt top half handler.

This fixes braswell audio issues with RT enabled.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 5b41abe1c64d5..172c0062237eb 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -262,7 +262,7 @@ void intel_lpe_audio_irq_handler(struct intel_display *display)
 	if (!HAS_LPE_AUDIO(display))
 		return;
 
-	ret = generic_handle_irq(display->audio.lpe.irq);
+	ret = generic_handle_irq_safe(display->audio.lpe.irq);
 	if (ret)
 		drm_err_ratelimited(display->drm,
 				    "error handling LPE audio irq: %d\n", ret);
-- 
2.51.0

