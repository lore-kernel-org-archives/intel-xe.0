Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F22CCF9F7
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 01:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE4510E562;
	Wed,  6 Sep 2023 01:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957310E31B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693963251; x=1725499251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uW+LYpUfiI7hJqQz7ajfh6HYcNNf+YxcVJEPUtCr1qY=;
 b=UqdsBn79+aBRtsUhflnt44eeActZ8y1hMkr2rybhIz6ZcTYuiocIG6tH
 lbf6WAhgFbAzXAYcGgXCu5F8uzzeEEEtrPcy4IH0wvUbLE5tZfw8nNGRb
 QT1xJzY2rBSNLcpuJaZQtAoB6mCMIu9HyCESONbWVj0ZemfktxnGTrxAP
 gF9b8w2d1hckicH7at9Kka+VPklW9XYaGb5opTrbEsJJbXMGbf5kxcXhk
 mANO15D4Ng0+FV6vqKuK7/5Uv4E3knyDwndf6FQusDNs/uRDqKdpmsjLH
 DvT2S/PcCzFAFhSdlLmXj78Lx7BvVN9+8MQCNo41PvTikdL1Od89BuT9+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380747240"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="380747240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915072568"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915072568"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:20:52 -0700
Message-Id: <20230906012053.1733755-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906012053.1733755-1-lucas.demarchi@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe: Add dbg messages for LRC WAs
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Just like the GT and engine workarounds, add debug message with the
final value being written to the register for easy debugging.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3d6a7c11bac1..9e226b8a005a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -133,10 +133,14 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		++count;
 
 	if (count) {
+		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
+
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
 		xa_for_each(&sr->xa, reg, entry) {
 			bb->cs[bb->len++] = reg;
 			bb->cs[bb->len++] = entry->set_bits;
+			xe_gt_dbg(gt, "REG[0x%lx] = 0x%08x", reg,
+				  entry->set_bits);
 		}
 	}
 
-- 
2.40.1

