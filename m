Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FA1CD342E
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05F310E569;
	Sat,  2 May 2026 00:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBGfSEpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94F210E569
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xi0bOpWnXyqe6T+bZH4CtAJIhy5W1spEDw9fxVTxNCU=;
 b=lBGfSEpR+MjPfU1IePK3mYpHNjeH44YAvAO0A/uaZc83Y856Iq0JaPXS
 Yc0FJCFZSRoM56fX7yMaXOAMS3n8eWnHY/Ne009EeDXvOYeI87D+UQHu8
 yGyjsqQ/JgOHBb1334bUUvLd7hbfjb7K3QHPSbTUxIxJdoJhZ5oV03Oug
 nmg6s+hnztuqd9zz5HRv+4kztpJZko8ig3BxQ8zx4kx4qYfVFAK2FgMc1
 LPdLRCpCWqHf27+8EUI5t0+B+tAA3esG+5aUcOibgzD+PUKQzMZ/w7pER
 kxINrRH64G0eeaI4hZC5UFryJ9xoBwrOC2BGq5z/5kTwh4ktbRGwD6djz Q==;
X-CSE-ConnectionGUID: uWbc6PGaRuW9g6m1nkRu5w==
X-CSE-MsgGUID: c/KNkzmpSMiBTa9YwiGDCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841563"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841563"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: KiNtTDqsTBOE86u3pyEbQQ==
X-CSE-MsgGUID: 8aZPen5EQAKRG3d9dgEWUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510959"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 8/9] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Date: Fri,  1 May 2026 17:53:41 -0700
Message-ID: <20260502005332.3135977-19-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

Each queue in a multi queue group has a dedicated timestamp counter. Use
this QUEUE TIMESTAMP register to capture the start timestamp for the
job.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Use xe_lrc_is_multi_queue for check (Niranjana)
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index cfeb4fc7d217..39a670e91ba7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 			       u32 *dw, int i)
 {
+	const struct xe_reg reg = xe_lrc_is_multi_queue(lrc) ?
+				   RING_QUEUE_TIMESTAMP(0) :
+				   RING_CTX_TIMESTAMP(0);
+
 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+	dw[i++] = reg.addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
 
@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 	if (IS_SRIOV_VF(xe)) {
 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
 			MI_SRM_ADD_CS_OFFSET;
-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+		dw[i++] = reg.addr;
 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 		dw[i++] = 0;
 	}
-- 
2.43.0

