Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5C3CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6E510EB66;
	Fri,  7 Nov 2025 19:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="NBGnR7zw";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F396210EB62
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762544390;
 bh=Fd7xqMKtI1czeZVZmJUm2zI3Khx3lzpsyMWufRJ+Cw8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NBGnR7zwEC4Sf5jlg3y8fwahT9QeAR79f51Yq4hSuxU+e37WsGzOtNGsEBXMHK6Jp
 Nt+bGmyOX7CH3BPctGuUm5ETSJ1IRCw9g9EP0aTtKeNEgmicN9Z5BRpQtKWc9hDGAG
 LC9mGZnXqI7RH/D7xKJ9VCvlrV349Vkn9yp9M/+/2JxmVdCY2hqSYwHCe3v3/YZUhi
 Es1V/ZNYTXykRkf20ur9/Lhg4922lq7auNw0WMDpCfqfMZn5boSCeUpGBtL2MctwiZ
 frjAuLSaQIYTIbNw+ccwjHD8TT+oHsieSaH9wDY8oWWyB8mSkjpBJ9QJIYao15aeM6
 q/syF1cUSWGDQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI 06/10] drm/i915/display: Enable interrupts earlier on
 PREEMPT_RT
Date: Fri,  7 Nov 2025 20:39:41 +0100
Message-ID: <20251107193946.1075137-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107193946.1075137-1-dev@lankhorst.se>
References: <20251107193946.1075137-1-dev@lankhorst.se>
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

The last part of the vblank evasion is about updating bookkeeping,
not programming hardware registers.

The interrupts cannot stay disabled here on PREEMPT_RT since the
spinlocks get converted to mutexes.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 9d2a23c96c61b..b87f6b4a4f3d7 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -688,6 +688,14 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
 		icl_dsi_frame_update(new_crtc_state);
 
+#if IS_ENABLED(CONFIG_PREEMPT_RT)
+	/*
+	 * Timing sensitive register writing completed, non-deterministic
+	 * locking from here on out.
+	 */
+	local_irq_enable();
+#endif
+
 	/* We're still in the vblank-evade critical section, this can't race.
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
@@ -735,7 +743,9 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	if (!state->base.legacy_cursor_update)
 		intel_vrr_send_push(NULL, new_crtc_state);
 
+#if !IS_ENABLED(CONFIG_PREEMPT_RT)
 	local_irq_enable();
+#endif
 
 	if (intel_vgpu_active(dev_priv))
 		goto out;
-- 
2.51.0

