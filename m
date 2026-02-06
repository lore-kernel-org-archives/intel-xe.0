Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE40EE6B4D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D84310E8A5;
	Fri,  6 Feb 2026 18:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZN74qFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C995210E8A8;
 Fri,  6 Feb 2026 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770402994; x=1801938994;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KrzNPHf44BtIQsjX0q5tkrdLPMcp2L/t41PNvtgeel0=;
 b=kZN74qFf8dY/oKjuQYLLdvvfJa8p7GgwYlmjYcbX5MRH46Dv+3zqK3bx
 foAIQMR+MdNFPiLQNnbNEMEL7C6s7sKGVq8RYcNrgvnECj6dKmSMs2Inn
 PzPu2k3+KfddzPDaTzWafX5CNV6CljtBoS7nLU2QxiVJMRwZ7ASa7HOTp
 qTwomPJwVBkM1mV+BGa3uCMt7R2AMtWbZP21NySfG/XLPmYmu+s/Yqdxa
 W8RnXCaeLTRBJe7uYVqbzkHVL88P8Ae58epkH5KPYd4XdQiSdylQZRjY+
 /nuo3XVxssH2pHJJmfBAdtDfdNyvR9MPkHlUqEqWhO2HA6U8JevwiAX/c w==;
X-CSE-ConnectionGUID: JeMrDFkaRwuMvZ7qhUwXnQ==
X-CSE-MsgGUID: ttMU79AVQpOBCx3ulnlNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516932"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:34 -0800
X-CSE-ConnectionGUID: +fUIWIRBSku6P/bSAV/+0g==
X-CSE-MsgGUID: DT4kbCiKSGeBDuxUpXmH/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224730"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:33 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:00 -0300
Subject: [PATCH v3 04/15] drm/xe/xe3p_lpg: Add new PAT table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-4-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
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
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
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

