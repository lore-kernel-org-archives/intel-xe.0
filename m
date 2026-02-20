Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711E8C5516E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDAC10E7AC;
	Fri, 20 Feb 2026 08:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="TdmdEveE";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467110E7C0;
 Fri, 20 Feb 2026 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1771576643;
 bh=cN4CC8A++RQw4KZny+y/qBgunBqNML6aHqx9moCYECM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TdmdEveEf3p6iHIB4/TVideG7VVudg+MDSVRVQ95XbuLpn3zF+ulZE3BRbIzdednp
 FTjXxEEde2Yo0NtQOYb84vmIPmqcYK5bcYANJM7DxNIwPJJxvjG7mDduVMfboV246Z
 IjSQ3NqxRKEo9waVbdmcWQMIaAhJHFJ7sQcoBBw3IAIgobEY1R804LwVO0Fn8WHowP
 1panPkvyOutTv4ja9g5OokjlyoTEzDgzlotwyb685mQxfE0LaFGliA5q4qjRhdVyTA
 qHWIkiO5xB350dpRfBiNKbEtiTb4pCURpz4L3p+XQaifvzHSTMemj9tYzfaotJ819k
 hjoqEUaIISl7w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [i915-rt v6 10/24] drm/i915/display: Do not take uncore lock in
 i915_get_vblank_counter
Date: Fri, 20 Feb 2026 09:37:08 +0100
Message-ID: <20260220083657.28815-36-dev@lankhorst.se>
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

This fixes a lockdep splat that occurs in the code that should be run
with interrupts disabled. The uncore lock should not be taken and
released repeatedly in a timing sensitive path.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_de.h       |  8 ++++++
 drivers/gpu/drm/i915/display/intel_vblank.c   |  4 +--
 drivers/gpu/drm/i915/intel_uncore.h           | 26 +++++++++++++------
 .../drm/xe/compat-i915-headers/intel_uncore.h |  7 +++++
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index f30f3f8ebee1d..8990c2c778efe 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -68,6 +68,14 @@ intel_de_read64_2x32(struct intel_display *display,
 	return val;
 }
 
+static inline u64
+intel_de_read64_2x32_fw(struct intel_display *display,
+			i915_reg_t lower_reg, i915_reg_t upper_reg)
+{
+	return intel_uncore_read64_2x32_fw(__to_uncore(display),
+					   lower_reg, upper_reg);
+}
+
 static inline void
 intel_de_posting_read(struct intel_display *display, i915_reg_t reg)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index e204c260b9aef..749127ae7794c 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -109,8 +109,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	 * we get a low value that's stable across two reads of the high
 	 * register.
 	 */
-	frame = intel_de_read64_2x32(display, PIPEFRAMEPIXEL(display, pipe),
-				     PIPEFRAME(display, pipe));
+	frame = intel_de_read64_2x32_fw(display, PIPEFRAMEPIXEL(display, pipe),
+				        PIPEFRAME(display, pipe));
 
 	pixel = frame & PIPE_PIXEL_MASK;
 	frame = (frame >> PIPE_FRAME_LOW_SHIFT) & 0xffffff;
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index fafc2ca9a2376..507398a562649 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -449,13 +449,28 @@ static inline void intel_uncore_rmw_fw(struct intel_uncore *uncore,
 		intel_uncore_write_fw(uncore, reg, val);
 }
 
+static inline u64
+intel_uncore_read64_2x32_fw(struct intel_uncore *uncore,
+			    i915_reg_t lower_reg, i915_reg_t upper_reg)
+{
+	u32 upper, lower, old_upper, loop = 0;
+	upper = intel_uncore_read_fw(uncore, upper_reg);
+	do {
+		old_upper = upper;
+		lower = intel_uncore_read_fw(uncore, lower_reg);
+		upper = intel_uncore_read_fw(uncore, upper_reg);
+	} while (upper != old_upper && loop++ < 2);
+
+	return (u64)upper << 32 | lower;
+}
+
 static inline u64
 intel_uncore_read64_2x32(struct intel_uncore *uncore,
 			 i915_reg_t lower_reg, i915_reg_t upper_reg)
 {
-	u32 upper, lower, old_upper, loop = 0;
 	enum forcewake_domains fw_domains;
 	unsigned long flags;
+	u64 ret;
 
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, lower_reg,
 						    FW_REG_READ);
@@ -466,17 +481,12 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
 	spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
 
-	upper = intel_uncore_read_fw(uncore, upper_reg);
-	do {
-		old_upper = upper;
-		lower = intel_uncore_read_fw(uncore, lower_reg);
-		upper = intel_uncore_read_fw(uncore, upper_reg);
-	} while (upper != old_upper && loop++ < 2);
+	ret = intel_uncore_read64_2x32_fw(uncore, lower_reg, upper_reg);
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irqrestore(&uncore->lock, flags);
 
-	return (u64)upper << 32 | lower;
+	return ret;
 }
 
 static inline int intel_uncore_write_and_verify(struct intel_uncore *uncore,
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index c5e198ace7bce..620d69c097dfb 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -73,6 +73,13 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
 	return (u64)upper << 32 | lower;
 }
 
+static inline u64
+intel_uncore_read64_2x32_fw(struct intel_uncore *uncore,
+			    i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
+{
+	return intel_uncore_read64_2x32(uncore, i915_lower_reg, i915_upper_reg);
+}
+
 static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
 					     i915_reg_t i915_reg)
 {
-- 
2.51.0

