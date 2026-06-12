Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B46CD98C7
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 03:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC23310E91B;
	Fri, 12 Jun 2026 03:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1tCUaCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127A10E91B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781234879; x=1812770879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l+Gf3zqYcZyQOYH3gKVzVHfab3IVXj+qVf8+qfYZC28=;
 b=N1tCUaCZGr+Wrb5vh+caRC9/V4K0oy1SQR9+D3MOvSkXXDqnALZqYR3s
 Z5MleLxBuCvGwHsYzY1Cw74VDFTXjvTy5b4jGjD8pqq30Qiqc+GaUhFHO
 BVZBFyh/EPYez+nA3eG/NUgJLzxG9q59gE4RF8O+4bdJXRLK6F7zJGqqy
 FQOqjBNIk9Zi/CUnycSGtEoMIzeRsPDcoOExMJ5IBCaaMUz6OtsYug5Ux
 cNTdF9Gvy0vPHNX01rCNTyJg2206Yqfm1Hbj+kcVbZQLa7AVSBmSsvhvn
 x4JOvKMZ2nYIFvvxL0PBor0twHR0FfNK5XNN5otGKg2ozbBH3wLyFbkZM g==;
X-CSE-ConnectionGUID: 1cSUF7AVTD+f8c3zSX88Tw==
X-CSE-MsgGUID: Qa4eun/NRJ+HtttGmXjJCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85902940"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85902940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:59 -0700
X-CSE-ConnectionGUID: +5Ar2WESQS2bqgyCoLjBZw==
X-CSE-MsgGUID: SrvrnK0uSq2Q0ibzVAKUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251789712"
Received: from adarshdx-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.178.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:57 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
	Uttamchand@freedesktop.org
Subject: [PATCH 2/2] [PATCH] drm/xe/guc: treat sentinel timestamps as no
 elapsed time to avoid false TDR
Date: Fri, 12 Jun 2026 03:27:48 +0000
Message-ID: <20260612032745.179673-6-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
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

From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>

Problem: Using LRC ctx_timestamp values 0 or the CONTEXT_ACTIVE
sentinel in time-delta calculations can produce a large wrap-around
result, which can trigger a false TDR.

Fix: Detect the sentinel values and treat them as "no elapsed time"
(return false). Compute the delta with wrap handling when
ctx_timestamp < ctx_job_timestamp by adding U32_MAX, ensuring
correct diff calculation across the 32-bit wrap. Runtime logic is
otherwise unchanged.

Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b29cc08e6291..b870ad30fe8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1389,7 +1389,22 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	 */
 	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);

-	diff = ctx_timestamp - ctx_job_timestamp;
+	/*
+	 * Values treated as "no elapsed time":
+	 *  - 0: uninitialized / context never ran
+	 *  - 1: CONTEXT_ACTIVE sentinel set at context start; real timestamp
+	 *       hasn't been saved yet (using it in a diff can wrap and cause
+	 *       a false TDR).
+	 */
+	if (ctx_timestamp == 0 ||
+	    ctx_timestamp == lower_32_bits(XE_LRC_CTX_TIMESTAMP_ACTIVE))
+		return false;
+
+	if (ctx_timestamp < ctx_job_timestamp) {
+		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
+	} else {
+		diff = ctx_timestamp - ctx_job_timestamp;
+	}

 	/*
 	 * Ensure timeout is within 5% to account for an GuC scheduling latency
--
2.43.0

