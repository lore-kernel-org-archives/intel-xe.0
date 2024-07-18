Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F4C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 05:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9E410E554;
	Thu, 18 Jul 2024 05:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="axwz1eiu";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EFF10E554
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 05:49:03 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1721281736; bh=c4CZ/MCALA2cY0OXpLDxeHKHwMEOqwOfZ6Tnrhx7Drs=;
 h=From:To:Cc:Subject:Date:From;
 b=axwz1eiuGB43lGmhOcv6pzcDw7qpH8UJZTh8QcFcQMUmWbMCCw0XZJugdBmMNu/s2
 J8CdbbxFLFQiKgp1nMiVNFs+InHG3etnJhi8mCZVf8H3NDCr9HtwACgK5NwA0Xh+/3
 1zk+PRzehS0JBkW0UXsbOaO6eq2Wv0WWqgl8gUoWyhJNXKxrXt9hQdUee+XyiwAm3J
 Iz7kTXYcmVO5hIrPPcE0brKNTUaLr6BbKORJvFXe5Y69JH2g9isHhksOjcEZGQP+Oz
 SjPR2e190i1LmgtyLAjFVdtuT1vnWcquWrTkNx9NIEXkxKUjcorJWEQIiUT9hVlPcL
 mOatzKyoG00gg==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 46I5mokQ2955849
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2024 08:48:50 +0300
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 46I5mocO2955848; 
 Thu, 18 Jul 2024 08:48:50 +0300
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, ashutosh.dixit@intel.com, obitton@habana.ai
Subject: [PATCH] fixup! drm/xe/oa: Add OAR support
Date: Thu, 18 Jul 2024 08:48:48 +0300
Message-Id: <20240718054848.2955818-1-osharabi@habana.ai>
X-Mailer: git-send-email 2.34.1
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

The current implementation uses static CS codes instead of common.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d69f751bf78..3ef92eb8fbb1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -641,7 +641,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 	u32 offset = xe_bo_ggtt_addr(lrc->bo);
 
 	do {
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
 		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
 		bb->cs[bb->len++] = 0;
 		bb->cs[bb->len++] = flex->value;
-- 
2.34.1

