Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC12FC369D8
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 00:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1B10E9DA;
	Sat, 26 Apr 2025 00:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDHFuYSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9400F10E167
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 00:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745627397; x=1777163397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LoSSwPz6Q0DcMxb/yu8TqUXI4+fT8yMKxYb8QO+eT9w=;
 b=WDHFuYSjA935/GaTdSv4uakVxd5ChckuptoI//EoZHA0yK/+Npi/ObAG
 KO69TXnOUGf0hDLD5WlMioqMVRmAWqiA9FpWyoAqTgSM4GoKn2XoHMBiW
 OULhg6A6S+K8N3fMoOS33AX+KZs2takKan/hKh5bum69LBzIFzSkBoRV2
 tMS7khzJqh1HAOoIhhOw4cQgUwdEYJ6xsFBbQeoNrdQincmiDX0ASCC33
 uoyQd+2BUW1HFXiWBabR+yUYMcpBouCukC8TUs54VzGQGyFVniEPbzfwf
 8sWk8e2wnyGzIHvefkoAhYb5XQpnLemkx5a4q9HlYNUSWX8ecH0NBsE0C A==;
X-CSE-ConnectionGUID: ASUv6SlHRXiCjM97rZct0A==
X-CSE-MsgGUID: HY6NZb8OTSaUrgIENSWF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46532993"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="46532993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
X-CSE-ConnectionGUID: wqfpbwj9Rgi1S6uQLKKRAQ==
X-CSE-MsgGUID: 9DyKQJxNTqePG+LqFp3H4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="138134881"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC
 value
Date: Fri, 25 Apr 2025 17:29:49 -0700
Message-ID: <20250426002951.1795492-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
References: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
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

For determining actual job execution time, save the current value of the
CTX_TIMESTAMP register rather than the value saved in LRC since the
current register value is the closest to the start time of the job.

Fixes: 65921374c48f ("drm/xe: Emit ctx timestamp copy in ring ops")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae6..bc1689db4cd7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -234,13 +234,10 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 
 static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 {
-	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
-		MI_COPY_MEM_MEM_DST_GGTT;
+	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
+	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
-	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
-	dw[i++] = 0;
-	dw[i++] = MI_NOOP;
 
 	return i;
 }
-- 
2.43.0

