Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C38C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 09:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895388FBD;
	Thu, 13 Jun 2024 09:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3Rf3qb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9310E0B4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 09:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718272315; x=1749808315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDbGargBN0BnWhTg6cugUeMhDFLn72NKdMIxaVKDWuY=;
 b=N3Rf3qb6bkj2z9IX1n8D5Z2PJfQKgEWKBb5RitnHnYNgaYJZkaDkdRF3
 8fJzQ31lxgP9kCidhad4maPzsnCD2yF6RO2NI9mxIzcOySpJyySqPip42
 foTU2ewQZVsO1SIdk+5u2s7T0CwKgDeOtyq3u3kAQVQ2ch8NzJ7bSxWwl
 K1COey/JRW4ZyDY+w8JXiFqMsJ+oTOPc7kEi3+uSOlSCOqrb5hcQ5+kI5
 dJol0BWbZMlygRPR4jf9lR4BroW+81IhZ/oh8SKSQm0/PO1QgSu5VpGny
 zreLZ9rAEcXxFKCdZKEWBDcMkROQSiP9J7f/kBacKDAOmEEa0NN8E55NY Q==;
X-CSE-ConnectionGUID: xy02FOXwTqSFB/AwGw5KPQ==
X-CSE-MsgGUID: Le/rSsIcRS2QA2FGDSp4uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14804658"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14804658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:51:55 -0700
X-CSE-ConnectionGUID: LZXqac78ThSeE/xUO5PiBQ==
X-CSE-MsgGUID: Tn934ww5R8epktCE3tS6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40205826"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:51:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 umesh.nerlige.ramappa@intel.com, krishnaiah.bommu@intel.com
Subject: [PATCH v9 1/2] drm/xe: Get GT clock to nanosecs
Date: Thu, 13 Jun 2024 15:34:10 +0530
Message-Id: <20240613100411.1579218-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240613100411.1579218-1-riana.tauro@intel.com>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
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
v5: add doc

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 86c2d62b4bdc..17bd8851ef3c 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -99,3 +99,16 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
 {
 	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
 }
+
+/**
+ * xe_gt_clock_cycles_to_ns - Convert sampled GT clock ticks to nsec
+ *
+ * @gt: GT instance
+ * @count: count of GT clock ticks
+ *
+ * Returns: time in nsec
+ */
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
+{
+	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 3adeb7baaca4..2bbef839f19f 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -12,5 +12,5 @@ struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
 u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
-
+u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count);
 #endif
-- 
2.40.0

