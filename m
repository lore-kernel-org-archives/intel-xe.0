Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8ECC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8292E10F292;
	Thu, 16 Jul 2026 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QhstJxab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787E510F292
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784198420; x=1815734420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xnqsiabqj+hw/fzH6w4AQ5phU11AIdO1Tz9kD5LmKnc=;
 b=QhstJxab9olLFbGIT1b15ja5Ei33LaYvlyeFnNLXzX8ZGdgA6JTC4j+R
 2rfBuH8TxC652tUbGam3kWv/9SD0rX5z3Dg3KWbCKfTlVwYjmHwVWx61d
 8O6qiJdpVt+s10TYlmSNb9e70Pt9De6aNzT8WP+6XJNwnuACCdNsqVlkH
 aJ0bqDQ869VdzH1SJ7/hGD4GOcdX0MpqZFA8FQZ4EOhQXGz3Dl2IINN1b
 If6IOjf41D+l6Ju3HVj0TMcwAcOALnZhjnb4l8Xs4C7b5NmwpkhLbyXR0
 nQTuLnC+QSM3zBr44KmReMgrVYALmr5GtcHNnNJ0vI40ABMBAGWxlg3Yz w==;
X-CSE-ConnectionGUID: NEiqWfRbQruWl5/54Janvw==
X-CSE-MsgGUID: BznPLS02S86AXtG9ekluuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84813501"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84813501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:19 -0700
X-CSE-ConnectionGUID: NJ/ZtCeESMeWf8XhzbNN4Q==
X-CSE-MsgGUID: RIInLrpaQja9zJ7BQUGNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253053941"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:40:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V13 10/11] drm/xe: Add soft/hard offline mode for VRAM page
 retirement
Date: Thu, 16 Jul 2026 16:09:58 +0530
Message-ID: <20260716103949.1554216-23-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
References: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
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

v2(Sashiko):
- Add soft-to-hard mode promotion for queued_pages

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 12 ++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index dbce00a7c521..0e5dfbf203a3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -587,13 +587,23 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
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
-		if (pos->addr == addr)
+		if (pos->addr == addr) {
+			if (pos->mode == XE_PAGE_OFFLINE_SOFT)
+				pos->mode = XE_PAGE_OFFLINE_HARD;
 			return true;
+		}
 	}
 
 	return false;
@@ -626,6 +636,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = pending;
 		nentry->addr = addr;
+		nentry->mode = XE_PAGE_OFFLINE_SOFT;
 
 		if (block) {
 			struct xe_bo *pbo;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index c06ed244f83a..b93e5dddc475 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -55,6 +55,16 @@ struct xe_ttm_vram_mgr_resource {
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
@@ -73,6 +83,8 @@ struct xe_ttm_vram_offline_resource {
 	unsigned long addr;
 	/** @status: reservation status of resource */
 	bool status;
+	/** @mode: offline mode (soft or hard) */
+	enum xe_page_offline_mode mode;
 };
 
 #endif
-- 
2.52.0

