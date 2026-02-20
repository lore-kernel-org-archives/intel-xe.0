Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7432DC5516A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62610E7DB;
	Fri, 20 Feb 2026 08:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Xnc9qC73";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38510E7D8;
 Fri, 20 Feb 2026 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576657;
 bh=LA3hIjGi9cA+PnG6A3TfKFJX6Y7TpnsugvkmMDZPIGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xnc9qC73Fa88nmf0cNzOUu/khSCN6JMCDg0AeLvXmkd1J2zW+DG/TS1WxjVFw4FXE
 w5pw+UHsgJ316rKBByjXJ//5Mx73WHLIa/NLa/uo+ufKbBt3toErzzL1ZQq//cKqyG
 ler9ZjmsPV/V4egpsq3THhPRxqnhBl9rwlQZWWJPXMwe9T5KsiIfBT3oixDo4jTDi2
 HC4H/fbUtU7/2iAQvBsepZvzFNJUUUcDzQqK+HtmeDcScI4YLZUDk/0/Or/zcSYwxk
 awwCsjA/AqMZe3Wjp3DTtpuiyhEQDygcoxlbtIUlFkXKdrwWv6rVdG01UTiGf9Zxl8
 pmg7XIQqxl8Xw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "John B. Wyatt IV" <jwyatt@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 18/24] drm/i915/guc: Consider also RCU depth in busy loop.
Date: Fri, 20 Feb 2026 09:37:16 +0100
Message-ID: <20260220083657.28815-44-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220083657.28815-26-dev@lankhorst.se>
References: <20260220083657.28815-26-dev@lankhorst.se>
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

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

intel_guc_send_busy_loop() looks at in_atomic() and irqs_disabled() to
decide if it should busy-spin while waiting or if it may sleep.
Both checks will report false on PREEMPT_RT if sleeping spinlocks are
acquired leading to RCU splats while the function sleeps.

Check also if RCU has been disabled.

Reported-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 053780f562c1a..b25fa8f4dc4bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -362,7 +362,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
 {
 	int err;
 	unsigned int sleep_period_ms = 1;
-	bool not_atomic = !in_atomic() && !irqs_disabled();
+	bool not_atomic = !in_atomic() && !irqs_disabled() && !rcu_preempt_depth();
 
 	/*
 	 * FIXME: Have caller pass in if we are in an atomic context to avoid
-- 
2.51.0

