Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC9D277D6
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CAA10E2FC;
	Tue, 13 Jan 2026 02:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTGs/1wT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366C10E307
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272759; x=1799808759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NNERI+pLy9TgmQOui95U+SV/xnT+qHRWb/uzVENIAUs=;
 b=HTGs/1wTVR1N5Mzt1dkIKlVW7iocUi3foMVLuHgmNom+rgjwRNAZSSeT
 wlXfnPoCCcT8QPcVJpPTrrEb3U2AvIs4Tv+6WHIx9j8vAcpQlm+LahT4t
 VsMn3ZpbWkhHp/2+SmLpllYOtPlJIPkB5ps+4R3UmbiXRV5GgLSl+YjwX
 LDap98DElSUPkFYwxP4LccUYOKnoONgcsVO1OfIucVZIoY1mZZAtngRry
 De08vwohEyXAIcg5u/61UUMmGAeoGOXZdp99LuCnbCxLxJlY991G4IEgj
 ulf+NBPLhaRE2f2E8W1gtT3ibohcZTHw1j2uvrS8ZG5AbyFq3H5GsTLqF g==;
X-CSE-ConnectionGUID: ItK2rJakRnOKkl72WuWQeQ==
X-CSE-MsgGUID: MHEcIuRnTM2dh2CvCmW70g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714530"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: FezdQJguTSW4VSYx4ylXNA==
X-CSE-MsgGUID: DziPgSirQpahtTcjuzwu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070327"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 07/12] drm/xe: Rename send_tlb_inval_ppgtt to
 send_tlb_inval_asid_ppgtt
Date: Mon, 12 Jan 2026 18:52:27 -0800
Message-Id: <20260113025232.3504648-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Context-based TLB invalidations have their own set of GuC TLB
invalidation operations. Rename the current PPGTT invalidation function,
which operates on ASIDs, to a more descriptive name that reflects its
purpose.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 43f6dbcb2bc2..a6a1c371a28e 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -150,9 +150,9 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				u64 start, u64 end, u32 asid,
-				struct drm_suballoc *prl_sa)
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid,
+				     struct drm_suballoc *prl_sa)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
 	struct xe_guc *guc = tlb_inval->private;
@@ -219,7 +219,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
 static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
 	.all = send_tlb_inval_all,
 	.ggtt = send_tlb_inval_ggtt,
-	.ppgtt = send_tlb_inval_ppgtt,
+	.ppgtt = send_tlb_inval_asid_ppgtt,
 	.initialized = tlb_inval_initialized,
 	.flush = tlb_inval_flush,
 	.timeout_delay = tlb_inval_timeout_delay,
-- 
2.34.1

