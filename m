Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E0FCA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 09:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93F10E36E;
	Thu,  1 Oct 2026 09:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsyD/urk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3681110E057
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 09:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790847942; x=1822383942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HVpGrLm1ZoaZZMu/fdoy1E+quOVNKq4lgba5kSPHGX8=;
 b=BsyD/urkjQd8SbPgu3rwrIlDRXFlZOamW9n+D1L2/ayT2wQuTztPbfcj
 5TkSJxuoRrix5z/s2OeZV64rrJhjRERWjkwAucwLTWW8eHRqgfNaQXhH0
 VaDz8w6XipWRg1LSYuSbtVTndy3TFRdvXHYXhCx2RJ9cUbVGZqN4w7DQO
 CWbXsfIbsMv+ritAltaVKuitIaXSWaGbRNCDddelmh3UljCsn1/XFKDFx
 7nrQBJpbmDW2+0OMbe8/SDMJBdcvRuXhro1amQctRJrK1foF1hE4lHuvS
 Z6EtLMBYxo7MXK/bDZZ1j42tLiXbCHGHJzJNY0BZfiHVK2fNy/FvuwA2l Q==;
X-CSE-ConnectionGUID: cOAH/AQ2TZOC5QSRPkTLEg==
X-CSE-MsgGUID: 2zxROfnwTcyAAUKznKF/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102124026"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102124026"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:42 -0700
X-CSE-ConnectionGUID: Z5qKf//kSKiSEwIvCjVYHw==
X-CSE-MsgGUID: PPALFirtQ66k33z1xstHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="3777"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:41 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/4] drm/xe: Clean up kernel-doc typos in VRAM manager
Date: Thu,  1 Oct 2026 15:15:20 +0530
Message-ID: <20261001094518.1493651-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
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

