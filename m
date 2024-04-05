Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D4AC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F1E113C49;
	Fri,  5 Apr 2024 14:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="AJQvOutg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u2YUmi3D";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6210EC8A;
 Fri,  5 Apr 2024 14:27:56 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1712327264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5+Ui7f7wPR3cxxqtyYSsU0h2Riqeo+WaN5i1s2XWPs=;
 b=AJQvOutg08RM9DRWO0Wc0vlDzDKA7tFgd3J9Ef4lEHzy13Q5XphfktpAYHeikEOZMIelHe
 mSpODoO0ZwGJZwwk5q13crwR+r4bPOdepwYK7ZLTNZS+issdhtwUZBlQ17PCsIaexg7ei4
 E2yIEScEwQZtk6Ov9EIzsIvjUtLt6tmvruc+Ws+hpt5pjFNKiQPTPm9+6hnoyCjXunOUUM
 Kqpnm6yb8C9M240yl/+OtGhWMcF12O6FDrIlG849Cudz5atjba5Tkik4HnPwORXn8ZRa9c
 apUpIY+t+N6srYvBgfgOaY7gdXWd1m6ajupXKB0egKFwTRyRFAZ5nXiJwb2CLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1712327264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5+Ui7f7wPR3cxxqtyYSsU0h2Riqeo+WaN5i1s2XWPs=;
 b=u2YUmi3DWT5vvxj7i48WBivN1eQurC6htNRvtme2O4XtfoBqR7TAz9LCZsWQGpPvUHnc+D
 Rh/Mn8ealsnuj/Ag==
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "John B. Wyatt IV" <jwyatt@redhat.com>
Subject: [PATCH 09/10] drm/i915/guc: Consider also RCU depth in busy loop.
Date: Fri,  5 Apr 2024 16:18:27 +0200
Message-ID: <20240405142737.920626-10-bigeasy@linutronix.de>
In-Reply-To: <20240405142737.920626-1-bigeasy@linutronix.de>
References: <20240405142737.920626-1-bigeasy@linutronix.de>
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
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/=
gt/uc/intel_guc.h
index be70c46604b49..387cc1911302f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -360,7 +360,7 @@ static inline int intel_guc_send_busy_loop(struct intel=
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
2.43.0

