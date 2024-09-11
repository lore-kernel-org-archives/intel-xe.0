Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CEFEE57D1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30BA10EA80;
	Wed, 11 Sep 2024 20:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XApUQtfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BC10EA84
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084950; x=1757620950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mOlZQoC8JF8D0aCT5O0wo/459Sl3Yaqwz2paQyYz1ok=;
 b=XApUQtfFflG3nLCGn/IOPtWcsG0Ykuvzz0NNmOD1XQ+r84pt02ZpR+vF
 E6x6edX9SnfzdvWs+EH6mKbPfS+C/80/ek7gIIsoLvaolL86ux3Esjh5S
 snwZgWi62JV3MQLFmBNmUZGH2tZaLgFyDGChYvlXSJC1CoVpHQzg6Tsmm
 bF/55ONkZQDe885GlKK+HfiS1WTsPfi7P4kfYeCOQZJHzXthOu9ctnHGV
 2RdcLesrVjThN+Ebx7N/VLdQEEUdUIKJuXVoPUBkiwYtCWCkA/ZshCES0
 kLPwWAfLbbF19L72Jk1H8uamTqy14d7unwxExyDn/ZWp8dGn9/m6g5cZn A==;
X-CSE-ConnectionGUID: f4P8A5LtRjeoTDiVvQwRSA==
X-CSE-MsgGUID: iSuWTTOUQRizXNaGgcPcgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25066822"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25066822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:30 -0700
X-CSE-ConnectionGUID: bnwXLrmQT8aUa1oj8CVQag==
X-CSE-MsgGUID: AWtICQtjQPKg7Asrbr+1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98177344"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:30 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 3/3] drm/xe/oa: Fix overflow in oa batch buffer
Date: Wed, 11 Sep 2024 13:02:18 -0700
Message-ID: <20240911200218.130219-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
References: <20240911200218.130219-1-jose.souza@intel.com>
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

By default xe_bb_create_job() appends a MI_BATCH_BUFFER_END to batch
buffer, this is not a problem if batch buffer is only used once but
oa reuses the batch buffer for the same metric and at each call
it appends a MI_BATCH_BUFFER_END, printing the warning below and then
overflowing.

[  381.072016] ------------[ cut here ]------------
[  381.072019] xe 0000:00:02.0: [drm] Assertion `bb->len * 4 + bb_prefetch(q->gt) <= size` failed!
               platform: LUNARLAKE subplatform: 1
               graphics: Xe2_LPG / Xe2_HPG 20.04 step B0
               media: Xe2_LPM / Xe2_HPM 20.00 step B0
               tile: 0 VRAM 0 B
               GT: 0 type 1

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d3043078d89f1..37c084b3f74d8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -575,7 +575,7 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 	int err = 0;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
-	job = xe_bb_create_job(stream->k_exec_q, bb, true);
+	job = xe_bb_create_job(stream->k_exec_q, bb, false);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto exit;
@@ -666,6 +666,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 	}
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	err = xe_oa_submit_bb(stream, bb);
 	xe_bb_free(bb, NULL);
@@ -685,6 +686,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 	}
 
 	write_cs_mi_lri(bb, reg_lri, 1);
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	err = xe_oa_submit_bb(stream, bb);
 	xe_bb_free(bb, NULL);
@@ -884,6 +886,7 @@ __xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa
 		goto err_free;
 
 	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	oa_bo->bb = bb;
 	oa_bo->oa_config = xe_oa_config_get(oa_config);
-- 
2.46.0

