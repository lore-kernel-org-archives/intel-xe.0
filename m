Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B3BC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 19:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F7410EA65;
	Thu,  3 Apr 2025 19:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="otXfcEz0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987DA10EA5E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QOwnmMr1a+rCQjMIN9FiKkWsVpiSdH7ZYz0h83Ibl0k=; b=otXfcEz0F9L+HrGOMPKhwS0Zyf
 mK1yewLghc4auEK47tSAM+7tUADzyvWM8AjhwoNOgA96mp/qdZqvOth4BY7eUCBojeDFa4QytwHq+
 iQ9dW/UpK++Hw63cZ33iCfEeBFXkukzyR+KVlwB/nqeco7qmKdUyom3C6esHzCVd4BLNHsyvD5Zd8
 vGJj/TOF2BxVJx4uOZzUVpJzkGYYlPIS9fIC0Vv9TYxwJfUy1EoHzSAc6j9JVEHCi+iGxDu9wrmfF
 SDasknjHYK1dbx9Fe74x4f974t00ArzGVHs/xydCdSNMdVHaXCEo32pjvjuOxZ9kb8LpjdqPDvxbx
 gC8zT0bA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u0Pqa-00Axme-Ta; Thu, 03 Apr 2025 21:03:29 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 11/16] drm/xe: Reduce DPT table alignment as in i915
Date: Thu,  3 Apr 2025 20:03:11 +0100
Message-ID: <20250403190317.6064-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
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

There is some magic going on with DPT alignment values which are
multiplied by 512, and then for specifically pinning the DPT table
scaled back down.

Make xe do it in the same way as i915.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 1538e2b02f89..1ccb4e563bba 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -327,7 +327,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 	vma->bo = bo;
 	if (intel_fb_uses_dpt(&fb->base))
-		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
+		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment / 512);
 	else
 		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
 	if (ret)
-- 
2.48.0

