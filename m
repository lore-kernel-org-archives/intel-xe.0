Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE4D65548
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 10:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5290110E5C6;
	Wed, 17 Dec 2025 10:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="VJg3xfn3";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9707110EC6D;
 Wed, 17 Dec 2025 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765967724;
 bh=BBVJJ7NOdSu0nB43nL7jgsO0CLlF8iIuNy9Wks62HGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VJg3xfn3Hp9+mPTk2uSdDkp3xXdIUoy60hd4IZ6K8cjX4HE2JAVTPQW/w1gvUL0Hw
 44RrHGSYmI5Cqv6zTF2+5nGBbcdKur63G51vVt7LpniDvRV4EdkoL/1+q71p/K6qTs
 o4BKkRyqHV4+c9JOjh5ZFKZMXYGGSefZziXCLwMPdtlQ8zeMgbN/0Q1xx+KrEVIwrh
 +hjbWa0582ybm+USeaIhkPgY92ZBSd+Hxc9foewcgSw6p7DaUIj7uuNnbIsyC/hxq7
 zMeq2PLeUdfpBBVcq5ud1O595jFWmjvGtEE+TEU+U45vHIHaCU2UfaYJr3Ikdq0oix
 Iqg7sn0baMRHQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt v3 14/16] drm/i915: Drop the irqs_disabled() check
Date: Wed, 17 Dec 2025 11:35:21 +0100
Message-ID: <20251217103506.1873859-32-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251217103506.1873859-18-dev@lankhorst.se>
References: <20251217103506.1873859-18-dev@lankhorst.se>
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

The !irqs_disabled() check triggers on PREEMPT_RT even with
i915_sched_engine::lock acquired. The reason is the lock is transformed
into a sleeping lock on PREEMPT_RT and does not disable interrupts.

There is no need to check for disabled interrupts. The lockdep
annotation below already check if the lock has been acquired by the
caller and will yell if the interrupts are not disabled.

Remove the !irqs_disabled() check.

Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/i915_request.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 4399941236cbf..d82105408bd8f 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -610,7 +610,6 @@ bool __i915_request_submit(struct i915_request *request)
 
 	RQ_TRACE(request, "\n");
 
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
 
 	/*
@@ -719,7 +718,6 @@ void __i915_request_unsubmit(struct i915_request *request)
 	 */
 	RQ_TRACE(request, "\n");
 
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
 
 	/*
-- 
2.51.0

