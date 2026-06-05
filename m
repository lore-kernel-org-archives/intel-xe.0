Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2709FCD6E77
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D5F112AF1;
	Fri,  5 Jun 2026 12:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBVW0N1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964FE112AF8
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780663163; x=1812199163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fu6NazP4sJJWOHRLuBsUz03IP9UIH3BnF/hpBFdWvcY=;
 b=GBVW0N1lSfW1yqaupOIWHzcIdgZhZRKCtInhmStbKCc7hayUlS5nf1u4
 rhKQOytZsOcoNCgBDkL4QOdsAHZxoQjxZcYwW/tnyC+OnwujdJwmK3Jlw
 +YqGus7ZVJgOSWsQCuxLdzR04i+eJpdBYaxEAIfxkia4kJ7E2Lf9WoFaj
 2wi+/1JM77bMXsgZqgDCo2qpeN0CJWRlDHz8RhEexzkhGRPe6ZaQVBy/1
 VuEUsFglo7PON0gu/2VnS3YDI0vcQT90VKW4YT2iBoFVTPRS69khraJCY
 vl3760dqVIT3LF9/rgOTde08LyKpunL9gcePV45liKj3S7/3pUENtwIY/ Q==;
X-CSE-ConnectionGUID: 7PqfuYRwRLGvou2PzmYkLQ==
X-CSE-MsgGUID: /tn3OcgFRFOqBOsZQG5BcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106937365"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106937365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:23 -0700
X-CSE-ConnectionGUID: VWY1PgS+RF24/H0hInDDZw==
X-CSE-MsgGUID: EcfahISISVGcMZl/2SG8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249938973"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V11 12/12] drm/xe: Add soft/hard offline mode for VRAM page
 retirement
Date: Fri,  5 Jun 2026 18:08:50 +0530
Message-ID: <20260605123839.236021-26-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605123839.236021-14-tejas.upadhyay@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
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

Introduce a mode-based approach for VRAM page offlining to distinguish
between soft (temporary) and hard (permanent) page retirement:

- Add enum xe_page_offline_mode with XE_PAGE_OFFLINE_SOFT and
  XE_PAGE_OFFLINE_HARD states.
- Add 'mode' field to struct xe_ttm_vram_offline_resource.

On first fault at an address:
- Reserve the block, add to offlined_pages with mode = SOFT.
- Page stays out of the allocator pool but is not permanently retired.

On second fault at the same address:
- xe_ttm_vram_page_already_processed() finds the entry and promotes
  mode from SOFT to HARD.
- Returns -EEXIST to the caller, which signals FW to permanently
  retire the page.

This avoids unnecessary permanent retirement on transient single-bit
errors while ensuring persistent faults get hard-offlined.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 10 +++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 12 ++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 3765e8fcdcec..71da7ee6ba7e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -577,8 +577,15 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
 	lockdep_assert_held(&mgr->lock);
 
 	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
-		if (pos->addr == addr)
+		if (pos->addr == addr) {
+			/*
+			 * Second fault at same addr: promote soft to hard.
+			 * Caller returns -EEXIST to FW for permanent retirement.
+			 */
+			if (pos->mode == XE_PAGE_OFFLINE_SOFT)
+				pos->mode = XE_PAGE_OFFLINE_HARD;
 			return true;
+		}
 	}
 
 	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
@@ -613,6 +620,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = pending;
 		nentry->addr = addr;
+		nentry->mode = XE_PAGE_OFFLINE_SOFT;
 
 		if (block) {
 			struct xe_bo *pbo;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index b23796066a1a..f73dfd1ad82b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -57,6 +57,16 @@ struct xe_ttm_vram_mgr_resource {
 	unsigned long flags;
 };
 
+/**
+ * enum xe_page_offline_mode - Mode of page offline
+ * @XE_PAGE_OFFLINE_SOFT: Page is soft-offlined (scrubbed, can be restored)
+ * @XE_PAGE_OFFLINE_HARD: Page is hard-offlined (permanently retired)
+ */
+enum xe_page_offline_mode {
+	XE_PAGE_OFFLINE_SOFT = 0,
+	XE_PAGE_OFFLINE_HARD,
+};
+
 /**
  * struct xe_ttm_vram_offline_resource - Xe TTM VRAM offline  resource
  */
@@ -75,6 +85,8 @@ struct xe_ttm_vram_offline_resource {
 	unsigned long addr;
 	/** @status: reservation status of resource */
 	bool status;
+	/** @mode: offline mode (soft or hard) */
+	enum xe_page_offline_mode mode;
 };
 
 #endif
-- 
2.52.0

