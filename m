Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6195C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 12:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A3B10E440;
	Mon, 30 Jun 2025 12:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YRkfAcM9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B01310E43C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iylevkwUpBu5upUJi3exmD/Qn8cWJdinqvYDxEXXfdk=; b=YRkfAcM9WrLXohOs0AlvD4AFD3
 qWK5ebGDYTtlVhu62ug/LSDLmK3XuvXCoLKN08nhijV1n2Ayw+eEsxIPohMMlB5RDR3rnJdJMA3vI
 L+ldPmvVKPYEQt6ROMdV7BM21h0IMC8GQAKTPYkO2RCr9zro1T8IW24CaGxM4dPRZeCrWwzqQi4EX
 OZkdaWZN+tHf2K5VH9Fq3A/7Fh3e5wAWC4EZMqGKmTD+xwAEXnM6L3OwftwwnJ4gCCPmFHxya2S9m
 BMTEWdLX+tNhSlX0OkHxlTVIT8IN82WjXwDx9nrmS+Mkg3e8shlSTs94BnRaHbfABF/RmL0M5DtiK
 lSDovxzQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWDur-00ATfb-U1; Mon, 30 Jun 2025 14:47:22 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v8 11/24] drm/xe: Flush L3 when flushing render cache
Date: Mon, 30 Jun 2025 13:46:57 +0100
Message-ID: <20250630124711.8209-12-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
References: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
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

I915 sets PIPE_CONTROL_FLUSH_L3 (bit 27) when flushing render caches but
interesting thing is Tigerlake PRM lists that bit as reserved.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
Is xe missing this? Or has this been wrong for so long in i915? Or is this
an undocumented bit?
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 78c0e87dbd37..9665d7ec7e01 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -45,6 +45,7 @@
 #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
 #define   PIPE_CONTROL0_CCS_FLUSH                       BIT(13) /* MTL+ */
 
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<30)
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a1289f086191..8f655b6fe913 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -197,6 +197,16 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	if (XE_WA(gt, 1409600907))
 		flags |= PIPE_CONTROL_DEPTH_STALL;
 
+	/*
+	 * L3 fabric flush is needed for AUX CCS invalidation
+	 * which happens as part of pipe-control so we can
+	 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
+	 * deals with Protected Memory which is not needed for
+	 * AUX CCS invalidation and lead to unwanted side effects.
+	 */
+	if (GRAPHICS_VERx100(xe) < 1270)
+		flags |= PIPE_CONTROL_FLUSH_L3;
+
 	if (lacks_render)
 		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
-- 
2.48.0

