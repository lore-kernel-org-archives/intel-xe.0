Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09241C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75610EA6C;
	Fri, 11 Jul 2025 16:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qrwnBM7K";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7410EA6C
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQcVjJdAHfL2UgDQiyJCnhJA8SzAyXnIjCK/2/K4yP4=; b=qrwnBM7KPLPFEULlNu4rtJ+JgJ
 +LLDf7FIbHeuRPhCKct5UOeDnwbdBMOzwIA5KphMt0fxrUi707wnYHsoXKjpyrbfub5deDpKYeMlL
 s5a+zMFRRqMKLBrFz9zlWsK86kKR/GbqClcG3VGEl5SYU+ttJl05MX4NYKCf3D5diWCxHB/brmwHA
 x25BAXrxB/HJ4dlC1kVApS3Z8R/MgTmGqEiita/VJIHGNYb8tKrBnRWk8Nw72HIjLktruhpXRsmNL
 AqX89cB26kzas0YAij0xQTkjE7J0WUdXGx/hdZ9NHILqRQtqV26wocIWJpTCYcoBh1vB+SLi7vNd4
 1FQRRj0A==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCD-00FR63-7f; Fri, 11 Jul 2025 18:01:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v10 3/8] drm/xe: Rename utilization workaround emission
 function
Date: Fri, 11 Jul 2025 17:01:48 +0100
Message-ID: <20250711160153.49833-4-tvrtko.ursulin@igalia.com>
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

Lucas suggested to consolidate to a slightly different naming scheme which
will align with the upcoming additions better.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 578bef1e8140..5d5b76f16829 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -944,8 +944,10 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-				       u32 *batch, size_t max_len)
+static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
+				    struct xe_hw_engine *hwe,
+				    u32 *batch,
+				    size_t max_len)
 {
 	u32 *cmd = batch;
 
@@ -1044,7 +1046,7 @@ static void finish_bo(struct bo_setup_state *state)
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct bo_setup funcs[] = {
-		{ .setup = wa_bb_setup_utilization },
+		{ .setup = setup_utilization_wa },
 	};
 	struct bo_setup_state state = {
 		.lrc = lrc,
-- 
2.48.0

