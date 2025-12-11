Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DC7D41C12
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 09:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735A910E7B3;
	Thu, 11 Dec 2025 09:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Kn9BFj6n";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9B610E7BB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bbHQt4l+tJ+OIn4A/nsmdWxZmOG2p8dqO79v95JKloI=; b=Kn9BFj6nFQtccv0ZTtMvXI07yH
 HK47pRqHyM5LIme78SGV6m+fF4u2JftcRx42oV1B+pYZ3gF1V3hFscDQ0tIqjOtk1HQWSlzw5YXOj
 feLFRgnucEhGKjAVf2KUwQB8wGes4fRDRvEzRdx9WA6NkS4ssTl9aFe7mPIEQ9TtnYQmhSIJe9QCY
 DUZR/uNCeJGkdqH0tVsV+jNQr+oSkBQlM5kkD7elDzBiPQ0k2vjf6TNkkBRfx1dzEsFFjiFcu8wKG
 2Oq4vRKER92ro4SBFO076lBCb+8DWsXX+N8yMOvJJOigljx3gEF/ADAmeAm2lEcc3VAVhSXiU2yNR
 BgrwWQvQ==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTclw-00BQTS-S3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 10:15:41 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 9/9] use wc for dpt
Date: Thu, 11 Dec 2025 10:15:30 +0100
Message-ID: <20251211091530.19031-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
References: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index f0017cb1d7cb..a849bdd14d36 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -176,7 +176,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						   ttm_bo_type_kernel,
 						   XE_BO_FLAG_STOLEN |
 						   XE_BO_FLAG_GGTT |
-						   XE_BO_FLAG_PAGETABLE,
+						   XE_BO_FLAG_PAGETABLE |
+						   XE_BO_FLAG_SCANOUT,
 						   alignment, false);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
@@ -184,7 +185,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						   ttm_bo_type_kernel,
 						   XE_BO_FLAG_SYSTEM |
 						   XE_BO_FLAG_GGTT |
-						   XE_BO_FLAG_PAGETABLE,
+						   XE_BO_FLAG_PAGETABLE |
+						   XE_BO_FLAG_SCANOUT,
 						   alignment, false);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
-- 
2.52.0

