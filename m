Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961CD3C933
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A03010E780;
	Wed, 10 Dec 2025 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oipQYd8n";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9010E772
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ShidImKhrKEGMbmRh28Ioti2IyQhRGlNNLaoRWPU+Fk=; b=oipQYd8ntjf2kIlrymWLqXtkrU
 f33TAWENxzX8pqWwZ6ER6bX2T63iQO5jCEgK7PQ2UNaQk7oCwHw5LCtvcE32XqiB7j4/cU/pOReei
 Q9tLx02/QpEhRsQMCDZKa/ctNiPDUAQVzs+n/Zv9Q2gsz5IdtlB4DoQZi1eTlw5/HdlLcYdSVlNub
 sm2nc6cxKfx7KNO8Z01M1OGzoHLTcRlObMZJDVT1v3TihJouAYdx1C94MgkEoQdi2kZVK25hE2mhi
 QXXabQRXCrrymAn2FDHwkNPE0uUBA2/UxMslmpECTkVw+xLyQ6pfld3VHueQcrhw6aOKFfiKTl1hs
 3xETVTfw==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTNaq-00B3s3-TK
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 18:03:13 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 01/10] drm/xe: Fix ggtt fb alignment
Date: Wed, 10 Dec 2025 18:03:01 +0100
Message-ID: <20251210170310.15114-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210170310.15114-1-tursulin@igalia.com>
References: <20251210170310.15114-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

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
index 6a935a75f2a4..a22a9182dadb 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -373,7 +373,7 @@ intel_fb_pin_to_ggtt(const struct drm_framebuffer *fb,
 {
 	*out_flags = 0;
 
-	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, phys_alignment);
+	return __xe_pin_fb_vma(to_intel_framebuffer(fb), view, alignment);
 }
 
 void intel_fb_unpin_vma(struct i915_vma *vma, unsigned long flags)
-- 
2.52.0

