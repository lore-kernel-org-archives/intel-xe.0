Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E19C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179FB10E41C;
	Mon, 10 Mar 2025 12:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHA0fxBp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9A610E41C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609182; x=1773145182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dB/EUhi4VMhl29OyqXYzNFgP+AoekcD63ouYVMvJ3c=;
 b=dHA0fxBpZIT//FAX3QQFcIV1aAfe2QLJEzsVcb9ew3IJVbuKIm18bQo6
 zZaB3SNp3u3ooqVE9n7rhuoT9EhzOZ3aM18QhzhRRjBhMXQfXFWvCFsQi
 ZYaVZgGxs/9zvTLJ+hop+BSrsegwYUnyTRK/VU7jn7eJZQ27vJuTNGym7
 gDbTqByT5wuBEdDQ6yV5cIrN106unmNeLc9+IEpqHXv9cT+EgDKtcXJWt
 QHr54ixfP7+an9JMWB4bSDBDJJ8HHwcUScN+SjiluO0dBFLBi54/6ghFu
 l119POkdq5p4Ed6ZleEA8ueuEo5t1zcJjvd+0WcFIUnq8aGlUeYg+EPAB g==;
X-CSE-ConnectionGUID: UfzX1WhkTTuV5fTytbBaEw==
X-CSE-MsgGUID: KZ8patXZTNej/5Yeoi3xXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056415"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:42 -0700
X-CSE-ConnectionGUID: QYM91XXmQ0SdQRXuSbpqjQ==
X-CSE-MsgGUID: Hb8vHdASRzO8FhPTdE5Uuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179069"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:41 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 04/12] drm/xe/svm: Make to_xe_range a public function
Date: Mon, 10 Mar 2025 18:13:33 +0530
Message-Id: <20250310124341.1819568-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

The to_xe_range function will be used in other files. Therefore, make it
public and add kernel-doc documentation

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  5 -----
 drivers/gpu/drm/xe/xe_svm.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 2d2b385b691e..2b041f44730b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -93,11 +93,6 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 	kfree(range);
 }
 
-static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
-{
-	return container_of(r, struct xe_svm_range, base);
-}
-
 static void
 xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 				   const struct mmu_notifier_range *mmu_range)
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 976059545173..1af245400799 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -139,6 +139,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
 #endif
 
+/**
+ * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
+ * @r: Pointer to the drm_gpusvm_range structure
+ *
+ * This function takes a pointer to a drm_gpusvm_range structure and
+ * converts it to a pointer to the containing xe_svm_range structure.
+ *
+ * Return: Pointer to the xe_svm_range structure
+ */
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
-- 
2.34.1

