Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42310C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7510E4CB;
	Fri, 14 Aug 2026 10:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKtDq6QB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C210E4CB
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786702670; x=1818238670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iCFnCLPPfu5DEaM8kTFqz29fqtryexHaLBK2XxQ6Pc0=;
 b=YKtDq6QBWpfGZWa/sX0BWatCPOOAIf11uQJ9sP4suL8s0VLSDYTYTowj
 WqxqmCzrbhWhSpSTO9SHV1lkvAMxJDksgO97rFuWf1U4RDrVu/TNXR1tY
 bibBeaqnpxpDla3Av/549E5gyCeNIjrnmpwqW6MnM13vD7WqhKLSCYuxf
 x7rbyC6u3ILdbr4eFCLxzNLNqK52q5GRBtOGZlxg7ieyM+MXaGHuJ2meY
 ltKf4+Mcdo5EMD+JrzRymn1gsxGIPiFf1dFf1fTQqLrQEf9v6o0UUreh4
 wXAUKNToRMtA9hQWWnqWlpmQOVehpJrVbOhr06DdIj2sHYw5Ap8wAO1nf w==;
X-CSE-ConnectionGUID: pO4jkHoJRXyYPr3ze7MHqg==
X-CSE-MsgGUID: kOHeJwT8QFi8xD7hIhCOaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="90956809"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="90956809"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:17:50 -0700
X-CSE-ConnectionGUID: vkckqjVfS9KRi89jJ2vO+g==
X-CSE-MsgGUID: mDazTGwJTHqsdSw66+jivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="259948323"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.164])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:17:48 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs
 batches
Date: Fri, 14 Aug 2026 12:17:25 +0200
Message-ID: <20260814101725.5505-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

emit_render_cache_flush() sets PIPE_CONTROL0_HDC_PIPELINE_FLUSH to
flush the L2/HDC data cache before fence signalling, but it never
requests a flush of the LSC untyped L1 data cache via the 'Untyped
Data-Port Cache Flush Enable' bit in PIPE_CONTROL DWord0[11].

Per the Bspec, in 3D pipeline mode HDC Pipeline Flush is documented to
also flush/invalidate the untyped L1 cache, but only depending on how
HDC_CHICKEN0[13:11] is programmed. Starting with MTL, this coupling
between HDC Pipeline Flush and the untyped L1 cache flush no longer
holds in practice, regardless of how HDC_CHICKEN0 is programmed, so
relying on it is not safe on newer platforms such as BMG. Mesa's Vulkan
driver (anv) has been assuming the kernel flushes both caches between
submissions, and hit user-visible corruption in apps such as Llama.cpp
because of this gap; it now works around it by flushing both caches
again from userspace at the end of every command buffer.

Fix it in the kernel instead: explicitly set
PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH together with
PIPE_CONTROL0_HDC_PIPELINE_FLUSH in emit_render_cache_flush(), so
callers waiting on this flush (e.g. end of batch, before releasing
memory for reuse) can rely on both the L2 and L1 data caches being
clean, without depending on undocumented platform-specific
HDC_CHICKEN0 behavior or requiring a userspace workaround.

Fixes: 9f8f93bee3ef ("drm/xe: Emit a render cache flush after each rcs/ccs batch")
Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8909
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 18d0fde8c98f..faf8d7e2c5c1 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -46,6 +46,7 @@
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 
 #define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
+#define	  PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH	BIT(11)	/* gen12 */
 #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
 #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 39a670e91ba7..79511de558d9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -219,7 +219,8 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
 				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 
-	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH |
+		PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH;
 	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
-- 
2.55.0

