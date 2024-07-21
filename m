Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F6C3DA61
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jul 2024 07:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6610E1AB;
	Sun, 21 Jul 2024 07:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="DIlfckU/";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2720410E1AB
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jul 2024 07:13:52 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1721546030; bh=Z4Z12N5r8XmZrw9n2Lkt0+wNaHmWeNVCfjvmsFdStBM=;
 h=From:To:Cc:Subject:Date:From;
 b=DIlfckU/1iSl7/thw4z+zaWgjEJimjcM45csK/gSI7Zz0cDj3pOoMfn6zGZtqA0HS
 roM7CYrJ4Jkr5WrpYofloUQUlocBEZZy4Mh97/h88UNZmIABdOR/on54lE0zjjQG40
 GKja1rv7P5n0F4xLcr6XYhaineMyOemWvfNXHad46638OXgQWLPpICYCQsarvTYUhC
 xYyUjRJMIRks7CKy7S+NbBAV4t2lM4ZLAlJmRWXqqqhjpeQ1TkLP3dT2cCa/+jJyVY
 9vOPaVey3EF8AWho6EhOx2OBkmNVx+2rzwdjQplLm/jtoHyy43Myhys2Sns9ETCaJF
 Y4ZOBYpB7CQ9g==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 46L7DbOK101256
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 21 Jul 2024 10:13:37 +0300
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 46L7Dbgu101255;
 Sun, 21 Jul 2024 10:13:37 +0300
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, ashutosh.dixit@intel.com, obitton@habana.ai,
 kelbaz@habana.ai
Subject: [PATCH v2] drm/xe/oa: Don't use hardcoded values
Date: Sun, 21 Jul 2024 10:13:35 +0300
Message-Id: <20240721071335.101234-1-osharabi@habana.ai>
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

The current implementation uses hardcoded values instead of common defines.

v2:
 - Make the commit a regular commit instead of a fixup commit
 - slightly modify commit message

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

