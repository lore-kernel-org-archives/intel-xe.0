Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D907CAC5A7
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 08:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C324410E6AF;
	Wed, 24 Sep 2025 08:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RvONAS2W";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBAA10E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uj0AE8AE4z3DpULfgiJj0yi/glDDJjHm0YVI77DVLP0=; b=RvONAS2WGOMb+3fVVNN/d9rD2Q
 fXYYRhUFQYU1LxFTjie/fz90aVrxR+JLl3sU06PWowOkn2LmluP88QFLodrmazZoKq5f0845+nN6Y
 uXSjDxT8uueOlf4I2IblJWswOqt33MffnyGsDXxateJeJ5R/hMaMYaAVD7g1z8qPiEc6Lnvno2ums
 H9qOWT6l4ScsfyiLj/yyslN6Hh4LxCN3lKAiAalkWopo1kjugyT9uKPIeiOdjpayV78g8+sgjDhyR
 q6dFvOPybJbRCaAKlAQHtpIUOxlVQqFoDN2hQ1uYtJFi+4rS5Wb960KSiwlRxlsybd94epeXLARUJ
 /eMRSMIg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v1Kcg-00GmQ0-S8; Wed, 24 Sep 2025 10:13:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Fix DPT frame buffer alignment
Date: Wed, 24 Sep 2025 09:13:04 +0100
Message-ID: <20250924081304.10098-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
References: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
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

For the DPT case alignment is defined in terms of the DPT address space.
To translate back into the GGTT space it needs to be divided by 512 (page
size / PTE size).

v2:
 * Replaced commit message with the explanation provided by Ville.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b18d15cc3c53..36e78cf6b28c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -331,7 +331,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 	vma->bo = bo;
 	if (intel_fb_uses_dpt(&fb->base))
-		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
+		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment / 512);
 	else
 		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
 	if (ret)
-- 
2.48.0

