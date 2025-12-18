Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B07D6E2AF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 16:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845FC10EA79;
	Thu, 18 Dec 2025 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="BSSEJ2pd";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3510EA76;
 Thu, 18 Dec 2025 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1766075636;
 bh=/YttZUgmn62XSEh0hwiLQG2joTYu/zUwyvhm/nBW/W4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BSSEJ2pdE7afBa34VT/Aiuu0uNGMswwND1wZmumZe+YDIe0UU1plgaTjL/1Hl5F/K
 rJ3I39DsYCgJCSPZyuKE6FsJSIAJ5on36NLOyhM7hrq5jpRveIFfuGal9yuv/yfhg5
 a8wJF04sGDq495mm63+Cpyv6TqHT3Zw90iepAnetD4FPTbeW8x+l6vvduujTeLLzJ2
 w1RKful+lOBtfbvEqNexVhHoEuVDjyF9AE6Yks9lYXZxG3vVhgO4rnx6BSl/NEl4p1
 jiL4rrgyviiXucql4v6knAFPvXy1knAn8zqf3/k9j/coHoWb/LxVIU9hgiKsElfn3m
 S93mijGpuuhSw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [i915-rt v4 17/20] drm/i915/gt: Fix selftests on PREEMPT_RT
Date: Thu, 18 Dec 2025 17:34:05 +0100
Message-ID: <20251218163408.97508-18-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
index 10e556a7eac45..c1eff9edd8a5e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
@@ -277,11 +277,11 @@ static int live_engine_busy_stats(void *arg)
 		st_engine_heartbeat_disable(engine);
 
 		ENGINE_TRACE(engine, "measuring idle time\n");
-		preempt_disable();
+		migrate_disable();
 		de = intel_engine_get_busy_time(engine, &t[0]);
 		udelay(100);
 		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
-		preempt_enable();
+		migrate_enable();
 		dt = ktime_sub(t[1], t[0]);
 		if (de < 0 || de > 10) {
 			pr_err("%s: reported %lldns [%d%%] busyness while sleeping [for %lldns]\n",
@@ -316,11 +316,11 @@ static int live_engine_busy_stats(void *arg)
 		}
 
 		ENGINE_TRACE(engine, "measuring busy time\n");
-		preempt_disable();
+		migrate_disable();
 		de = intel_engine_get_busy_time(engine, &t[0]);
 		mdelay(100);
 		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
-		preempt_enable();
+		migrate_enable();
 		dt = ktime_sub(t[1], t[0]);
 		if (100 * de < 95 * dt || 95 * de > 100 * dt) {
 			pr_err("%s: reported %lldns [%d%%] busyness while spinning [for %lldns]\n",
-- 
2.51.0

