Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17132C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 10:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7D010E1DF;
	Thu, 20 Mar 2025 10:16:50 +0000 (UTC)
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Thu, 20 Mar 2025 10:16:49 UTC
Received: from smtp91.iad3a.emailsrvr.com (smtp91.iad3a.emailsrvr.com
 [173.203.187.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1B10E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 10:16:49 +0000 (UTC)
Received: from smtp78.iad3a.emailsrvr.com (relay.iad3a.rsapps.net
 [172.27.255.110])
 by smtp28.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTPS id 666F25301
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 06:09:25 -0400 (EDT)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp2.relay.iad3a.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 70DA4282C; 
 Thu, 20 Mar 2025 06:09:17 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-xe@lists.freedesktop.org
Cc: zhanjun.dong@intel.com, Kenneth Graunke <kenneth@whitecape.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Invalidate L3 read-only cachelines for geometry
 streams too
Date: Thu, 20 Mar 2025 03:11:55 -0700
Message-ID: <20250320101212.7624-1-kenneth@whitecape.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 09386abc-dfac-4d69-84d6-d6bc6bd4e71c-1-2
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

Historically, the Vertex Fetcher unit has not been an L3 client.  That
meant that, when a buffer containing vertex data was written to, it was
necessary to issue a PIPE_CONTROL::VF Cache Invalidate to invalidate any
VF L2 cachelines associated with that buffer, so the new value would be
properly read from memory.

Since Tigerlake and later, VERTEX_BUFFER_STATE and 3DSTATE_INDEX_BUFFER
have included an "L3 Bypass Enable" bit which userspace drivers can set
to request that the vertex fetcher unit snoop L3.  However, unlike most
true L3 clients, the "VF Cache Invalidate" bit continues to only
invalidate the VF L2 cache - and not any associated L3 lines.

To handle that, PIPE_CONTROL has a new "L3 Read Only Cache Invalidation
Bit", which according to the docs, "controls the invalidation of the
Geometry streams cached in L3 cache at the top of the pipe."  In other
words, the vertex and index buffer data that gets cached in L3 when
"L3 Bypass Disable" is set.

Mesa always sets L3 Bypass Disable so that the VF unit snoops L3, and
whenever it issues a VF Cache Invalidate, it also issues a L3 Read Only
Cache Invalidate so that both L2 and L3 vertex data is invalidated.

xe is issuing VF cache invalidates too (which handles cases like CPU
writes to a buffer between GPU batches).  Because userspace may enable
L3 snooping, it needs to issue an L3 Read Only Cache Invalidate as well.

Fixes significant flickering in Firefox on Meteorlake, which was writing
to vertex buffers via the CPU between batches; the missing L3 Read Only
invalidates were causing the vertex fetcher to read stale data from L3.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4460
Cc: stable@vger.kernel.org # v6.13+
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 13 +++++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index a255946b6f77e..8cfcd3360896c 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -41,6 +41,7 @@
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 
+#define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
 #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
 
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0c230ee53bba5..9d8901a33205a 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -141,7 +141,8 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
 static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 				int i)
 {
-	u32 flags = PIPE_CONTROL_CS_STALL |
+	u32 flags0 = 0;
+	u32 flags1 = PIPE_CONTROL_CS_STALL |
 		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
 		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
 		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
@@ -152,11 +153,15 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 		PIPE_CONTROL_STORE_DATA_INDEX;
 
 	if (invalidate_tlb)
-		flags |= PIPE_CONTROL_TLB_INVALIDATE;
+		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
 
-	flags &= ~mask_flags;
+	flags1 &= ~mask_flags;
 
-	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
+	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
+		flags0 |= PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE;
+
+	return emit_pipe_control(dw, i, flags0, flags1,
+				 LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 }
 
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
-- 
2.48.1

