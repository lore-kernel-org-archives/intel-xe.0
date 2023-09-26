Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664EDE7F146
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C37A10E45E;
	Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8E10E468
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767785; x=1727303785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e36E70gbxbv6C9zl5j9pI4I/02CXL+0ZinE9D83qmFI=;
 b=EwBJZU2pvKdIL9+pdrTl7+Dfu5fPv9IMFacH5vJFNYXQKyT5zyKS7y3H
 7GQ7KuRMue3No3YpqAB98FxDhBiKWfIe/Lalad0lYEee+XmV+dUD5+s5W
 uGD3IpazSLbhsu4O4Pq+U1SISo05RvGAO7zYBsA5f5k3eqqTkJEnaeR84
 5q54Nx/zFNCNRZ23SDE+gt2wCgeLPn7klZ1ajqsB/u+mmfbnOudG8u1up
 nl3Quxh4lOby4EIfEPdUGfgyAFV26X29c54nrzIlxnCb9+fCQ4/9HDAD7
 rd2OlhNR85Cd3JXlkkUlKp8DS67Hj/CtGigSaJiwGJ6A+Oto6jrklHQ4Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597211"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343378"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343378"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:26 -0700
Message-Id: <20230926223631.2807873-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/11] drm/xe/dg2: Fix using wrong PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DG2 should use the MCR variant to program the PAT registers, like PVC,
but shouldn't use the same table as PVC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 86386633e206..8418de44c646 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -108,10 +108,17 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.ops = &mtl_pat_ops;
 		xe->pat.table = mtl_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
-	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
+	} else if (xe->info.platform == XE_PVC) {
 		xe->pat.ops = &pvc_pat_ops;
 		xe->pat.table = pvc_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
+	} else if (xe->info.platform == XE_DG2) {
+		/*
+		 * Programming is like PVC, but same table as previous platforms
+		 */
+		xe->pat.ops = &pvc_pat_ops;
+		xe->pat.table = tgl_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
 		xe->pat.ops = &tgl_pat_ops;
 		xe->pat.table = tgl_pat_table;
-- 
2.40.1

