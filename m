Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C876C3DA6F
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0B410E662;
	Fri, 25 Aug 2023 11:51:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467E10E65E;
 Fri, 25 Aug 2023 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964291; x=1724500291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGFA7cVOFIYfuUhtWfapoqZZyr0cpZq5xvDFfc0NSRg=;
 b=np2RiRP4Sju5nvEmtzvgYoOrHiltzPktpiNxeAUXdmtCKXPYcDV9jD61
 iepBkv0H8Wyzov+ZLbcMFke4UCHyZhaGsFL0bnmPAtczEfpZfb4cEr0Az
 ftsoXhR6Om7Z8UJgd7WUChj2DsoQG10cEIEF+C9lxdl2XIvEWVFehpE3T
 OkHNUK1lKXaxDIdthDxNJW9o8/RjplMgvSiSGFSFlRcaKEveMNql0LthV
 M9C8/182w3t5VOIecha+m4VPf7TkByzWotXersH2t0UDWXiYVlLObipn7
 zyap4zKdjvfYzjxzEJ1uloig/awQuz3Bw9oNEidL4BJ7CuczfZ8S2+PAx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694753"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694753"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153541"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:34 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 17:25:31 +0530
Message-Id: <20230825115531.800574-6-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
References: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 5/5] drm/xe/RAS: send multicast event on
 occurrence of an error
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 226be96e341a..5eb041d7e07c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -1073,6 +1073,37 @@ xe_gsc_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 	xe_mmio_write32(gt, GSC_HEC_CORR_UNCORR_ERR_STATUS(base, hw_err).reg, err_status);
 }
 
+static void generate_netlink_event(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	struct xe_device *xe = gt->xe;
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (!xe->drm.drm_genl_family.module)
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg) {
+		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, &xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
+	if (!hdr) {
+		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
+		nlmsg_free(msg);
+		return;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(&xe->drm.drm_genl_family, msg, 0,
+			  hw_err ?
+			  DRM_GENL_MCAST_UNCORR_ERR
+			  : DRM_GENL_MCAST_CORR_ERR,
+			  GFP_ATOMIC);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
@@ -1103,6 +1134,7 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
 
+	generate_netlink_event(gt, hw_err);
 out_unlock:
 	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags);
 }
-- 
2.25.1

