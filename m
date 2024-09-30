Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01863CF649E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE53510E2CC;
	Mon, 30 Sep 2024 05:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpmrGv01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F09B10E05C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673239; x=1759209239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LB0h4IBQIc61o5Ctt6FDFZGMQnOoUPbNiPPFF2IYQr0=;
 b=OpmrGv01AYfHDTBI9ChWYmUcyHVYCGSRVRsR6bf78BFIjWcXKgp4qgop
 aFqM8/sRY5q3v+3nNtf1aOamYWuyNvecx0DFT9/QHBlGmzT7Mkw+OwdTj
 qq/J+c9FtcEAl8o1BQ24U8FAwjF4SyXN+3aTIIe10DjpXetDFcKtZsNqQ
 VYjcIMmH7u07zIwfAObqaCiTzjcBL4ShDtSR8EvEWO8caDyDQUS2i3U3w
 QcQmMVaJRWi4GPyrLMZQD3Od3MZhNmTfnpVQCMdwxIH5KTIjk8MWa1a9j
 18Czef5hYH6DSIEPRPjQWoc8ugdcExrnf2uX85iDpnxtG79ULLsmCsoaj Q==;
X-CSE-ConnectionGUID: 435Tw1UNSAmZ3DHEFBrBZg==
X-CSE-MsgGUID: mkqgIZM2QHe5/Iew5BLK8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367978"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:59 -0700
X-CSE-ConnectionGUID: 7M4ynzOFTlueWGNWCE3u1w==
X-CSE-MsgGUID: 6m+dBRY9Tvi4kH2JR0OH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752228"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 17/25] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
Date: Mon, 30 Sep 2024 11:01:41 +0530
Message-Id: <20240930053149.1246339-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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
necessarily indicate success. use xe_force_wake_ref_has_domain ()
to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()

v6
- Use helper xe_force_wake_ref_has_domain()

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4c7b677115a8..ecbfbe246861 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -837,7 +837,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1354,6 +1354,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 {
 	struct xe_oa_unit *u = param->hwe->oa_unit;
 	struct xe_gt *gt = param->hwe->gt;
+	unsigned int fw_ref;
 	int ret;
 
 	stream->exec_q = param->exec_q;
@@ -1414,7 +1415,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		ret = -ETIMEDOUT;
+		goto err_fw_put;
+	}
 
 	ret = xe_oa_alloc_oa_buffer(stream);
 	if (ret)
@@ -1456,7 +1461,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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

