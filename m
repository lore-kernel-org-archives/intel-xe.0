Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEDCE6BF3B
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3810810E37B;
	Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhQ0parr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313D910E376;
 Fri, 30 Jan 2026 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769802574; x=1801338574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuLXmLDkFghiiihjuxLqaE3txVaJxrJ+NhXu0jJjTI8=;
 b=AhQ0parrTRQchxrbs4YGRhkK76WBZpsOgwrNDFDiDjIlFygVuZP2swqS
 Raz3i5WazLtS5BY8z+PQNi6532PPJoHA4z1aLO8EVBrzfB7FrKDfCwzIQ
 Ly2rGapBV7MXYgFHPIpRiGN0y5NarUfUTsX+myIBsh5qf+g2ZHrkS12Ci
 ggw4KjdoI6d0/XMHACSZMGDq/zry5Y/eB/qn4qd9HTscg0vWysF5N88MR
 soZmgNk0+ClyvNXqCD3S5weshoNRQZ+CdTmFs8dZe35niUK0dKzMpGOxQ
 yzMNDFxZ4xPCRO7vasYCkwl4vn0HE9LUKTw1TVOb2/HZl8x7d2a9LUMjb A==;
X-CSE-ConnectionGUID: 8KJLtO8mRvCB1UYO1+5tsA==
X-CSE-MsgGUID: Yo3j2+vHTcCNMJ83knmAQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70260319"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70260319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:34 -0800
X-CSE-ConnectionGUID: x2bZuCcjRceSvcduboIYSQ==
X-CSE-MsgGUID: 5cugSQSoTZOYbH3WWkx1GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="240202398"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/2] drm/gpusvm: Force unmapping on error in
 drm_gpusvm_get_pages
Date: Fri, 30 Jan 2026 11:49:27 -0800
Message-Id: <20260130194928.3255613-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130194928.3255613-1-matthew.brost@intel.com>
References: <20260130194928.3255613-1-matthew.brost@intel.com>
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

drm_gpusvm_get_pages() only sets the local flags prior to committing the
pages. If an error occurs mid-mapping, has_dma_mapping will be clear,
causing the unmap function to skip unmapping pages that were
successfully mapped before the error. Fix this by forcibly setting
has_dma_mapping in the error path to ensure all previously mapped pages
are properly unmapped.

Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index aa9a0b60e727..d733599ceb9a 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1572,6 +1572,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	return 0;
 
 err_unmap:
+	svm_pages->flags.has_dma_mapping = true;
 	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
 	drm_gpusvm_notifier_unlock(gpusvm);
 err_free:
-- 
2.34.1

