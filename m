Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB8EC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 20:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6112110E7A3;
	Wed,  6 Dec 2023 20:50:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F1710E7A3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895840; x=1733431840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sj0LcyN5vbvVVd6+oIV3MxzlN+ES8XHe3aMTpZPMWYc=;
 b=diL+W/Ves8+jUGev5p/3H0cFbCHjNTCvDXJYyf/bmvLodpafAJqd38iA
 chnIjGmqPDV4e2N9Q3U/lxTishmji9leo11nrTjixSevchezyYLQdcr5b
 m1vHxz5FlKcuz6s0qM7rrDDwIvtAxj3khAw+9FCRRDJ6X9MhDRlUBZtCz
 8ngs42qq3ycjv6lL485h4nwWGO0HFZ8gwVR9JNfK/zlKwWRDJZn49Eijm
 Lbrij/OFfCTA01jGku7vzMuZ4RxEohcED2wkqOXEGfXCTiU6CV+r96AiQ
 u5gKwBCiP8tl5ZqpejCZldakR7cURElTPPSUJkOw/5aw47UcwidWiUtHU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425274646"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425274646"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805768412"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805768412"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:50:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 12:50:36 -0800
Message-ID: <20231206205034.1105637-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206205034.1105637-4-matthew.d.roper@intel.com>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although we've stored the major and minor versions for graphics/media in
xe_device, it will be simpler to implement the uapi version query if we
also stash the raw register value in the GT itself.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 154d6c7072b9..c6f7885ffdc0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
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
index 4e48c4643163..4e7a4494a554 100644
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

