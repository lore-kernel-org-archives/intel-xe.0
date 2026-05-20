Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A063CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 00:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1BC10F1A4;
	Wed, 20 May 2026 23:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qfBFsLsm";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26810F1A7;
 Wed, 20 May 2026 23:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LxAHa/soAcft6QybZSLiL6x29wmLoSwaXQ8TQcjx2SU=; b=qfBFsLsmQQLUKjW/SzRV0fbuFB
 yk9v6q78g6cinp5J9HlpKrtCXrqNSaEnKzjN1Mf84AwABm6Ij1FAL1jJPLImW5b/KgL+BRtmBKHKy
 SqsvxDcr4eiuG+rsabuGwSCv7uYBppjHctsMyOYISW5maVaeIA9YNtNb64K1x9A4qbDW/qXIMrh+H
 PeYvQq3RAJ2uswEOMfbHqMrlme5cFp1wpFnyZ95VB09xHsRJ1/tnqjXYD7sbQuz3kUD0vSdXMcwhB
 JeeBW979c/bpYyLYdg+8vQf8Ms+0JOgkGEk5u5ZRDQ9J6weaIMBF0pkK2GEF9TcEqSe4cL8ie1VuN
 QJpl/QwQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqpJ-00456i-W4; Thu, 21 May 2026 01:59:50 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/i915/writeback: Enable for more hardware than ADL
Date: Wed, 20 May 2026 16:58:20 -0700
Message-ID: <20260520235820.2313192-10-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bc52eb0b2473..0ad497f0e361 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8097,7 +8097,7 @@ void intel_setup_outputs(struct intel_display *display)
 		intel_dvo_init(display);
 	}
 
-	if (DISPLAY_VER(display) == 13)
+	if (DISPLAY_VER(display) >= 13)
 		intel_writeback_init(display);
 
 	for_each_intel_encoder(display->drm, encoder) {
-- 
2.43.0

