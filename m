Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855E4E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465AF10E2AC;
	Wed, 18 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S//1iBbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F38C10E620
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448181; x=1802984181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GYvK4vtTYORhBNtNXenR+uA/1wSZJ2vOHN+y60oi2GE=;
 b=S//1iBbRMCT8yRRTRlU1KeO5ikG7wHEs+b6BEDHQh+GhO5J/sb+DFZ8u
 iPvtiaaPNRYOmVZPJaQXe+ua5BIaTtogjl9ycCs02XGbAloXksuVl+Wc3
 NuTAxq73xfyWM5gjeJ95lZ/Gz5rGOXkqDdymSEh1hzus5FLCbdxUiwcCs
 oU96EGvbR+UuL7nqJnhmfXB+aW9DYR3VX+LvyjeixLmsb7QUzEzWcy4lZ
 C307s+iqwf6QhAzS3VEMiUW7TBPtdhdlvnJhhaYP7jRL3wUQrBcGxLRR9
 TtE00QldJHlDa6EiEkUxH3q3H15fIyOnwmR2lfDoYbsfcC+l7z+F2/l0f Q==;
X-CSE-ConnectionGUID: JmfJ8prdRviVpVyBjsIE/g==
X-CSE-MsgGUID: qUeWu9GKS9qHYeFjeTZK5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710583"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:21 -0800
X-CSE-ConnectionGUID: SdfWmqAGSummJHbW7aqNng==
X-CSE-MsgGUID: cLw2z/ChQBKA8l13lCLmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548230"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 01/10] drm/xe/pf: Expose LMTT page size
Date: Wed, 18 Feb 2026 21:55:43 +0100
Message-ID: <20260218205553.3561-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The underlying LMTT implementation already provides the info about
the page size it is using.  There is no need to have a separate
helper function that is making assumption about the required size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +--
 drivers/gpu/drm/xe/xe_lmtt.c               | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h               |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 888193e1d2c5..e06baf12e108 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1451,8 +1451,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
 {
-	/* this might be platform dependent */
-	return SZ_2M;
+	return xe_lmtt_page_size(&gt->tile->sriov.pf.lmtt);
 }
 
 static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 2077e1ef8b43..b583e0f20183 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -57,6 +57,23 @@ static u64 lmtt_page_size(struct xe_lmtt *lmtt)
 	return BIT_ULL(lmtt->ops->lmtt_pte_shift(0));
 }
 
+/**
+ * xe_lmtt_page_size() - Get LMTT page size.
+ * @lmtt: the &xe_lmtt
+ *
+ * This function shall be called only by PF.
+ *
+ * Return: LMTT page size.
+ */
+u64 xe_lmtt_page_size(struct xe_lmtt *lmtt)
+{
+	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, lmtt->ops);
+
+	return lmtt_page_size(lmtt);
+}
+
 static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level)
 {
 	unsigned int num_entries = level ? lmtt->ops->lmtt_pte_num(level) : 0;
diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
index 75a234fbf367..8fa387b38c52 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.h
+++ b/drivers/gpu/drm/xe/xe_lmtt.h
@@ -20,6 +20,7 @@ int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
 int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
 void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
 u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size);
+u64 xe_lmtt_page_size(struct xe_lmtt *lmtt);
 #else
 static inline int xe_lmtt_init(struct xe_lmtt *lmtt) { return 0; }
 static inline void xe_lmtt_init_hw(struct xe_lmtt *lmtt) { }
-- 
2.47.1

