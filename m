Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B73BD1039D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 12:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8B10E5B4;
	Wed, 26 Nov 2025 12:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="fjGK+Iwx";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16410E5B4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1764159154;
 bh=9nnSJkgb2MpjBhiGcAM20kq5Fui+hM+wRV56YSDq7Uo=;
 h=From:To:Cc:Subject:Date:From;
 b=fjGK+IwxnUquY1fpd5uwrEqMxVvvb9gG939R66p/BrkY/3EEZG4G9FlTOwMPn+EMQ
 4eHCjSvzjOlMolZZ/vi/zd0A/OADYuYFkHarZThkgAMhVDpCVA23bgMyhwVbslXLxC
 i9b5KMeNPJFPIXfDn0pQGjGjTCs0iut7MPecUIWvJ2QjWBeljJrF1oDxTRWhoGuE+h
 iOPG0pfkyZ/Qh9cLHYvYpxDiC4yLg4730ZIU49TrzjZsc93eIijn12xN2D5UKF4c6H
 ek/hEoKaFav31mz2wHXWPZSJTAQGBWUn7kxllxEyTH0NDmwEIw3HZ4mP3KWZ04OprG
 CdyGoM0CytGag==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] DEBUG: Show held locks on failure
Date: Wed, 26 Nov 2025 13:12:16 +0100
Message-ID: <20251126121215.1504629-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

Teswt why we are regressing?

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 kernel/freezer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/freezer.c b/kernel/freezer.c
index ddc11a8bd2ea2..2493b885d886e 100644
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -135,8 +135,10 @@ static int __set_task_frozen(struct task_struct *p, void *arg)
 	/*
 	 * It's dangerous to freeze with locks held; there be dragons there.
 	 */
-	if (!(state & __TASK_FREEZABLE_UNSAFE))
-		WARN_ON_ONCE(debug_locks && p->lockdep_depth);
+	if (!(state & __TASK_FREEZABLE_UNSAFE)) {
+		if (WARN_ON_ONCE(debug_locks && p->lockdep_depth))
+			debug_show_held_locks(p);
+	}
 #endif
 
 	p->saved_state = p->__state;
-- 
2.51.0

