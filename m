Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD99C83010
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 13:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF310EA2B;
	Fri, 27 Jun 2025 13:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nM/ns9nw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9CD10EA29
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=okKLyx5LromtVj79C/+pxUwom96ZwvsLF3OuuThg8+c=; b=nM/ns9nwk4jSP0OkXllyPJRZc5
 cSN+n4E7TZ42Mu4toZCUW8nOesoWyS7pdnmIRFwiTjnWlBMmAU14L0r5cfjxPt3tmLxb3i8bUBhmF
 08SjN5JCAcQ+yoWuCmTq6AHM95sXh08GhisImeUTgER0SX4NwjoPR9qEC3FDhXhwsul4B8ybhUdLx
 6W0PGvKDH+UTy5wYxnI2lzurEjzWnRniQrJx9TcwyyAZrKGoBfG9p13O0FNHGPvtk3+U0Ij2H6L4P
 rg3eVttcWPviWqGg/HFG5fnb1guumdhq5vtCOwLHZg3PeA/fsiS1mmN5voI2EQSVigs0xmjzSDICR
 9v3Ub6DQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uV9D9-009Poa-Ig; Fri, 27 Jun 2025 15:33:47 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v7 03/24] drm/xe: Rename utilisation workaround emission
 function
Date: Fri, 27 Jun 2025 14:33:16 +0100
Message-ID: <20250627133340.54603-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
References: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 58c676afc60f..a26ec8b6a3ad 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -944,8 +944,9 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-				       u32 *batch, size_t max_len)
+static ssize_t
+setup_utilization_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *batch,
+		     size_t max_len)
 {
 	u32 *cmd = batch;
 
@@ -1040,7 +1041,7 @@ static void finish_wa_bo(struct xe_lrc *lrc,
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
 	static const struct wa_bo_setup funcs[] = {
-		{ .setup = wa_bb_setup_utilization },
+		{ .setup = setup_utilization_wa },
 	};
 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
 	u32 *cmd, *buf = NULL;
-- 
2.48.0

