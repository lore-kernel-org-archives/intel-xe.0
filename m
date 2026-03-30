Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3FE1061B15
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 17:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C4010E63D;
	Mon, 30 Mar 2026 17:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6sgxpjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0EB10E63D
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774890575; x=1806426575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKVSzOLf6PkyAOM3YOM7DkAnXa17pAr8rBPXVNM8Vgg=;
 b=b6sgxpjOJfkSwb4nIQc6ewZLByH7qKXV5K86SnNd69PT+5nP6xyYHlvX
 n/ygjKngUyOu8qmmZ5wF0RhdEJOA0gcdq8qyG3r795hsFWW73D7MDnw0V
 64E3Fp7XGnV5d26x2qv/MwPuAWTIB9rb/VW+UodViQ+e032kEoInle480
 aL+QbTfE1mAHSomW078t9TZv3uhRAmvEk823YQhgPpnnn2Y4VootYEoZP
 j3+lGfROshY4VJ2Y1IB+fubRqWVkIXPZN0OyTzCa8xUcpWD3+yYR5B5fh
 Zen3yC14yRwZ4rph4iaX9fzUnJ2ThMeKoVeigmTRXTPuKR1cm1HtxyKXO A==;
X-CSE-ConnectionGUID: BbKn2oxSSkS229oqT45NsA==
X-CSE-MsgGUID: AKKHsbF3SemspFxfN/zdIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87282456"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="87282456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 10:09:34 -0700
X-CSE-ConnectionGUID: gvrZRzBHStGO3hXbqchYog==
X-CSE-MsgGUID: U+pCcUXXSWuKhQ8uChvyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="230582887"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa004.jf.intel.com with ESMTP; 30 Mar 2026 10:09:34 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2] drm/xe: expose multi_lrc_engine_classes in debugfs info
Date: Mon, 30 Mar 2026 10:09:28 -0700
Message-ID: <20260330170928.236221-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324212348.4142888-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
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

Add multi_lrc_engine_classes to the per-device info printed via debugfs
(/sys/kernel/debug/dri/<N>/info). This value indicates which engine
classes support multi-LRC submission and varies across platforms.

Exposing it through debugfs allows userspace tools like IGT to query
the actual kernel configuration rather than hardcoding platform-specific
values in test code. This avoids duplicating KMD logic in IGT and makes
tests automatically adapt to platform differences.

V2:
 - Print human-readable engine class names (e.g. "vcs vecs") instead
of a raw bitmask value.

Cc: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..a410ee971980 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
+#include "xe_hw_engine.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -88,6 +89,16 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
+	drm_printf(&p, "multi_lrc_engine_classes");
+	if (xe->info.multi_lrc_mask) {
+		for (enum xe_engine_class ec = 0; ec < XE_ENGINE_CLASS_MAX; ec++) {
+			if (xe->info.multi_lrc_mask & BIT(ec))
+				drm_printf(&p, " %s", xe_hw_engine_class_to_str(ec));
+		}
+	} else {
+		drm_printf(&p, " none");
+	}
+	drm_printf(&p, "\n");
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-- 
2.43.0

