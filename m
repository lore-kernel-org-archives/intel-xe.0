Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A9CD6E2B0
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 16:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22E410EA7A;
	Thu, 18 Dec 2025 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Hxf2HLDt";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4296210EA78;
 Thu, 18 Dec 2025 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1766075638;
 bh=JuDaK8knmnwvqTPCaZ8kVF3zfXGpF13hHheMLbZ3m3E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hxf2HLDtj3IJe/RCGuQ9+rF6kK0kmtPxy5mcJt/bEDXLXUw3qgAc+L0IvLZk/6rOt
 vfQEC9ntSxfRvCcnD5U44UKxJvjQ4x538NGQadIOl175NNoECDSnCyHoGkIS00vg9t
 p6PuE8eeRgcXo6fzX/jHuDx/oeLbsXLTBz5+ZZ0sixJSKQUv39fjDcQCFCAso2GLh2
 xxSy4kN9oKBaZeTjQdk+rbQ7lz5VR/o3K8WwEyFeG+6FhbOqYCcUEbHRhYP26NmXMY
 qvgriVHvyxL+NsMAhZTZGMcsqCHI6Dztw29KKUkmRJ5MGS8J6HMss8u6gyFgSNWnBm
 GIUQqy6VPRTxg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [i915-rt v4 18/20] drm/i915/gt: Set stop_timeout() correctly on
 PREEMPT-RT
Date: Thu, 18 Dec 2025 17:34:06 +0100
Message-ID: <20251218163408.97508-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251218163408.97508-1-dev@lankhorst.se>
References: <20251218163408.97508-1-dev@lankhorst.se>
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

Also check if RCU is disabled for PREEMPT-RT, which is the case when
local_bh_disable() is called.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 98a3a7a9de502..856250b457a55 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1607,7 +1607,7 @@ u64 intel_engine_get_last_batch_head(const struct intel_engine_cs *engine)
 
 static unsigned long stop_timeout(const struct intel_engine_cs *engine)
 {
-	if (in_atomic() || irqs_disabled()) /* inside atomic preempt-reset? */
+	if (in_atomic() || irqs_disabled() || rcu_preempt_depth()) /* inside atomic preempt-reset? */
 		return 0;
 
 	/*
-- 
2.51.0

