Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03234C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 10:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE310EA1A;
	Thu, 13 Jun 2024 10:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="toT8+Dh5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GICWUzcf";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6260F10EA10;
 Thu, 13 Jun 2024 10:28:28 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1718274506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6qn5+yaI5GAOUknM5SDGHdUpKNmQlIj5/33BjmhmPM=;
 b=toT8+Dh5BybsxQXDdOYZIbrYoq8nDYpEKU8PCjgFR8cZkDOpb/jWk/i/zjtpcSzqAuENLR
 lp9vtHYGyg7W15MpGtZGGOyO1nRd9JTMUsvzUBihEkaJ2H5WMuo+ESNBrUWthJdQfrja01
 fiBZPvZpiO93QlwuJlwrO+tPZwX4HbquyaLtAiG6i554uTf5MJkU4+ddgTHmWH4bj6qp6j
 zEOAirJ+kcG5Q9iexQbh/WOF8aPw685YaKTvyczGtVn8eyYjREjoekk0FVX4+J0P2ivlyd
 hc8XTkAYrA9xp7ey3uHFRVGDwsdQvo7iXJx7Z6bDTNrzPJRObp8e3XZRUUWf6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1718274506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6qn5+yaI5GAOUknM5SDGHdUpKNmQlIj5/33BjmhmPM=;
 b=GICWUzcfSdmifLTzVh7fYvvzKnRJWsJSRYwKU8F5jCYPGS5SyotXvGr/7Kr6GWZxansE4P
 L92TXJyQy8SubuCw==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 8/8] Revert "drm/i915: Depend on !PREEMPT_RT."
Date: Thu, 13 Jun 2024 12:20:25 +0200
Message-ID: <20240613102818.4056866-9-bigeasy@linutronix.de>
In-Reply-To: <20240613102818.4056866-1-bigeasy@linutronix.de>
References: <20240613102818.4056866-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Once the known issues are addressed, it should be safe to enable the
driver.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5932024f8f954..a02162d6b710e 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,7 +3,6 @@ config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on X86 && PCI
-	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
--=20
2.45.1

