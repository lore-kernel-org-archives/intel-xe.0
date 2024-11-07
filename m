Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B464D43360
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 13:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78D210E84C;
	Thu,  7 Nov 2024 13:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWUm+JHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED8E10E84C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730987733; x=1762523733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VSLqNzkm4D9LSMVraULs/C9J9pUzB6/rhWnLPMgjKUs=;
 b=JWUm+JHyLZ4qWO9A4TDlgVmYj5O9tk0snUWR/kuAcKt4dfnKpEP/NnGp
 G+Rv90GVzeZWMaV78ZN7n3/WXxB8HVWRPEiGcXZONnZ/VHRfw0MBzZlKN
 kBHjpcOsrDfl3t6nQ36oiYdU7sCZgXosWchssAB52SHTkmGWhFfxMGuEe
 3CanTrbKjGdni/TSfX354h4CuhsxDcku0pVHqyzIDLzFOVOwZzpTA6FS2
 ZuhZfy6TP8WH8hyMCQMEJiMj3r560laGNNcZgUkZizVVgKoNqSjL9j+vF
 vw2OnIsMw350vUQGDjyl202F0YXx6JNimAo1INpzl9B5MTDCJaRonMuHe g==;
X-CSE-ConnectionGUID: /NFa1QLBSYSPbtvSAYqT/w==
X-CSE-MsgGUID: MiwquQtUS9C6gRQ1eVjtOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48289960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48289960"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:33 -0800
X-CSE-ConnectionGUID: Shm8JXBwTkeYknrdFlGFxQ==
X-CSE-MsgGUID: us3VHOo1TL+mjYp5lDqMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84708079"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:31 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 2/4] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Thu,  7 Nov 2024 14:55:15 +0100
Message-Id: <20241107135517.9516-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241107135517.9516-1-lukasz.laguna@intel.com>
References: <20241107135517.9516-1-lukasz.laguna@intel.com>
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

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 192643d63d22..05b197dc2f21 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1517,6 +1517,28 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+
+	struct xe_bo *lmem_obj;
+
+	xe_gt_assert(gt, vfid);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	lmem_obj = pf_get_vf_config_lmem_obj(gt, vfid);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return lmem_obj;
+
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 0c55aa40a1a7..b4845fb1fcd9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.40.0

