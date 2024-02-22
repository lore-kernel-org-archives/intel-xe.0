Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12636C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 20:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57EF10EA60;
	Thu, 22 Feb 2024 20:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcij3Mgz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A0010EA60
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 20:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708634498; x=1740170498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LC/87nW1vqlinW65UaPlZ+KjR9wyXAmOdnjibRG0KaU=;
 b=kcij3Mgz0A83DiPOQp/r4Bho1udVihC3u7RUQFWxbWlL6ni3LdaEDcFB
 dE3Y3kMdF6cQkwqIGWBpu0YKEkSL43RGa3SbWQmohULXPkyCzZmMGdRu6
 DVgijO0xfqlRY337Wm2l5QAAHV1v3qvBBLqhQSl3GlRxU+TsJiJ+/D2dz
 YWQjBYUqV6/XKVtmb6bWzY7CIikLIOjMauZT2XdrzLluzV3lY9o0HAM6B
 PG0BbgEalAtkygMEaya67bgbYB49ianNeYXFl36qew0ZrboS20crT9W9X
 UB1ImaG5PE68Atq8sqwDUp4HhVryNqOTXAuDfRuX9F6T4wK+9XF1xntTx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13601793"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13601793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5520435"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 12:41:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/dg2: Fix number of mocs entries
Date: Thu, 22 Feb 2024 12:42:03 -0800
Message-ID: <20240222204203.3007498-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

While investigating why xe_mocs kunit was failing for DG2, Matt Roper
noticed that LNCFCMOCS[31] is actually RO for DG2. It would be a spec
bug to document a register to be programmed that is actually RO. However
upon further inspection, it seems like we should not be programming the
other values. Early DG2 SKUs documented that the entire set of
LNCFCMOCS registers needed to be programmed, but this is not true
anymore.

Do like is done in MTL: the additional registers are there, but we are
not supposed to program them, not even with the unused_index value.

While at it, fix MTL define to follow the same alignment as others, with
tabs.

Bspec: 44988, 55267
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 609d997b3e9b0..bb28c26a46d5b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -71,8 +71,9 @@ struct xe_mocs_info {
 
 /* Helper defines */
 #define XELP_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
+#define XEHP_NUM_MOCS_ENTRIES	4
 #define PVC_NUM_MOCS_ENTRIES	3
-#define MTL_NUM_MOCS_ENTRIES    16
+#define MTL_NUM_MOCS_ENTRIES	16
 #define XE2_NUM_MOCS_ENTRIES	16
 
 /* (e)LLC caching options */
@@ -401,7 +402,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->size = ARRAY_SIZE(dg2_mocs_desc);
 		info->table = dg2_mocs_desc;
 		info->uc_index = 1;
-		info->n_entries = XELP_NUM_MOCS_ENTRIES;
+		info->n_entries = XEHP_NUM_MOCS_ENTRIES;
 		info->unused_entries_index = 3;
 		break;
 	case XE_DG1:
-- 
2.43.0

