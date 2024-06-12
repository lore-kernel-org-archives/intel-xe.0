Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBE2C27C75
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 05:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463010E784;
	Wed, 12 Jun 2024 05:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSkAZHFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A8A10E784
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 05:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718170109; x=1749706109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eiNJoQdZi7w87BYPmt4n1GCUqmR/dO3hIk4tveJr2N0=;
 b=kSkAZHFG5vreaUxYQ7pFecnCCUlXFslNc0hM/iFqkUQuRDYIjOpNxmkK
 r4gPMZk1tnMG/Row9LdNfCs4hFedaJHG9I1SzSPnJTkXyGEvaot9IsY73
 5KvTIts6cVZoxi5Z02nCUgdDUOaX19Xn1BvMgOyIlfnWJz3aRsea/kMpi
 k8kvevja/NoZVAf8ysHtUH3acUhvSpzT/IzNHqkR71jeiS8PN2MikJBf5
 ERXKJ1vRX2fvAIitR4enuGFUkVTGGoXHWhIL6WWmQ+KLLP6mGT/84t7W6
 qOCxebFAucGJP2/YMNubab+tIAoYDrSVIqdffJlZIv3eBE9j+FOR1/lDO g==;
X-CSE-ConnectionGUID: CaL76uhNStmSAZxB3ELFGg==
X-CSE-MsgGUID: ty/RkZJ6T5uwqRPbwTZ69g==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14711673"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14711673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 22:28:29 -0700
X-CSE-ConnectionGUID: KDlvi5/wS8K71yJEhh9h+g==
X-CSE-MsgGUID: +qGs5oabSGWhm3/ESH+/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="40141096"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 22:28:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, tvrtko.ursulin@intel.com,
 rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 krishnaiah.bommu@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v8 1/2] drm/xe: Get GT clock to nanosecs
Date: Wed, 12 Jun 2024 11:10:32 +0530
Message-Id: <20240612054033.1384369-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240612054033.1384369-1-riana.tauro@intel.com>
References: <20240612054033.1384369-1-riana.tauro@intel.com>
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

From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Helper to convert GT clock cycles to nanoseconds.

v2: Use DIV_ROUND_CLOSEST_ULL helper(Ashutosh)
v3: rename xe_gt_clock_interval_to_ns to xe_gt_clock_cycles_to_ns
v4: rebase

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 5 +++++
 drivers/gpu/drm/xe/xe_gt_clock.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 9ff2061133df..ba35bbc89114 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -79,3 +79,8 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.reference_clock = freq;
 	return 0;
 }
+
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
+{
+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 44fa0371b973..aa162722f859 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -11,5 +11,5 @@
 struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
-
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count);
 #endif
-- 
2.40.0

