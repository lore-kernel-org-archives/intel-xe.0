Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9ED5B847
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 15:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33210E633;
	Mon, 15 Dec 2025 15:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="YZ/9N2EJ";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49A10E623;
 Mon, 15 Dec 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765813678;
 bh=BBVJJ7NOdSu0nB43nL7jgsO0CLlF8iIuNy9Wks62HGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YZ/9N2EJJOzQss9CirehSsdmv1rs1gYJFsXxxGNi8Ja8KNAHgHKl10fBcQt6C6ly0
 9vkDkC9q7EULHgH4h3g0ZibyNRQuuSrOjNG1imOxNWGhdTkGrE5jgd/wfwx4LvvI6H
 qQics5XHjz6F/LTFu6ojXTXKwTQ2QpZ3I3Nk5/APc2AYhkJZ21i89EB07rXyjwvwmS
 GCw8E4ybLbM9stJl6/QPRhy+hJwlq1rjS6hevN0P19xS9sbcYJ1QjOKjZRZr5GCA20
 di2dqfNuC2bT4akOtMqugRNvaLbrgQFySLL7zDNln0rIk/Dha+ND4Blf48HcXIsO2P
 VBDq4xLlShf1Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [i915-rt 14/16] drm/i915: Drop the irqs_disabled() check
Date: Mon, 15 Dec 2025 16:47:54 +0100
Message-ID: <20251215154740.1738648-32-dev@lankhorst.se>
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

