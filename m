Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8224EFD2D6C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BBC10E6F1;
	Tue, 10 Mar 2026 11:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="IpUJ1hyE";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EFE10E6E5;
 Tue, 10 Mar 2026 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1773143865;
 bh=gZgsUQ3ydkW05IMcaqLfOei9/u0XGN5e4flL9B0GhiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IpUJ1hyEvN0wNLzBc3GXeOfSyUn/3M0g3C0xgkAAWQpUY+Lk5iWDY/wtKprIEUtY4
 hOYcMNXUuZdlMsbIZ9TLbPboCikZUUAGjPGNNjB3exl/5RfSvWuq89VEwwdXEn9wAa
 s6SkHQPKuFf4combBhBBmQrEcOaBR9uKQfu7xCJ1Q8YjTcKYFw3e3GxRT74ynKYaKZ
 wN4OGvB9qkh4h6Q862Nb8Tl9SctJ2//qCkYhJfiwDTOlWP9+BBwzInYbsnKdPOEZ7W
 ooVg0gl8FeHS5XZnQXZZf0Ty7PnQqN2SAGhqW4nV/yz2qbtesdbPmSu0g1UljOXQKm
 tsIw5wECL9FRw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 25/26] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
Date: Tue, 10 Mar 2026 12:57:07 +0100
Message-ID: <20260310115709.2276203-26-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310115709.2276203-1-dev@lankhorst.se>
References: <20260310115709.2276203-1-dev@lankhorst.se>
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

We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
My guess is the repeated loading/unloading is creating multiples of the
same entries. As a hack just reset lockdep. This might only be necessary
for CI + PREEMPT_RT.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 lib/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 56ec7173cb7b6..b8d7e6dc345e9 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1625,8 +1625,8 @@ config LOCKDEP_CHAINS_BITS
 config LOCKDEP_STACK_TRACE_BITS
 	int "Size for MAX_STACK_TRACE_ENTRIES (as Nth power of 2)"
 	depends on LOCKDEP && !LOCKDEP_SMALL
-	range 10 26
-	default 19
+	range 22 26
+	default 22
 	help
 	  Try increasing this value if you hit "BUG: MAX_STACK_TRACE_ENTRIES too low!" message.
 
-- 
2.51.0

