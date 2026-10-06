Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F723CA5FFC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 12:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552A10E3A4;
	Tue,  6 Oct 2026 12:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8mCltxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB1B10E39C
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791290498; x=1822826498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9/nNagRCM/g7L6Ul8jBEitwUY1TKjhB2Gf5jmcZZGI=;
 b=d8mCltxkBVNqUNWb7ypYAdE00Cpi3EKQP1teoorFPmqZrkeJYzIvZk3s
 dIv80u7+Wv1KknhukJPwQMRqSN6Fmz0shmEP9Ldp91wLYY+9azIzbvHsE
 K/2dDb7qNS5a50m6UqaJegV9mAKieCNsh/CVm9ee4+wvVrphN2I3NpjTX
 OmOQIC4mBjkFRCHTsRMSjsTBqdqouwjqd20d/rw0kR5k23On/CwmuBXFP
 KNpB84JkJsU8ayxkBWHNuzq8GSyGt0U1q73h2S4H9r6zNBr0RrQ6XSbXI
 bm5cBjAq8g84YFXm1O554vIXR1PDHglWYVrgrJlDz+WkZy2N1yRfZ50HR Q==;
X-CSE-ConnectionGUID: g7PhB946QxKOOPGMUIUtWg==
X-CSE-MsgGUID: SbzTdyy8TXyE8RgKnUXHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113764994"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="113764994"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:37 -0700
X-CSE-ConnectionGUID: i9VhorSeT4+8PzFLviZcpQ==
X-CSE-MsgGUID: 1sbutWdmS1+mvkvVThF1EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276670004"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:36 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 1/4] drm/xe: Clean up kernel-doc typos in VRAM manager
Date: Tue,  6 Oct 2026 18:11:27 +0530
Message-ID: <20261006124125.1560295-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
References: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
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

Fix grammatical errors and misspelled hardware probing
definitions within the TTM VRAM manager structures.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 6 +++---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9a514d983e90..4c5837cdb996 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -886,11 +886,11 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
 }
 
 /**
- * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
+ * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flagged
  * @xe: pointer to parent device
  * @addr: physical faulty address
  *
- * Handle the physcial faulty address error on specific tile.
+ * Handle the physical faulty address error on specific tile.
  *
  * Returns 0 for success, negative error code otherwise as follow:
  * * %-EIO - critical BO or address outside any VRAM region; next action is reset.
@@ -953,7 +953,7 @@ EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
  * debugfs interface for testing page offlining.
  *
  * Note: Executing this test will permanently retire the allocated
- * memory tracking pages. The driver must be rebinded (unbind and bind)
+ * memory tracking pages. The driver must be rebound (unbind and bind)
  * post-test execution to reclaim the reserved space, as these pages
  * cannot be freed or reclaimed dynamically while the current instance
  * remains active.
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index efcf3e1d4e80..95a427e3b0a7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -27,7 +27,7 @@ struct xe_ttm_vram_mgr {
 	struct list_head queued_pages;
 	/** @n_queued_pages: Number of queued pages */
 	u16 n_queued_pages;
-	/** @visible_size: Proped size of the CPU visible portion */
+	/** @visible_size: Probed size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
 	u64 visible_avail;
-- 
2.52.0

