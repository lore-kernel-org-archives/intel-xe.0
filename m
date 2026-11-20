Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDABD606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nO6S+Ub3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C54410E1EB;
	Fri, 20 Nov 2026 02:20:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6A11283E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795141201; x=1826677201;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zh02p6rjsfyI+8Y6eiu/PeTW7l/t31NzS1aRUlZ/NO0=;
 b=nO6S+Ub3vd0Rm9ZkBhfqhNmrYmlx4q6m0TcMhDbefXjNZAVD5S8Tx3yf
 X0/Q/zsf/xgGKnn4JS03Wgnvdxbg46kseD1CmJiBI3Coo5r/Si4PayGui
 0RyBDS1cGSimHt94t5qUjep856PCshajY8E1mrTSar3U6rggWVrr+RAne
 8CFX+C/WEw7mKPZGLsMnHA5574hz0mcDa5Dv8+WXiXht7dCxZ/S7pvjtl
 Q2InZDRePwlzKcQc5AuvosDREhz2JwB8SKyKM1v0L3wvIy6aOTTwpnmoh
 48UjFA0PJoNoScJmSd4cux9KFePl92CbGY1tXvK+v8g6SJSSgBXdb8xUq A==;
X-CSE-ConnectionGUID: XRDElM57RuuYXLZW17Bb0A==
X-CSE-MsgGUID: waP3x/ehQS6IyoiS/nZTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898445"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 18:19:45 -0800
X-CSE-ConnectionGUID: 9M3Kg+aBQ4WJE+DouFzEXA==
X-CSE-MsgGUID: uEaa1D1dRr6ln5+TAIaH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10487129"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 18:19:45 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v20 11/19] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
Date: Thu, 19 Nov 2026 18:19:41 -0800
Message-ID: <20261120021929.473553-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Current pmt_telem_read() usage is a fixed (for BMG) offset.
In order to support other devices this must be settable.

Add a base offset for more flexibility.
Add a check to verify that it has been set before allowing
device access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..28b1669a14d8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -485,6 +485,8 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 668f76e3f6c4..bd272891caeb 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -172,6 +172,7 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  *
  * Return:
  * * -ENODEV device is not available (hotplug)
+ * * -EAGAIN base_offset has not been set, so init path has not yet been done.
  * * -ENODATA for incorrect power state
  * * -EINVAL for unsupported PMT feature
  * * count   number of bytes read on success
@@ -180,8 +181,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
 	u32 mem_region;
 	u32 offset;
 	int ret = 0;
@@ -194,6 +195,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		return count;
 	}
 
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		goto dev_exit;
@@ -271,6 +277,7 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

