Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A7C4453B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403F610E7F7;
	Wed, 21 Jan 2026 13:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="HojSNJg5";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9410E7F6;
 Wed, 21 Jan 2026 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769003643;
 bh=BQuzkKqBZBGO9wE3d6cW/JI4pdjDP8E9SuARGbRWeLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HojSNJg55D33Tq58tcFdNbKWuz6dvKRLlmfmu7kLV+SLprAd212Lj/7lCyTCinu31
 Mzbte7L+KWi23iYDBVnnf9yLLT7KQn9M7AOlDlidmZDKYUqVURJ900Zmal0Kczc5oF
 P3RCr8lq1N8PIm4u3IEoUmZwyH+twpNeSaFBfpQ2fo2eis+vmU5u0JVpXIJ5gpxQOW
 rPIXp3vOJq8VHIWe6h8XAnU+2BhOSvNe5W5YvLeEP+7c3LqAFL7I4qeKIZXPcqkxdd
 oob1JuiKQDjQbUgnlttUikmp9qzAmSxtPGEDB5NK+tVT9qJI0nq5fA0AOttfZpDMzZ
 c5iu/jqH2/U7g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v5 21/21] FOR-CI: drm/i915: Reset lockdep after selftest
 unload
Date: Wed, 21 Jan 2026 14:53:17 +0100
Message-ID: <20260121135318.651622-22-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121135318.651622-1-dev@lankhorst.se>
References: <20260121135318.651622-1-dev@lankhorst.se>
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
 drivers/gpu/drm/i915/i915_module.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 5d9c35b5a1820..4c135688d9660 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -117,6 +117,12 @@ static void __exit i915_exit(void)
 		if (init_funcs[i].exit)
 			init_funcs[i].exit();
 	}
+
+	/* Workaround for "MAX_STACK_TRACE_ENTRIES" too low, reset all locks after exit */
+#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
+	if (i915_selftest.live || i915_selftest.mock || i915_selftest.perf)
+		lockdep_reset();
+#endif
 }
 
 module_init(i915_init);
-- 
2.51.0

