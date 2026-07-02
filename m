Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73CC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 18:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2954E10F580;
	Thu,  2 Jul 2026 18:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ND2lUJ0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CEB10F597;
 Thu,  2 Jul 2026 18:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783018735; x=1814554735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INXGljcYXqUWthlSO+jwnckQV2JuWea955KcZ4gMU1U=;
 b=ND2lUJ0AhVa0VozTm0AlZOio4HpDfMM7e0Txq4ee6DtnX+6Zt7zhT90b
 18BI6dIZFP9d/PP6j3HzD32oZbyXs5ZM4l+LCPoIcsbV1xoOyT2xa9WhZ
 9lIhzC1vuDmpMHmbzPYaJWVY/L6+eP0vt/RXTbIMJcT13VgkT157gWcM0
 JtHvua21V0mysF2VUdmhm/BhUL8kGRDo2EZqhcwyPVFJ4n3r1aGgbVo7r
 Cns1RQQIkc1oU3/Dk5bK0gJIjTD8OH7cI8N6jfFOpKF/SlNS3BDcynpMm
 GIcGxx7na3mcW6/Md1S2UquT3SovhULubgFGsJjhgZIGyCtjP9YIVZ6MO Q==;
X-CSE-ConnectionGUID: 45GhMDHRTlabgvbMp6jgOA==
X-CSE-MsgGUID: HGSWIWk4TC69m8JtGAY5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71300037"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="71300037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:58:55 -0700
X-CSE-ConnectionGUID: 5l5ZfDXfT2qEpGYBiaHFeQ==
X-CSE-MsgGUID: Ei5WATzIQkqtRltrH6PG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="251862162"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 11:58:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v10 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for each
 port
Date: Thu,  2 Jul 2026 20:58:35 +0200
Message-ID: <20260702185839.4042397-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702185839.4042397-1-michal.grzelak@intel.com>
References: <20260702185839.4042397-1-michal.grzelak@intel.com>
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
index 9610b794bc14..a491b8500611 100644
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

