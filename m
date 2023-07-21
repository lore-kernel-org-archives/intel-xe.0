Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4A2EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 14:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588C110E692;
	Fri, 21 Jul 2023 14:08:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A201410E68F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689948479; x=1721484479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I81plITn7Lg34In4qzRIDwDUmAtMBOENWCaWrf5QP+A=;
 b=YsbVi858wY5Ax0hm/lTlF7a6mil+PlPxCVUDn1PJDCeOYwR//ux8sLpt
 z1ht2S53e/Di+BioHLwnkSsGIqZB9ShidjaD5Q/FY3iBgGgeJG/QqTwFa
 5jFLd4A6gEZSVZMFW2V0TVqMvCa9SZW1TL4h9OuRY0bIvCYeEu2sPiz+U
 Af0OKrAizBFVF5bfUm4/IMdk8D7JWeadvyPEnJdy4BURpO4B4myrIT7NN
 pwZxhwr07cSFEfEPLuYh7JNowYkQmeLAGVDwyGURmejxct0iIqKvnlNR8
 3+yU4khQiTll1HZAVb3fr7j8l5z6Nwme5QYydg5omYA2oLFLyNndT2ODJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="365923983"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365923983"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="702061090"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="702061090"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:07:57 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 16:07:44 +0200
Message-Id: <20230721140745.16187-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Set AE PTE bit if enabled on smem
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
Cc: joonas.lahtinen@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Set AE PTE bit on smem if the platform is supported and
enabled device scoped atomics on system memory by a
user with madvise ioctl.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 457f1363ec67..d43c91cf4776 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -774,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
+		if (tile_to_xe(tile)->info.platform != XE_PVC &&
+		    (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))
+			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+
 		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
 			xe_walk.cache = XE_CACHE_WT;
 		else
-- 
2.39.0

