Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB0C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8810E3AE;
	Thu,  4 May 2023 07:33:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99A810E3AE
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zolMR6Bjv7K+xgedUmv46E7f8JLoYHPwwmUrnbQBTE0=;
 b=Edo5bcmz/7yzlnYP7SIZZZoJGq5bhAeVDK6NDAF9vpuI8Ba7FzASxXSD
 THVga/aaerK1duqJrlGQvy9e1V71jhvaI2r+gMiu8xcDEG8YbQV4DjacN
 0p31hOngvUZsuQ9BBD/H/XTpskdnbMmTRmnVOnsZ2dVuSsksuIpChoJtd
 wr8bE/4pLMEeTyh88X3VOL3D8klKSo7oeTQLQNfvmurPpblN+RuMVxHe1
 uaCUq/AwvtecuBSmc8mG4+CHxjtH577yMU3akaTPMhy7lqBf0K1ZgBWpS
 VSvr2LSkAQQbwYaVQnzNnhf/mniirpvMxj7EOqK/WWA5j64dcee+ald4s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323829"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323829"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439424"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439424"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:44 -0700
Message-Id: <20230504073250.1436293-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe: Do not mark 1809175790 as a WA
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Additional programming annotated with Wa_<number> should be reserved to
those that have a official workaround. Just pointing to a bug or
additional reference can be done with something else. Copy what i915
does and refer to it as "hsdes: ....".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5e61b6e61f3a..75838b8bb9a8 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -199,7 +199,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	bool decode = job->engine->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
 	dw[i++] = preparser_disable(true);
-	/* Wa_1809175790 */
+
+	/* hsdes: 1809175790 */
 	if (!xe->info.has_flat_ccs) {
 		if (decode)
 			i = emit_aux_table_inv(gt, VD0_AUX_NV.reg, dw, i);
@@ -244,9 +245,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 	i = emit_pipe_invalidate(mask_flags, dw, i);
-	/* Wa_1809175790 */
+
+	/* hsdes: 1809175790 */
 	if (!xe->info.has_flat_ccs)
 		i = emit_aux_table_inv(gt, GFX_CCS_AUX_NV.reg, dw, i);
+
 	dw[i++] = preparser_disable(false);
 
 	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-- 
2.40.1

