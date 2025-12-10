Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49266D3C92C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 16:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072A010E760;
	Wed, 10 Dec 2025 16:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZbEnM/7U";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6C10E760
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BZA1jat0cFB02HwAr2GZ7HVVPgOgjbkMkg6fkWllXt8=; b=ZbEnM/7Uotz65IARBPSdFc0bql
 ZacWEiNkY09MEOq6fRL5TfJWXSsnScizmuY98qiDO0gfFV0Pt6oWHrjxOhBjXFG4FbUr3yjRNGx3L
 WQEkqmmZc/jgENtJd4CjVKkJt/IrL9W0F973AeHymp9179ciGHtvxcGuL8SM/CVBf22JXqNO9WpRA
 JMCfEcOJWbYzc8vtifvesoiWpLNcSlZ0nPtzgn2ewXZ6wv8XzS6e12S45SqyivuWkNq5vB8rVoVa9
 3W+we1swS/sEN6+eGwZSgtOvIo8Q3XZXWc40mXaWeyQnF+ebWavRAk3xRqNL53WKlz4FJtikimvpZ
 D5Ip/syg==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTMqF-00B2fe-Sc
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:15:04 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 05/11] drm/xe/xelp: Wait for AuxCCS invalidation to complete
Date: Wed, 10 Dec 2025 17:14:51 +0100
Message-ID: <20251210161457.14394-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210161457.14394-1-tursulin@igalia.com>
References: <20251210161457.14394-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

On AuxCCS platforms we need to wait for AuxCCS invalidations to complete.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 9 ++++++++-
 drivers/gpu/drm/xe/xe_ring_ops_types.h           | 2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c47b290e0e9f..49d8ffd026d5 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -81,4 +81,10 @@
 #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
 #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
 
+#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5)) /* XeLP+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
+#define   MI_SEMAPHORE_POLL		REG_BIT(15)
+#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc806cabb5c3..a8d1854dd8e9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -56,7 +56,14 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
 	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
 	dw[i++] = reg.addr + gt->mmio.adj_offset;
 	dw[i++] = AUX_INV;
-	dw[i++] = MI_NOOP;
+	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
+		  MI_SEMAPHORE_REGISTER_POLL |
+		  MI_SEMAPHORE_POLL |
+		  MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = 0;
+	dw[i++] = reg.addr + gt->mmio.adj_offset;
+	dw[i++] = 0;
+	dw[i++] = 0;
 
 	return i;
 }
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 477dc7defd72..1197fc0bf2af 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 70
+#define MAX_JOB_SIZE_DW 74
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.52.0

