Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA7E7718B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 00:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E1110E355;
	Thu, 19 Dec 2024 00:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC3IcSBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184F10E277
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 00:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734567828; x=1766103828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZ7w24Z3jkwhlZjBCmbvwBiwgVqddvieTnLL5N1dOP8=;
 b=UC3IcSBDlcYefnfcj76+lKB2XzASLLWbbgaFK219kWq7OQjJ8z24lffE
 5xGrn9XXV4Sw+ptIB7zvDyjXgchrr/AIoTViutw111Y8cMK4U/RJ/7fFc
 pMJ7niXKPv6aKfSLlm0VlHnhiUKBAwTmQKP+hu+3f00epAW9fMNdaTjNr
 yHdz6r0lEfQ51qhSCVxXfBrOxRVvS898fc9IJwbQeoG/XTSwu93OutcRm
 fUN1InfOtc7bvy3LNKHY03VWqxnnTX5prcGNGzNDENBdJpQP8VFGPsX6/
 oqWKufI1uFdgDuy274RE3EbP9CuacaaDWEFkxdG0O+NW6XxSOVL5Ic3Wi Q==;
X-CSE-ConnectionGUID: CTHwV8h7TeiPo5mbqPe5eQ==
X-CSE-MsgGUID: TKy/IM1sQ0CUtZqxIyXWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46482637"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="46482637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:23:47 -0800
X-CSE-ConnectionGUID: LxMQEpyuTvyGzBJsMldgiA==
X-CSE-MsgGUID: 5pTYM8WEQdCxCohRkLtDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97845789"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 16:23:47 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: jose.souza@intel.com
Subject: [PATCH 2/2] xe/oa: Drop the unused logic to parse context image
Date: Wed, 18 Dec 2024 16:23:40 -0800
Message-Id: <20241219002340.13230-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219002340.13230-1-umesh.nerlige.ramappa@intel.com>
References: <20241219002340.13230-1-umesh.nerlige.ramappa@intel.com>
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

Now that all register configurations are using MI_LOAD_REGISTER_IMM,
drop the logic to parse context image for offset.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 86 --------------------------------
 drivers/gpu/drm/xe/xe_oa_types.h |  3 --
 2 files changed, 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 86dd8fe0b6a5..d627a3777772 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1676,81 +1676,6 @@ static const struct file_operations xe_oa_fops = {
 	.mmap		= xe_oa_mmap,
 };
 
-static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
-{
-	return hwe->class == XE_ENGINE_CLASS_RENDER ||
-		hwe->class == XE_ENGINE_CLASS_COMPUTE;
-}
-
-static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
-{
-	u32 idx = *offset;
-	u32 len = min(MI_LRI_LEN(state[idx]) + idx, end);
-	bool found = false;
-
-	idx++;
-	for (; idx < len; idx += 2) {
-		if (state[idx] == reg) {
-			found = true;
-			break;
-		}
-	}
-
-	*offset = idx;
-	return found;
-}
-
-#define IS_MI_LRI_CMD(x) (REG_FIELD_GET(MI_OPCODE, (x)) == \
-			  REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
-
-static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
-{
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 len = (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
-		   lrc->ring.size) / sizeof(u32);
-	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
-	u32 *state = (u32 *)lrc->bo->vmap.vaddr;
-
-	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
-		return U32_MAX;
-
-	for (; offset < len; ) {
-		if (IS_MI_LRI_CMD(state[offset])) {
-			/*
-			 * We expect reg-value pairs in MI_LRI command, so
-			 * MI_LRI_LEN() should be even
-			 */
-			drm_WARN_ON(&stream->oa->xe->drm,
-				    MI_LRI_LEN(state[offset]) & 0x1);
-
-			if (xe_oa_find_reg_in_lri(state, reg, &offset, len))
-				break;
-		} else {
-			offset++;
-		}
-	}
-
-	return offset < len ? offset : U32_MAX;
-}
-
-static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
-{
-	struct xe_reg reg = OACTXCONTROL(stream->hwe->mmio_base);
-	u32 offset = stream->oa->ctx_oactxctrl_offset[stream->hwe->class];
-
-	/* Do this only once. Failure is stored as offset of U32_MAX */
-	if (offset)
-		goto exit;
-
-	offset = xe_oa_context_image_offset(stream, reg.addr);
-	stream->oa->ctx_oactxctrl_offset[stream->hwe->class] = offset;
-
-	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset\n",
-		stream->hwe->name, offset);
-exit:
-	return offset && offset != U32_MAX ? 0 : -ENODEV;
-}
-
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
@@ -1788,17 +1713,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	else
 		stream->oa_buffer.circ_size = param->oa_buffer_size;
 
-	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
-		/* If we don't find the context offset, just return error */
-		ret = xe_oa_set_ctx_ctrl_offset(stream);
-		if (ret) {
-			drm_err(&stream->oa->xe->drm,
-				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
-				stream->hwe->name);
-			goto exit;
-		}
-	}
-
 	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
 	if (!stream->oa_config) {
 		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 2dcd3b9562e9..52e33c37d5ee 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -138,9 +138,6 @@ struct xe_oa {
 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
 	struct idr metrics_idr;
 
-	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
-	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
-
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-- 
2.34.1

