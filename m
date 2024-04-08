Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546DCD129C
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3B01128C8;
	Mon,  8 Apr 2024 17:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+bfDG0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36411128C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595935; x=1744131935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EaZn3FJwlyWdNmW+5VEiKFTMYQK1PGqZU1g3/jRMXTQ=;
 b=B+bfDG0NMTo0kM/uWjI+OuWq6l07c9PC62PBBty7ZfKBPmAGmOriR43T
 GTXS14LDrhwpGZt99nx/4ifE7lY2HpAIotIoiIteO9ULbcIUsxvbOYYMj
 lbMy3aDoi78kZy1BsL9BZEGS0JaPYmQlJcuWQwCN2auNEt5oajZ9mubmw
 jVzMhuQVWUHi8/lFpZMc8ZAXogFQ/OWHmx3MVdomcJ8kiWtwAmha5TZm6
 w4gva7vDBx7I/+Koo3q3zZZK5A0l18rhY5pvlScs0bTBPek3+80WwRpMD
 bWDIy/XaQe3MxWu+b5Ov51XWOAod2WmhJG2N4SHFCBopPOL8nKhAQnoRo g==;
X-CSE-ConnectionGUID: o5RHwWxUTAa2YxH5NsfOkQ==
X-CSE-MsgGUID: xJRsIKrdTpCQMnH+CIVg1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679148"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:34 -0700
X-CSE-ConnectionGUID: rP4s6VUUQpavuKjERmnICQ==
X-CSE-MsgGUID: G/sfKGfkQkytsFz5lciKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733858"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:33 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 05/11] drm/xe/bmg: Program an additional discrete-specific
 PAT setting
Date: Mon,  8 Apr 2024 22:35:39 +0530
Message-Id: <20240408170545.3769566-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

