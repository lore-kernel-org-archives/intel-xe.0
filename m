Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FBC28B30
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 11:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12CC10E566;
	Tue, 11 Mar 2025 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbkCVz0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0710E562
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741693278; x=1773229278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AUBw/WGuFIn9ad1vv6IEBrYES4WNx0bo1QEhDplmxFo=;
 b=KbkCVz0F5gS3QnZ6sPEneKQC5rpBTbk/XMfKHhpr/nn6Z7AgYL8II6jE
 0TaAIYHTfdhLr/uorJ0xc6RoVbeqU2MQuPV635SufXnaWR34rZX29zX2w
 Tk/RUWRV04fCEd6qk05M3VBDkQWOccA4Us2SjJg5PBx2ThZyMtSTZlVqr
 F+jR/h0IEvjYLoYiR4kWdRACmUKvrTUgDZjXFA9qFLJkf0yNHu8EQLtS6
 oJgJ8U7Ql+3i2h7PeihI/RdaaWVYjtsAAZiKR9mGS/g1byB14gJ8LlxpV
 BO157N9o7j2UMZjnEAAYCDJArByT8soNrjeIshuKXGdFOrTVwXNdw7qht w==;
X-CSE-ConnectionGUID: hzGlWQVNROaQGZten20TAA==
X-CSE-MsgGUID: Kxg8YVsLQ8ScVB/d18M1fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42637133"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42637133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:17 -0700
X-CSE-ConnectionGUID: 4NCCErUqTiyUgXx1Kha4dw==
X-CSE-MsgGUID: WrugQ0otQwqGnUHE95TB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120015691"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/pf: Drop CTC_MODE from VF runtime register list
Date: Tue, 11 Mar 2025 12:40:42 +0100
Message-Id: <20250311114042.1954-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250311114042.1954-1-michal.wajdeczko@intel.com>
References: <20250311114042.1954-1-michal.wajdeczko@intel.com>
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

This register shouldn't be used by the VF drivers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 4efde5f46b43..821cfcc34e6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -112,7 +112,6 @@ static const struct xe_reg tgl_runtime_regs[] = {
 	XELP_GT_SLICE_ENABLE,		/* _MMIO(0x9138) */
 	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
 	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
-	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
@@ -124,7 +123,6 @@ static const struct xe_reg ats_m_runtime_regs[] = {
 	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
 	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
 	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
-	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
@@ -136,7 +134,6 @@ static const struct xe_reg pvc_runtime_regs[] = {
 	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
 	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
 	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
-	CTC_MODE,			/* _MMIO(0xA26C) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
@@ -150,7 +147,6 @@ static const struct xe_reg ver_1270_runtime_regs[] = {
 	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
 	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
 	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
-	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
@@ -167,7 +163,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
 	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
 	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
-	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
@@ -185,7 +180,6 @@ static const struct xe_reg ver_3000_runtime_regs[] = {
 	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
 	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
-	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
 };
 
-- 
2.47.1

