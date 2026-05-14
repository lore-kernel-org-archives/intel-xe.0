Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33725CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78E610F264;
	Thu, 14 May 2026 15:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un5Jpkuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D936C10F25A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770827; x=1810306827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8If/Qvrk+jjgQz12v4m2Ho+MNfAyJ/wDo27IBFZ1rmM=;
 b=Un5JpkukKoiOHj8DdR+HJkCCkU+ip5aq+npyEm8OLFl/p74m0E0DomXf
 mX967MmFUxGqp+iK/7otxveik7XIAdl1jx8Uw0156xkCboSCkixJ8MS0h
 tWByPPVGr9u2hIh0xLsZ9mDY5RKh3KC727MDgq10takS9eqBdEMA1p599
 4f/ZjVsZbUe70oMpR2TY45obX4srssg+N5sBoNTjCls3y6rhZSFQwmsbx
 9+BwpOgajLVwOXlDjiu7ykqm5aZstbBl8cG2RDfIVMngRNo1NtLSeQbfa
 je23gDE+Hflrke9EWn68h0ZFkXfXegKy0QrtY4mXeZjhcCoyqt1GTJ3E2 g==;
X-CSE-ConnectionGUID: xRE2gpeWRcKdZpoJt65ZUQ==
X-CSE-MsgGUID: 7c57E1pcTUGtfHDFQn/psg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178840"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:27 -0700
X-CSE-ConnectionGUID: fOhUOW8iTM6JnJPCYQon5Q==
X-CSE-MsgGUID: GO8M1g09STe0WGyO4UYZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152866"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 5/9] drm/xe/memirq: Reduce buffer size
Date: Thu, 14 May 2026 17:00:06 +0200
Message-ID: <20260514150010.7123-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

When using MSI-X, we don't have to allocate the largest possible
buffer to accommodate all potential engine instances. Loop through
available engines, find highest engine instance and reduce buffer
size to avoid memory waste.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 285fffea62d8..6ffc92f5a0f2 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -172,18 +172,35 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 	return xe_device_has_msix(memirq_to_xe(memirq));
 }
 
+static unsigned int max_hwe_instance(struct xe_tile *tile)
+{
+	unsigned int max_instance = 0;
+	unsigned int gtid, hweid;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+
+	for_each_gt_on_tile(gt, tile, gtid)
+		for_each_hw_engine(hwe, gt, hweid)
+			max_instance = max(max_instance, hwe->instance);
+
+	return max_instance + 1;
+}
+
 static int memirq_alloc_pages(struct xe_memirq *memirq)
 {
 	struct xe_device *xe = memirq_to_xe(memirq);
 	struct xe_tile *tile = memirq_to_tile(memirq);
-	size_t bo_size = hw_reports_to_instance_zero(memirq) ?
-		XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;
+	unsigned int num_pages;
 	struct xe_bo *bo;
+	size_t bo_size;
 	int err;
 
 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
 	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
 
+	num_pages = hw_reports_to_instance_zero(memirq) ? max_hwe_instance(tile) : 1;
+	bo_size = num_pages * SZ_4K;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-- 
2.47.1

