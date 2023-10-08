Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABCBE95A82
	for <intel-xe@archiver.kernel.org>; Sun,  8 Oct 2023 09:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A87310E10E;
	Sun,  8 Oct 2023 09:24:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7110E0E7;
 Sun,  8 Oct 2023 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696757043; x=1728293043;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IAIHPpflRx8yyRlwFPvu2i4K3FV/bD3IHK6ZmbpZmf0=;
 b=MtDuRL4/YewwtVDJLO0DjO72ukhjTbFltl2C6udSzyCwdPMW0d8r9aqW
 TgR65aZ+8wOHsQYp61OltOZwcKVFGlOSdMdfLS8q8oPdli0ZGN7bxJMdz
 YHwI0f0GMtC0IRy8Uj+jmj0EdDo+G4Mvgg12PAaugf2Hen9tdUWFU7D6W
 FW4cCm9c/fv6af9hyqpUAe70HL8c3jDIAyRdGSe6HDyYZ+TTiqyXZUTfo
 8XL9OI2npY27iNxwC4oOmMvthm4qqJY9DGrtmc4S9dkW6sOfp7hJYsF05
 AjBoR1tTI8ElzhWE6g/9G3qrswi+G6T+ytUHL1qrs+XU5kFhtZf7683Lq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364278999"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="364278999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1084007117"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="1084007117"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:59 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com
Date: Sun,  8 Oct 2023 14:56:16 +0530
Message-Id: <20231008092616.1457995-6-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
References: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

v2: Rebase

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a777c887a7be..8d52f051c36e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -773,6 +773,37 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 				(HARDWARE_ERROR_MAX << 1) + 1);
 }
 
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{
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
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -826,6 +857,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 	}
 
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
+
+	generate_netlink_event(tile_to_xe(tile), hw_err);
 unlock:
 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
 }
-- 
2.25.1

