Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82527C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484D10FF22;
	Fri, 19 Apr 2024 14:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcLQHhVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028910FF22
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713535812; x=1745071812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k5BxFKVRqHBto89WCeDlB4P9LT1p9Y970gHWCUI4cfo=;
 b=kcLQHhVf8RxqjTu2tH5pZT9zi4doNUc9Uy5x8jKlgcs7itHZ+PmBw02x
 7A7t+EzOHYqgrUH+BjM88/on7p3AuSZ/FLRndABJGVf0ko4YwYQtfl3n0
 f86e8KCOBTF+3DmCx+FFEPOUWQguXDIsfxhLxUG+zeHU+WlXuMv3tOMxq
 es2XwF59gGHQhDawt/fvnxXbwbpfI4GAJoOHI9mPuGtl8iJhkAa2I1EUI
 xxkcjrUPv83mu1YHo/ZHFuhHnRkQXz6zPi3wL43bn/w1bJ22RmegILQUG
 s2Co3ifFicJTqs3qLDdMlpiJvPJ3kvVTyp9m3HivaOaZXntlCV8AM/T/k g==;
X-CSE-ConnectionGUID: 2Hw4ND6ZR0qA+b2myvDG1A==
X-CSE-MsgGUID: FSAN8inpRHeGq2tX1OJTgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="8998238"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8998238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:10:11 -0700
X-CSE-ConnectionGUID: DXugbJqyTM+8/tEQ+EGUaA==
X-CSE-MsgGUID: wxS4htYCQSKdiTVcG8gOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23845136"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:10:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
Date: Fri, 19 Apr 2024 16:10:00 +0200
Message-Id: <20240419141000.314-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This function is using internal helper pf_get_spare_ggtt() that
expects PF's master mutex to be locked. Fix that.

Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0f5614877770..79116ad58620 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1932,14 +1932,17 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 spare = pf_get_spare_ggtt(gt);
 	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
 	u64 hole_start, hole_end, hole_size;
-	u64 avail, total = 0;
+	u64 spare, avail, total = 0;
 	char buf[10];
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+
+	spare = pf_get_spare_ggtt(gt);
+
 	mutex_lock(&ggtt->lock);
 
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
@@ -1957,6 +1960,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	}
 
 	mutex_unlock(&ggtt->lock);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
 	drm_printf(p, "total:\t%llu\t(%s)\n", total, buf);
-- 
2.43.0

