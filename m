Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91592C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7810E1ED;
	Fri, 26 May 2023 19:06:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3134C10E1ED
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685127981; x=1716663981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TTYpqaB0UVHd8N9i1rFCEGcvb9MKUBMZnwsMfPtiHgo=;
 b=WcjxY8iSNS4hGqEXq8ruxHO1UlsCbrxHFNG9CNqYolMxeR66LAz3fEwt
 roPKLZuvTtmsEqasgXZaDUgbPkludwKoGp8woVoNh8GCWmkGMHdr+SFk/
 hkG59mZy39Si0HGH7iooo41aJddHp/mHIDY+8bFFU92jzFHS/diwVgTbb
 ofPJ6IY/3frxSgkEJWgXTVIDBtCrmJ8AK0+vGNWUNWoMGXmsnNdAs0xqi
 F3JIuZ1pk/NjCZKK+LIR2jnTDe9UZUQ04VZv4Hp00UMOPWR/vAzNUJLE0
 CJJe84qUx6TojssPIvgm/KD+uuB9gJT0ZzgDqO6xQwi9dHqYZ9dJ1kStT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440636657"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440636657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817060"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817060"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:06:19 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 12:06:08 -0700
Message-Id: <20230526190609.61529-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526190609.61529-1-jose.souza@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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

i915 invalidates TLB before emit BB start, so doing the same in Xe.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
 drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 0f9c5b0b8a3ba..7c7320efea739 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -73,6 +73,7 @@
 #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
+#define   PIPE_CONTROL_TLB_INVALIDATE			(1<<18)
 #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d2fa0b4c8bcc0..4f3ef39109b9b 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -37,7 +37,8 @@
 		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
 		PIPE_CONTROL_FLUSH_ENABLE | \
 		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
-		PIPE_CONTROL_DC_FLUSH_ENABLE)
+		PIPE_CONTROL_DC_FLUSH_ENABLE | \
+		PIPE_CONTROL_TLB_INVALIDATE)
 
 static u32 preparser_disable(bool state)
 {
@@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
 		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
 		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
 		PIPE_CONTROL_QW_WRITE |
-		PIPE_CONTROL_STORE_DATA_INDEX;
+		PIPE_CONTROL_STORE_DATA_INDEX |
+		PIPE_CONTROL_TLB_INVALIDATE;
 
 	flags &= ~mask_flags;
 
-- 
2.40.1

