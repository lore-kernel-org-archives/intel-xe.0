Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D60C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2B510F410;
	Thu, 13 Aug 2026 16:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuQuJkrc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BC310F40A;
 Thu, 13 Aug 2026 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786637417; x=1818173417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xj5fBwL/16TO6I1GwxzDxZCFASpA5pCgZz/K+Vgrpjc=;
 b=fuQuJkrcT1CWkfPCGPS5xwPO450cx1eaJ68fSaUTkYl0e8osVN0zRsY6
 0M0duei9cDdZwnPbtAstDopXCg4gbh4Gkcy5Ef12DMVxFU+EavWYbiDKw
 vXMoV9g2x5yfVXZDdA7Bv23f7vi9lXyMOAN6ufLgQXz3bDCj8i/OroVRD
 /mniwCs/KA3LnTEci3otHcK/rumOSnc5Smh5lgqqQCRrUIfeyYm2ZWTZL
 bMYihMpHohEeRHpeBrS/bue+kbOKDf+rYd9qAOV4WMfU/3XvlXuDq3vfx
 wqfvQyuxdmbp7vMmliHtFE9HgzcbnTnW/jsCrneGEVBkY/i9JFf6gItZI g==;
X-CSE-ConnectionGUID: IIgICGz8QWGBhtSspGy5fg==
X-CSE-MsgGUID: uoxb8NSfQtm7tdrvpn0s1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97882441"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97882441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:10:17 -0700
X-CSE-ConnectionGUID: aIFy+50AR6yctFx8pcoZVw==
X-CSE-MsgGUID: 6JAgsIumR1WUPHPHAEYnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260175388"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 09:10:15 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v11 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for each
 port
Date: Thu, 13 Aug 2026 18:09:14 +0200
Message-ID: <20260813160918.918857-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260813160918.918857-1-michal.grzelak@intel.com>
References: <20260813160918.918857-1-michal.grzelak@intel.com>
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

Every devdata needs a VS/PE-O dedicated buffers since each port can
request an override. Add intel_ddi_buf_trans{,_entry} pointers into
intel_bios_encoder_data.

Allocate struct intel_ddi_buf_trans{,_entry} for the port if VS/PE-O was
requested and is supported. Keep NULL in vspeo if any allocation failed
or VS/PE-O was not requested. It will be used later for checking if
override should actually take place.

Note that we theoretically could store intel_ddi_buf_trans_entry inside
`entries` field of newly allocated intel_ddi_buf_trans. However it will
be impossible to overwrite the buffer during intel_ddi_get_buf_trans()
without discarding const qualifier of `entries` field. This would
involve either void casting or deconstifying entries field and in turn
all predefined tables as well. Thus add a separate non-const qualified
field into intel_bios_encoder_data for the buffer, which after
overwriting will be promoted to be const qualified.

Deallocate the buffer as well as entries if requested.

v9->v10
- add separate non-const field for `entries` caching
- cache `entries` into const field after data is overwritten (Jani)

v4->v5
- set devdata->vspeo->num_entries in intel_bios.c

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 9610b794bc147..a491b85006117 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -34,6 +34,7 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
+#include "intel_ddi_buf_trans.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
@@ -72,6 +73,8 @@
 struct intel_bios_encoder_data {
 	struct intel_display *display;
 
+	struct intel_ddi_buf_trans *vspeo;
+	union intel_ddi_buf_trans_entry *entries;
 	struct child_device_config child;
 	struct dsc_compression_parameters_entry *dsc;
 	struct list_head node;
@@ -2648,6 +2651,29 @@ static void sanitize_device_type(struct intel_bios_encoder_data *devdata,
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
+	devdata->entries = entries;
+}
+
 static void sanitize_hdmi_level_shift(struct intel_bios_encoder_data *devdata,
 				      enum port port)
 {
@@ -2866,6 +2892,7 @@ static void parse_ddi_port(struct intel_bios_encoder_data *devdata)
 	sanitize_dedicated_external(devdata, port);
 	sanitize_device_type(devdata, port);
 	sanitize_hdmi_level_shift(devdata, port);
+	allocate_vswing_preemph_override(devdata);
 }
 
 static bool has_ddi_port_info(struct intel_display *display)
@@ -3403,6 +3430,11 @@ void intel_bios_driver_remove(struct intel_display *display)
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

