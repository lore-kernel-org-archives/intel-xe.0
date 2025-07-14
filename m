Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1E3C83F34
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52B10E4D2;
	Mon, 14 Jul 2025 15:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Pj1ANxVQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GTeY64n5";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8A10E4C6;
 Mon, 14 Jul 2025 15:40:04 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752507602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0MTfdsbyUKALxJrsQHXpLGxUb5bHQS4AmpC+HF5MzA=;
 b=Pj1ANxVQckA+N19Ol3kKg5RN2yadjz886SvS/cXIXPndHkp0JLFqqKcfoYIjLsPNhRLk6M
 F+P7zx+GqP3hQl0Uqwav/9OKeTsZfqxrZHoEndQuu25oVIMLrDtF5wcn4O5whQufkQz2dh
 jG6jjjDcXq3KeShWFStoWVpRsDTdciEAylMklPzGD1QjGB9vXXDD0TDZqw5JJo8LWQToWT
 8QvIQsPNmOFABZltGR7dtpPbt5SVZCxHcQP0vIFxENyHO7WqEuN3TxGqGiyz8c2yLHKj23
 H1n+iKsRkd0x4i6HtMEwaHiQGlb2QSDBmMb9Y9OinUjwOgsEmnR4tyg5WK5kZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752507602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0MTfdsbyUKALxJrsQHXpLGxUb5bHQS4AmpC+HF5MzA=;
 b=GTeY64n52fuBDvJmP7CRXd5fn5E7R0GIq587X09Bg+lT6s0ZXVPia63FwpO6CeTdNUFTUg
 t9t5tT/qXV7msuDw==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Scott Oehrlein <scott.oehrlein@intel.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "John B. Wyatt IV" <jwyatt@redhat.com>
Subject: [PATCH v4 7/9] drm/i915/guc: Consider also RCU depth in busy loop.
Date: Mon, 14 Jul 2025 17:39:52 +0200
Message-ID: <20250714153954.629393-8-bigeasy@linutronix.de>
In-Reply-To: <20250714153954.629393-1-bigeasy@linutronix.de>
References: <20250714153954.629393-1-bigeasy@linutronix.de>
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

intel_guc_send_busy_loop() looks at in_atomic() and irqs_disabled() to
decide if it should busy-spin while waiting or if it may sleep.
Both checks will report false on PREEMPT_RT if sleeping spinlocks are
acquired leading to RCU splats while the function sleeps.

Check also if RCU has been disabled.

Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/=
gt/uc/intel_guc.h
index 053780f562c1a..b25fa8f4dc4bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -362,7 +362,7 @@ static inline int intel_guc_send_busy_loop(struct intel=
_guc *guc,
 {
 	int err;
 	unsigned int sleep_period_ms =3D 1;
-	bool not_atomic =3D !in_atomic() && !irqs_disabled();
+	bool not_atomic =3D !in_atomic() && !irqs_disabled() && !rcu_preempt_dept=
h();
=20
 	/*
 	 * FIXME: Have caller pass in if we are in an atomic context to avoid
--=20
2.50.0

