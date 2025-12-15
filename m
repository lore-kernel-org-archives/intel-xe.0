Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D99ED5B844
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51510E62A;
	Mon, 15 Dec 2025 15:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KF0uF0vG";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE9410E630;
 Mon, 15 Dec 2025 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765813679;
 bh=LA3hIjGi9cA+PnG6A3TfKFJX6Y7TpnsugvkmMDZPIGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KF0uF0vG3mYPBZD+fwKoPva9kkSqwY+eBF/jtwm016c6TCnUZcmcUDaLIog+5xKlE
 gAgDtXNW+XBHiCaxHsXQyyclQKih+JTGqJY/j7n4t9ukNy/5ZkSjMAjwfLmLzCZy3l
 WDxvRSY37wMyfPJT05laM0OgDuPFJDNyzYbgrYVNZDdAOzrT2qGN1CkH5GsGbmiCVs
 xDpIHuE97w4e616fOceqlkeLhWxzmx8SPwZ7LPUuMpO/RBGkg+/cIH+w21X7bP3GdJ
 hwUZtGzsf5PgVXX1EYgw/3hg5elGrEtIUPOWoR/qjOd7SvJVtiWz+fHuHJ8HOXOxyD
 hjCmDweKEx5Xw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt 15/16] drm/i915/guc: Consider also RCU depth in busy loop.
Date: Mon, 15 Dec 2025 16:47:55 +0100
Message-ID: <20251215154740.1738648-33-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215154740.1738648-18-dev@lankhorst.se>
References: <20251215154740.1738648-18-dev@lankhorst.se>
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

