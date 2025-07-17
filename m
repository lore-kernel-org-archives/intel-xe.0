Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B25C83F3D
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8510E82F;
	Thu, 17 Jul 2025 13:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F1yKAb6S";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C8910E822
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ywnHbPn+Udes67JLlSyElmrBZ4a6xd5AKZW5LcG/iI8=; b=F1yKAb6SOdhGzzrBZQga8ZQmoF
 PydJS2CtrjDJK7xkRbqvye+Ga074jbBbT7ADmtbsLcABD7sT3CLNwG4VfKMRl5RogB8QTHtwmNHs1
 OIJRUTyzLlPvwE9n57zKOiA9Xo3jPMQy4tBWlKRa7bxLGVcd3eNURoJ++XGXqk7ASnEOgL1ea5kYw
 cqfsZEJs1JejKonGQRW973NiariFYpj3EQiDtpd1Up9c0QPukzcncLvBVc99iik8z/0YZ6fR2/c59
 /qK7YYvhOxR9uHF5aw5HPYDHY+bkVwQS2Um9fdKIhdzO7adhMOQ4OsugVu8YotWebMAMYt3ORJb6B
 sfrFZSOA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucOI3-0009QM-PK
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 15:04:47 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 17/17] always flush
Date: Thu, 17 Jul 2025 14:04:33 +0100
Message-ID: <20250717130434.82251-18-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250717130434.82251-1-tvrtko.ursulin@igalia.com>
References: <20250717130434.82251-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 58e3cf5151bd..75d120384870 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -438,9 +438,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Force flush frame buffer data for non-coherent display access when
 	 * AuxCCS formats are used.
 	 */
-	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
-	    intel_fb_is_ccs_modifier(fb->base.modifier))
-		drm_clflush_sg(xe_bo_sg(bo));
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo))
+	    drm_clflush_sg(xe_bo_sg(bo));
 
 	return vma;
 
-- 
2.48.0

