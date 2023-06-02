Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140CBC7EE23
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 03:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004810E60C;
	Fri,  2 Jun 2023 03:12:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66210E60C
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 03:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685675567; x=1717211567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ML4UrFIvQwt1JC0SkD35YCA2foPPeAHqi7mx3eVwN0s=;
 b=WWnqO5868q9AlKd78ez6ugtVskgmqETG6q8S7/Y6jP6+d2z28/SaHAQS
 EsQXTznek+0gl7p/zDJoyOWEescEQrdUgd5pmYl1KAAlgAwSfCqnWAhz5
 jyP0M8xxNF/NpHR6nC3i+MiDRtI+PFfQEzfP+pAYHJCPV0sVID2tCE0ME
 zjYukYrOKZAI4ti2t2Gh7c6aTpreOytsJXigDUZzr73PEtCEyU5hMCm1m
 J/WrYggo0h4SZkGUYPT2AbFMfV7Dk2SD3WvagZittIf1o2qK4P8BGph1l
 QObOtzPijWKV2EnCT3MZyAFK56/cPJV+9Szv90nKJuRF0NEo2F5sSxM5P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="359051711"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="359051711"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 20:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777473802"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="777473802"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 20:12:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 20:12:41 -0700
Message-Id: <20230602031241.9160-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Apply upper limit to sg element
 size
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace UINT_MAX with maximum value supported by sg->length.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d945675a259f..e6d08fa9c992 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -306,7 +306,10 @@ struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
  */
 static inline unsigned int xe_sg_segment_size(struct device *dev)
 {
-	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
+	struct scatterlist __maybe_unused sg;
+	size_t max = BIT_ULL(sizeof(sg.length) * 8) - 1;
+
+	max = min_t(size_t, max, dma_max_mapping_size(dev));
 
 	/*
 	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
-- 
2.21.0.rc0.32.g243a4c7e27

