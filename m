Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3F8CD6E6A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 17:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853EC10F2B1;
	Tue,  2 Jun 2026 17:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CutScf2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3010F26B;
 Tue,  2 Jun 2026 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780419648; x=1811955648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JYG2KzRF2ommSARKOHfXD/vTYWdF+l/Na4oLRBbrIlM=;
 b=CutScf2EqiWCjkOQfYlq5VA4ZGmxFRboXjgFmKYcF+jApohVRm0Iv907
 MvcGbZ0yaiarzydRWq5DiDljgjJ9U7g0g87gTVeuIOXuN1RSvYHN14cx8
 Xi/jfyejmBwxKLR6Vs0HcZcCkT1+3T5yrI3+yoJn4I2mxaBBAgyJq/bc5
 NdDRx+GX+Z4WFLjmdPZtlGacGdXy3Wi2D0F610rznx7OTPyMZWO1muD0m
 NtleZLBFaGFrjKpf40qL2ueVkbLFtV0PE11epA7vEwpjusNfnL0ARxKwN
 U6lPW1NDnqcfK9vWuRiirPtNamsFTbBwt01dJyMIMJaVH0y5pE21wM+6v g==;
X-CSE-ConnectionGUID: NxSL39KuRN+wNETOayv5GQ==
X-CSE-MsgGUID: ouzF+Bv3Tt2pPdiWFaJmvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68755472"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="68755472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 10:00:48 -0700
X-CSE-ConnectionGUID: zlTdtbhSR5y+/zg1OOSvcg==
X-CSE-MsgGUID: mBZiwZa1Qn6mDK8SesYT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239795612"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 10:00:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v5 4/8] drm/i915/bios: de/allocate VS/PE-O buffer for each port
Date: Tue,  2 Jun 2026 19:00:27 +0200
Message-ID: <20260602170031.1163205-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260602170031.1163205-1-michal.grzelak@intel.com>
References: <20260602170031.1163205-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Every devdata needs a separate intel_ddi_buf_trans since each port can
request an override. Add buffer's pointer into intel_bios_encoder_data.

Allocate struct intel_ddi_buf_trans for the port if VS/PE-O was
requested and is supported. At the same time, allocate struct
intel_ddi_buf_trans_entry and store it inside struct
intel_ddi_buf_trans.

Deallocate the buffer as well as entries if the request is supported.

v4->v5
- set devdata->vspeo->num_entries in intel_bios.c

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 204176088a7cd..bc48ed9a7cbf5 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -34,6 +34,7 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
+#include "intel_ddi_buf_trans.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
@@ -72,6 +73,7 @@
 struct intel_bios_encoder_data {
 	struct intel_display *display;
 
+	struct intel_ddi_buf_trans *vspeo;
 	struct child_device_config child;
 	struct dsc_compression_parameters_entry *dsc;
 	struct list_head node;
@@ -2628,6 +2630,30 @@ static void sanitize_device_type(struct intel_bios_encoder_data *devdata,
 	devdata->child.device_type |= DEVICE_TYPE_NOT_HDMI_OUTPUT;
 }
 
+static void allocate_vswing_preemph_override(struct intel_bios_encoder_data *devdata)
+{
+	int num_rows = devdata->display->vbt.vspeo.num_rows;
+	union intel_ddi_buf_trans_entry *entries;
+	struct intel_ddi_buf_trans *vspeo;
+
+	if (!intel_bios_encoder_requests_vspeo(devdata))
+		return;
+
+	vspeo = kzalloc_obj(*vspeo);
+	if (!vspeo)
+		return;
+
+	entries = kzalloc_objs(*entries, num_rows);
+	if (!entries) {
+		kfree(vspeo);
+		return;
+	}
+
+	devdata->vspeo = vspeo;
+	devdata->vspeo->entries = entries;
+	devdata->vspeo->num_entries = num_rows;
+}
+
 static void sanitize_hdmi_level_shift(struct intel_bios_encoder_data *devdata,
 				      enum port port)
 {
@@ -2846,6 +2872,7 @@ static void parse_ddi_port(struct intel_bios_encoder_data *devdata)
 	sanitize_dedicated_external(devdata, port);
 	sanitize_device_type(devdata, port);
 	sanitize_hdmi_level_shift(devdata, port);
+	allocate_vswing_preemph_override(devdata);
 }
 
 static bool has_ddi_port_info(struct intel_display *display)
@@ -3383,6 +3410,11 @@ void intel_bios_driver_remove(struct intel_display *display)
 	list_for_each_entry_safe(devdata, nd, &display->vbt.display_devices,
 				 node) {
 		list_del(&devdata->node);
+
+		if (devdata->vspeo)
+			kfree(devdata->vspeo->entries);
+
+		kfree(devdata->vspeo);
 		kfree(devdata->dsc);
 		kfree(devdata);
 	}
-- 
2.45.2

