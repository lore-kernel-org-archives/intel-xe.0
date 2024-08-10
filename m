Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11931C3DA7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 19:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4610E167;
	Sat, 10 Aug 2024 19:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ba8o0+Pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BEF10E167
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723318278; x=1754854278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PIgeNS28FK5akl7aDVxM3t3al07VMjKAzjGzxMpNwCU=;
 b=ba8o0+PrRJf1bcpdVvsu2HoyazStfseVVK9M648sMMcF8cIwJR3v6wRL
 zIhhtv7Z7+FDygE5/d9367W30QlfqAUTjVcKqXIm0RErPFHXX0YRgjmFQ
 D9O9PxxHIbLPy7hResrFlXLf52eMOx2mfh4hGIsgMggzdaQRtl6XrRb/N
 9hlzKl4p7XzRQu9sGiMRICn6pNvW8pFD4niQvjW6/aitfKEMcvMOly6Z+
 WffTzm1pVAbk3tBIkkW17tV5fXp+roUBJoYJ2EdCFDo9oSizpQu7N042E
 SeTDuzGkfMbnJAfSI3+AVlRyL7y0w7tbU/wgTdSET+BzxT2HxDArhIU++ g==;
X-CSE-ConnectionGUID: l5D/Ul5VT5CeqQ3n86enhA==
X-CSE-MsgGUID: UA3ZlDNZS0GhzFJZK4i8Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38980155"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="38980155"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 12:31:18 -0700
X-CSE-ConnectionGUID: SUlvWzvBQ6GR6PpBWTsJ2w==
X-CSE-MsgGUID: E4r4MmUuQQKR0TX2+L+Aeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="62707944"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 12:31:17 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Add stats for tlb invalidation count
Date: Sat, 10 Aug 2024 21:15:19 +0200
Message-ID: <20240810191522.18616-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240810191522.18616-1-nirmoy.das@intel.com>
References: <20240810191522.18616-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add stats for tlb invalidation count which can be viewed with per GT
stat debugfs file.

Example output:
cat /sys/kernel/debug/dri/0/gt0/stats
tlb_inval_count: 22

v2: fix #include order(Tejas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c            | 1 +
 drivers/gpu/drm/xe/xe_gt_stats.h            | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index a054cd52329c..c7364a5aef8f 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -27,6 +27,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 }
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	"tlb_inval_count",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index 1be71ce533db..91d944f6c4e4 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -10,6 +10,7 @@ struct xe_gt;
 struct drm_printer;
 
 enum xe_gt_stats_id {
+	XE_GT_STATS_ID_TLB_INVAL,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 87cb76a8718c..cca9cf536f76 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -12,6 +12,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_gt_stats.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -213,6 +214,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			gt->tlb_invalidation.seqno = 1;
 	}
 	mutex_unlock(&guc->ct.lock);
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
 }
-- 
2.42.0

