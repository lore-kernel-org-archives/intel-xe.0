Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F18FCF9C6F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518710E89A;
	Tue, 24 Sep 2024 11:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOY4fIiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A63F10E89D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179138; x=1758715138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUCXdV0PASPzzSukWK68BqJXxZ3p+6FAyOZ1SSkcxQs=;
 b=QOY4fIivZXmy+cSxSjEh7DUSYkU/cu9DJPQJg+DLlebPQI61K/4XufFB
 XFCUtWiAtt36LLhRwWcBYpDn3bgNqWGnSQeRQc4nei8bEjZ9KBaCDeDZA
 cXg2+gFxIIo8T0zF62/TSBROB3hVoAmwDue3fr6Aw/BoYORYuOWp0alEV
 X053df6QLR4l77b4AAsB5kzqlXRlltF1TcCaUrfvpoVx82oW4ZQot+2SE
 vVbj81w2Me1kxy2h2haY7/qcGVYmfHIumHAKX7ZK+BE4Hp9wl+iaTTtlI
 EsuAmYy9NTorVAq88zePUdeQ8kLDNgQI2VAMpPVk/sz7wENnN8+Zv8iIQ A==;
X-CSE-ConnectionGUID: 7QF74bmMS1azd7Kgzjiv7g==
X-CSE-MsgGUID: r4rGPjx2Tl6Yi1xtpTjrUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957028"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:58 -0700
X-CSE-ConnectionGUID: tMNy3mmCTzS99jvXnYn+nw==
X-CSE-MsgGUID: HV1McsVEQ6ScysMrIiJhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319219"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 15/23] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
Date: Tue, 24 Sep 2024 17:46:33 +0530
Message-Id: <20240924121641.1045763-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 354ee9045efc..06e71a86cbcb 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1357,6 +1357,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 {
 	struct xe_oa_unit *u = param->hwe->oa_unit;
 	struct xe_gt *gt = param->hwe->gt;
+	unsigned int fw_ref;
 	int ret;
 
 	stream->exec_q = param->exec_q;
@@ -1417,7 +1418,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (fw_ref != XE_FORCEWAKE_ALL) {
+		ret = -ETIMEDOUT;
+		goto err_fw_put;
+	}
 
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
@@ -1459,7 +1464,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_fw_put:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
-- 
2.34.1

