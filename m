Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746CCCF9E2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334410E815;
	Wed, 22 Oct 2025 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLl1ke7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772E10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151193; x=1792687193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVZjQkOjXaXDvO2pks6a9VaLGy0MZ74jMTU6+tETg5k=;
 b=JLl1ke7aVgXgWKfz65YycTvf6PO9O29Ro21mtyrJQ90pFVspr5N/bbKH
 vORTbSjMrOPgHTCDmcXSfrkKuZLzz9bDt6sryCnVN2ZzbKol01NHV4THB
 rB4ahCxwNIWZ6U6kbSbf1WGsPnjZoCIyXoRrctuH2iKeV+Hw8Nfblw13l
 rRTUjJXziQzwbRHm5fJRscjGa1DMucQonzSNSP0qBqiCGDL4cksnbx/B/
 3zqQShlmuaWor4koHLE9LVh3NsGnUuRR/80yqG/vI8XIV5YKYn6FatNI9
 OIbA74DwtvVmg6XEN+hT5gOeu51RNCP9JEtHA4Z8IjVaoBqIQTNKwvcF8 A==;
X-CSE-ConnectionGUID: 8Q9KpwupQDClSGwkbhLPZA==
X-CSE-MsgGUID: +k8FCUHDQ5CbKtFZc/L5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911742"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:53 -0700
X-CSE-ConnectionGUID: w41Yl9Z7Tr6KeRqJcWiUVQ==
X-CSE-MsgGUID: Zbiuksb9QeSBcN6Y0OaStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043691"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 3/7] drm/xe/migrate: fix chunk handling for 2M page emit
Date: Wed, 22 Oct 2025 17:38:32 +0100
Message-ID: <20251022163836.191405-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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

On systems with PAGE_SIZE > 4K the chunk will likely be rounded down to
zero, if say we have single 2M page, so one huge pte, since we also try
to align the chunk to PAGE_SIZE / XE_PAGE_SIZE, which will be 16 on 64K
systems. Make the ALIGN_DOWN conditional for 4K PTEs where we can
encounter gpu_page_size < PAGE_SIZE.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 451fae0106e5..ce5543fa7a52 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1804,7 +1804,9 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
-		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+		if (!level)
+			chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
 		bb->cs[bb->len++] = 0;
-- 
2.51.0

