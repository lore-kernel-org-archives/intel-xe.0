Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CC5D46951
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 16:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666EE10E83E;
	Wed, 21 Jan 2026 16:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="CyvoUVMI";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B56D10E123;
 Wed, 21 Jan 2026 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769014623;
 bh=ktlnlvkoF5Avel/4qBe27tJe8HvghxIj0Bb5hwVH1l0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CyvoUVMIQVU728A/f1xWcFGkZ7oFDfgMp62zc2PcoHFIbg4VyrcFDfGxzA1kVBxY5
 lAFgSnLS0J5sDOZNC0JZ/GnmOXctiquWVZTLkfADke1EICJYWQiTlYAz50vV2gTdo0
 DfXbEte6aqiAHvVS/4IXQ65G4oRYnRKtb92gonyNdMEDP7SDx34XjuEsOhAFgFTU5e
 SFd6AnNwBCILMxbBUj7d6+0oqd/nbckHnzpnX96wG0WeMqIy/6PIkezxD+rsgcAPeA
 syTyOPDEW33scjVtf7w3pANx9lUOvJr+2jzF56btxklpB3Ev1XS8XFVA0hEqjdRO5G
 RP95qTwkpzkJQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v5] FOR-CI: drm/i915: Reset lockdep after selftest unload
Date: Wed, 21 Jan 2026 17:56:56 +0100
Message-ID: <20260121165656.660250-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121135318.651622-22-dev@lankhorst.se>
References: <20260121135318.651622-22-dev@lankhorst.se>
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
Forgot to commit the EXPORT_SYMBOL_GPL change.

 drivers/gpu/drm/i915/i915_module.c | 6 ++++++
 kernel/locking/lockdep.c           | 1 +
 2 files changed, 7 insertions(+)

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
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index b9edc0339273d..d4804d94a10e8 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6188,6 +6188,7 @@ void lockdep_reset(void)
 		INIT_HLIST_HEAD(chainhash_table + i);
 	raw_local_irq_restore(flags);
 }
+EXPORT_SYMBOL_GPL(lockdep_reset);
 
 /* Remove a class from a lock chain. Must be called with the graph lock held. */
 static void remove_class_from_lock_chain(struct pending_free *pf,
-- 
2.51.0

