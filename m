Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA5ACA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C445910E456;
	Mon, 18 Aug 2025 14:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZQYHDh8M";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4456710E456
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kfP1nlQ2pHt8xODy+AxKXQ3JYh5FRVcATujE+s/shTE=; b=ZQYHDh8MHWOKDVXeuB16aQ6Bpr
 57lvAtO2jund6wHpGsMDGuoSUi0KRpRxG/bHHH6EEwsETWv9mCd7RiTlN0iRY1kQMTuJbRNiiKkOd
 sNy9GhWl1H0zpKAsX1OlyNmIe1+74er2ZGNQKWbUDsPjULlGWdhh++4QLshrZWhJMfW0wV9qHNzYq
 4qQeOCr9TS7lslYm0k9SgQjobCtrLDd8cYxZm9NFRFD1Ird7YxB8E+/fYmd3F5zSf6nOoUsvJvq/k
 nxYBTOffbnmI0xttNtttcXQFs6J8LBNNKM+dF7j1ITQPvrnr+KS0JLXSwjkCf6Cf4Y8yBwXdoF3NS
 /B17BHYg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uo0Vr-00Fs0v-Hr
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 13/14] no dpt stolen
Date: Mon, 18 Aug 2025 15:06:49 +0100
Message-ID: <20250818140653.86787-14-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index bf600cad0284..56c757bffcea 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -214,13 +214,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_PAGETABLE,
 						      alignment);
 	else
-		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
-						      dpt_size,  ~0ull,
-						      ttm_bo_type_kernel,
-						      XE_BO_FLAG_STOLEN |
-						      XE_BO_FLAG_GGTT |
-						      XE_BO_FLAG_PAGETABLE,
-						      alignment);
+		dpt = ERR_PTR(-EINVAL);
+
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
 						      dpt_size,  ~0ull,
-- 
2.48.0

