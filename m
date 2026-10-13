Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D3CC6B15
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F67310F533;
	Tue, 13 Oct 2026 21:47:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E392710F520
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791928054; x=1823464054;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=I6AJvQhAXMDbuCqsIlE+YGh9SFM3FwKNRRSabIJWFyU=;
 b=jHFjejMRsARJFVpIuT9x98fxVgKlYVFfNKrkdSP3PR+RYOXsscP7786Z
 k7fze6YlNTD9k7TUJLAmqS0N1Kv3XGemt398R6+FP02RJuoPGDALTBW4q
 eO07p/2l3cVraYFSPvvK/3erldKB3eB6eAOBNFPJMOwTJbjN+p9MKdPtl
 BECtC740lvrdzN1kjo48PTG+4WYqJbrtVxUWXPpNCfHZA8mvuUsq9KKCL
 Jo4yQSM9QTr/3GpWI0jHXbfqCAEgVNjVgWLaWkl//CVDFBI2fkxjTeSGD
 e4eOwOte23nSOMnGKTjn+eKt79lXNioCBLlereSE5LhGdfevWYjdVyhi6 g==;
X-CSE-ConnectionGUID: RaWNuRyZQQ+eVEGuOHBLrQ==
X-CSE-MsgGUID: c5iR0i/rRDy1s6iHVCECYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565929"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565929"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: rL0rJLR3ThyIZ8Ue1FErcg==
X-CSE-MsgGUID: CuAhkF6DTfOlJsKZ9dQQHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629859"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v12 13/21] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
Date: Tue, 13 Oct 2026 14:47:06 -0700
Message-ID: <20261013214655.3502964-36-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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
index 41f703a87916..5a5bb56971e2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -492,6 +492,8 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index ebe56c85bc05..04aec1e5c15c 100644
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
@@ -192,6 +193,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		goto dev_exit;
@@ -269,6 +275,7 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

