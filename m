Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73FFECD9B8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00810E192;
	Thu,  5 Feb 2026 23:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSmL6E0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9A210E177;
 Thu,  5 Feb 2026 23:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334832; x=1801870832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=57XA19AnK05E0vS8AQcirwAEzG2InaonXd0jYDeqp5Q=;
 b=QSmL6E0h9cV2s1AU2XMJZKOlaVF7qGXjPkma3msntIEKpsH7OEJiey1X
 RDVyff8aLM+jaCttKa4jDnXA2DqODM885dWr2yN/JhBhSHXPDO5KUq+bG
 Pm+1U3S9q124kOLUSLlVsn4H148m4DaodewmoQfZPN3NNFeNAULuwbZCG
 Eflgr7xAz5yZ0btF3boKJfHweFcoQrvRA60ve22K81ujxMQlVbrEbiCus
 4jzFW2C9wzRmmboRnl2h6Ud7qY7wEOOg9mJHxejOP1RIkXeM93FCXRNCy
 woGFX9d6FGePZDLGhkRGu+isEAwVOMkAT4Hlls6JOhQezAyud/fxgdywh w==;
X-CSE-ConnectionGUID: a9crxMZRRpaAal7IP+RmYQ==
X-CSE-MsgGUID: h8Ma/Jg6QdajTg0IMimiyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658682"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:32 -0800
X-CSE-ConnectionGUID: gjUiXt1fRAGtJa9Gk0GNhg==
X-CSE-MsgGUID: Q6P59zzLRjyr7YX9vupWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500124"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:18 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:32 -0300
Subject: [PATCH v2 04/15] drm/xe/xe3p_lpg: Add new PAT table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-4-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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

PAT programming for Xe3p_LPG is more similar to Xe2 and Xe3 than it is
to Xe3p_XPC.  Compared to Xe2/Xe3 we have:

* There's a slight update to the PAT table, where two new indices (18
  and 19) are added to expose a new "WB - Transient App" L3 caching
  mode.

* The PTA_MODE entry must be programmed differently according to the
  media type, and both differ from Xe2.

There are no changes to the underlying registers, so the Xe2 ops can be
re-used for Xe3p.

Bspec: 71582, 74160
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 55 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 5ba650948a4a..f840d9a58740 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -124,7 +124,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
  *   - no_promote:  0=promotable, 1=no promote
  *   - comp_en:     0=disable, 1=enable
  *   - l3clos:      L3 class of service (0-3)
- *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
+ *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"),
+ *                  2=XA ("WB - Transient App" for Xe3p), 3=UC
  *   - l4_policy:   0=WB, 1=WT, 3=UC
  *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
  *
@@ -253,6 +254,44 @@ static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
 	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
 };
 
+static const struct xe_pat_table_entry xe3p_primary_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 3);
+static const struct xe_pat_table_entry xe3p_media_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 2);
+
+static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),
+	/* 17 is reserved; leave set to all 0's */
+	[18] = XE2_PAT( 1, 0, 0, 2, 3, 0 ),
+	[19] = XE2_PAT( 1, 0, 0, 2, 3, 2 ),
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
+};
+
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
 	WARN_ON(pat_index >= xe->pat.n_entries);
@@ -508,6 +547,20 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_NONE] = 3;
 		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
 		xe->pat.idx[XE_CACHE_WB] = 2;
+	} else if (GRAPHICS_VER(xe) == 35) {
+		xe->pat.ops = &xe2_pat_ops;
+		xe->pat.table = xe3p_lpg_pat_table;
+		xe->pat.pat_ats = &xe2_pat_ats;
+		if (!IS_DGFX(xe)) {
+			xe->pat.pat_primary_pta = &xe3p_primary_pat_pta;
+			xe->pat.pat_media_pta = &xe3p_media_pat_pta;
+		}
+		xe->pat.n_entries = ARRAY_SIZE(xe3p_lpg_pat_table);
+		xe->pat.idx[XE_CACHE_NONE] = 3;
+		xe->pat.idx[XE_CACHE_WT] = 15;
+		xe->pat.idx[XE_CACHE_WB] = 2;
+		xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = 12;
+		xe->pat.idx[XE_CACHE_WB_COMPRESSION] = 16;
 	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		if (GRAPHICS_VER(xe) == 30) {

-- 
2.52.0

