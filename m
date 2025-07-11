Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424F3C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED40F10EA72;
	Fri, 11 Jul 2025 16:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PfTWR2hk";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7710EA6C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jkPLmuO9mzMuNHn7zJY2oDzw6d8oCqWhKSWgkjryqik=; b=PfTWR2hkIOB5yEB+bzZaYevJsH
 k9llY1KhfBTrH19FSjGFXMnO08nDpoRSoTXUI0PMLQEJupaA6i9JQbEGGlXQwkG7GAMp6oIGQithv
 PckbVE+B1t7oEaN8z1Iv0IvmnsLsycDECD8C//QNbZ8PuLVcRa3Ukzi71ZklrQvAtoP8aVuCZG1g5
 5T/GqMW7/mITfyel2sFxiOMECqAwtQf0IxNhw0bS163q9uyRZQ2FOv2tv42+bkRGLDC2k4sGvSjFH
 BcRUFT5P7fLBw1n3vNwb9gffQAC+VEzN0mXYlEjBHWjPDvwSG6LzeeMEwY4Tt2Yq8ly7aXNEXBtKa
 GyExV/sA==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCE-00FR6H-No; Fri, 11 Jul 2025 18:01:58 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v10 5/8] drm/xe: Allow specifying number of extra dwords at
 the end of wa bb emission
Date: Fri, 11 Jul 2025 17:01:50 +0100
Message-ID: <20250711160153.49833-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
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

Indirect context setup will need more than one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 229cfde91799..768cb9de48d6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -984,6 +984,7 @@ struct bo_setup_state {
 	struct xe_lrc 		*lrc;
 	struct xe_hw_engine	*hwe;
 	size_t			max_size;
+	size_t                  reserve_dw;
 	unsigned		offset;
 	const struct bo_setup	*funcs;
 	unsigned		num_funcs;
@@ -1017,10 +1018,10 @@ static int setup_bo(struct bo_setup_state *state)
 		remain -= len;
 
 		/*
-		 * There should always be at least 1 additional dword for
-		 * the end marker
+		 * Caller has asked for at least reserve_dw to remain unused.
 		 */
-		if (len < 0 || xe_gt_WARN_ON(state->lrc->gt, remain < 1))
+		if (len < 0 ||
+		    xe_gt_WARN_ON(state->lrc->gt, remain < state->reserve_dw))
 			goto fail;
 
 		state->ptr += len;
@@ -1054,6 +1055,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		.lrc = lrc,
 		.hwe = hwe,
 		.max_size = LRC_WA_BB_SIZE,
+		.reserve_dw = 1,
 		.offset = __xe_lrc_wa_bb_offset(lrc),
 		.funcs = funcs,
 		.num_funcs = ARRAY_SIZE(funcs),
-- 
2.48.0

