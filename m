Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7201CCD129C
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ADD11277B;
	Mon,  8 Apr 2024 16:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKIc0XQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A6F112779
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593758; x=1744129758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EaZn3FJwlyWdNmW+5VEiKFTMYQK1PGqZU1g3/jRMXTQ=;
 b=HKIc0XQAtbysUJx3FopR51233GWrHdVfLaLzTxmpgQguvRsorDbnakGx
 kIdmhMhPQUbB0qqwKw28Oq8id80CTuZYlqZp5XFXNk7Y20IdWIroZbWPY
 uzIiTnpXqstWflsVIU5xezJ9tuaV2PughFOgIO+SuHybJwhrLT0ScvSi0
 F+g+P9ZZJwSgLvs5MFAntwEaHu8BnMe0hShSy/2sKs5lR1G6P1BIsi8Na
 TL8//Hz94Zti3Oa+Fr2TOjbpS6hAgKJfqkaDG6ZHtDqZQkxWt6nHOGfMl
 Fjoz7r25wLwcDHdY65h6g5fNrEA45QRLjCR1gyCVocBC4sL3wvNTjfBiS w==;
X-CSE-ConnectionGUID: h9gsS6y1Tf6tNgiSISDfFQ==
X-CSE-MsgGUID: wt2NxVQgRm+sLMS4E+D6sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024970"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:18 -0700
X-CSE-ConnectionGUID: V8wwVXSgThCgMgUCcgrqOw==
X-CSE-MsgGUID: gOiGtoPRSoiCB4X+itdumA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683506"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:15 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 06/11] drm/xe/bmg: Program an additional discrete-specific
 PAT setting
Date: Mon,  8 Apr 2024 21:59:08 +0530
Message-Id: <20240408162916.3767771-12-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Discrete Xe2 platforms require programming of one additional row of PAT
settings which controls the access characteristics for PPGTT and LMTT
page tables.  Integrated GPUs do not need this programming and will
leave the register at its hardware default value.

Bspec:  71582
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 66d8e3dd8237..13812042177d 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -142,6 +142,7 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
 
 /* Special PAT values programmed outside the main table */
 static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
+static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
 
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
@@ -302,6 +303,9 @@ static void xe2lpg_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 {
 	program_pat_mcr(gt, table, n_entries);
 	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe2_pat_ats.value);
+
+	if (IS_DGFX(gt_to_xe(gt)))
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe2_pat_pta.value);
 }
 
 static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
@@ -309,6 +313,9 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
 {
 	program_pat(gt, table, n_entries);
 	xe_mmio_write32(gt, XE_REG(_PAT_ATS), xe2_pat_ats.value);
+
+	if (IS_DGFX(gt_to_xe(gt)))
+		xe_mmio_write32(gt, XE_REG(_PAT_PTA), xe2_pat_pta.value);
 }
 
 static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
-- 
2.25.1

