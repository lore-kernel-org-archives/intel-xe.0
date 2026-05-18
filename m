Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A53CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115610E8C8;
	Mon, 18 May 2026 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCdiTfwq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5527F10E7EF
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132361; x=1810668361;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MmwY+oFc6n6nLXUFNCHbEgcjEY++wurC7lgufOEAMOk=;
 b=eCdiTfwqpJgZdt9pZ61T1tbaxdgimDA4OZ+FhhWoa+BETrBPTL880CsA
 mGxAAjzBay3vAWegtWVa6kl7McguqiC6j8vlcXtdvPQ270+qAQE1Iayui
 fJ9S298yu2k4v1Xu9AGl8AqQuMV+dhZAOC9qRp/0D7aISiUhqYZZk4sqq
 /IdaxTI9bqrUT9izA0Muf2N1m7xMIH7WnkDSdJeWQomKjpJxY6dStWvjq
 EkWgT9/PAC0P+xq4foumVuIm9S7UG8MsAbJg6M6VsaV26rIsxbYE2JPU6
 W4MRb7kV1xOy2r/EaUySl4QSxzwsq8JFiw6eUvbl+6cfev37Q5eYVVB65 Q==;
X-CSE-ConnectionGUID: W7XdvdPzTNC/I6VJf18X9A==
X-CSE-MsgGUID: lF3HvdanT1SsJTrjEA0kAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304792"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:01 -0700
X-CSE-ConnectionGUID: iFhIU9riQeW0pzXN3lhqsQ==
X-CSE-MsgGUID: 5IeljpQYRyyxLe2WUp9Z6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276029"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/xe/memirq: Reduce buffer size
Date: Mon, 18 May 2026 21:25:43 +0200
Message-ID: <20260518192547.600-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
v2: s/max_hwe_instance/hwe_max_count (Ilia)
---
 drivers/gpu/drm/xe/xe_memirq.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 285fffea62d8..92f1c1150d83 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -172,18 +172,35 @@ static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 	return xe_device_has_msix(memirq_to_xe(memirq));
 }
 
+static unsigned int hwe_max_count(struct xe_tile *tile)
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
 
+	num_pages = hw_reports_to_instance_zero(memirq) ? hwe_max_count(tile) : 1;
+	bo_size = num_pages * SZ_4K;
+
 	bo = xe_managed_bo_create_pin_map(xe, tile, bo_size,
 					  XE_BO_FLAG_SYSTEM |
 					  XE_BO_FLAG_GGTT |
-- 
2.47.1

