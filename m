Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B6C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006DA10EF8F;
	Mon, 22 Jan 2024 21:17:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BAE10EF8A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958247; x=1737494247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rZJid86VU63omfDKiUbr8xNB8VtBpOKA9ZUS77QUS3A=;
 b=YATxaO7j9E0RwTwvrO7sYgRIboztr//t6Y/olujv/qTqzFqbLyWVPPW4
 FJo3LPt744+/F3DXaUSX84TF3zR4taQhK340E7V66SQ4JVx8AbAUhp/6g
 y2BkJRBuxcQkRZntkNrIc5TSqala6U3edzCTuZvLg83NVuO1fV1vQnO0q
 RkpmOsHVu12Fzyo6rMksG1hRuaarUiJRmiUF4FBUvukNurvIim9lZLnx9
 1GhhA4y2urnc1jfmCesgwtO7HW8TtIjHeAYa8H4Kcr73+Mz1+4rIQ80U6
 iuy7RDz+GeKQPbZBIb7B5IkveOyuZCB3g1nNlTKYFba1c5p01vb+qv/bz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432486563"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432486563"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27495069"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:17:25 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/xe: Stash GMD_ID value in xe_gt
Date: Mon, 22 Jan 2024 13:17:06 -0800
Message-ID: <20240122211709.224419-6-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122211709.224419-1-jose.souza@intel.com>
References: <20240122211709.224419-1-jose.souza@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Although we've stored the major and minor versions for graphics/media in
xe_device, it will be simpler to implement the uapi version query if we
also stash the raw register value in the GT itself.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1fe4d54409d34..47cb87f599e46 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -399,6 +399,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	xe_gt_ccs_mode_sysfs_init(gt);
 
+	/*
+	 * Stash hardware-reported version.  Since this register does not exist
+	 * on pre-MTL platforms, reading it there will (correctly) return 0.
+	 */
+	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 047cde6cda107..177b93a96929e 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -117,6 +117,8 @@ struct xe_gt {
 		 * hwconfig blob.
 		 */
 		u64 __engine_mask;
+		/** @gmdid: raw GMD_ID value from hardware */
+		u32 gmdid;
 	} info;
 
 	/**
-- 
2.43.0

