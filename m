Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500B6C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF110E109;
	Wed, 28 Feb 2024 06:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXyyedL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70C10E3CB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ot3CJmYtMv/eAfsus3dANmcY72C4Q3oEZl9NvgoIf+w=;
 b=iXyyedL/tEfujNAPqFxccJc8PvB+0eEDDknD6P5r1lc8uXNA6GUEARLA
 2uUJzO7OQsoC0GWJQ4VhUs+gJxmBK1FQuwldQtlxBXXUUD6HisbBJVDPw
 5YQKEWyhoukgjOpfaIcgVB+iqAiR0F0O+JcmthMrSA1O9GevEL/svPtud
 LD0bp0shGnvcf6lSoOBewWcUEiMv9yFokxNiaWNRG6HZ5eNmiTYRCfA3C
 cmX7ACSalCUjcFywM13XwarCD19k4/BxrUU9NMo9u9D/YLVtCdHZgkEFf
 iQHtFTpEYtN+rGcwzYqInsiIfC9cf6d92VkQmGjmAZnEs9fpxFGztZbGB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950315"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290281"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/mocs: Be explicit when logging number of entries
Date: Tue, 27 Feb 2024 22:10:45 -0800
Message-ID: <20240228061048.3661978-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228061048.3661978-1-lucas.demarchi@intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
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

Make sure to log if number of entries are l3cc or mocs so it doesn't
depend on the context. Also the warn-once in __init_mocs_table()
is more a sanity check that should be done as the first thing in that
function, so move it up.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 001e4301c639d..bdb755b963238 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -470,7 +470,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 mocs;
 
-	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
+	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
 		      "Unused entries index should have been defined\n");
 	for (i = 0; i < info->n_entries; i++) {
@@ -510,7 +510,8 @@ static void init_l3cc_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 l3cc;
 
-	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
+	mocs_dbg(&gt_to_xe(gt)->drm, "l3cc entries: %d\n", info->n_entries);
+
 	for (i = 0; i < (info->n_entries + 1) / 2; i++) {
 		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
 				    get_entry_l3cc(info, 2 * i + 1));
-- 
2.43.0

