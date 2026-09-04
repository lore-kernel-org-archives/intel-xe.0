Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B4C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F140810FA23;
	Fri,  4 Sep 2026 12:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MizLrlLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2882910F9AB;
 Fri,  4 Sep 2026 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525121; x=1820061121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iy1ZyrJdv3bmqd0BB4c7JbZUVH5ao7d8w2wSNA3OzU=;
 b=MizLrlLPgj8uWUIW+9C7ZqzsZUfv6CgmpB73/MWH9BsYrIoor37Ue9oO
 YecHbM0sBKtk0//vNl7Mhq4eXRWIgEqhq5cAewhke14I1q4SBbDOJF+pM
 MlgSa+IngCK8gOvBYNnybhKfXNxQPsUGs/q7ChL/knxIERJc9dERLYgxN
 Vmw5+fZDvhDuTBJxWr/lvDJEehWyBPoHcRe7TOI7hBmH0VpbvOo7pcct9
 28bGOtgPGUuHOxGdPwFaHscoZrGzn6OXkTxs7hj2EHtfstcxwoqm8IgF/
 sav300G3Fjuv4aBxXGnlcKucdua2syIRJiI6W9nFmLYb2nLYbRCRIgbz8 Q==;
X-CSE-ConnectionGUID: g1ipm37TRYSry8ZskADkDw==
X-CSE-MsgGUID: INFp+6QLSz+1nhwOOcuHiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92896579"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92896579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:32:01 -0700
X-CSE-ConnectionGUID: tkmKiM8uSj61NzzKRIrQXQ==
X-CSE-MsgGUID: bGeO6J+FQZC0LQOElt2R2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275311586"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2026 05:31:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v12 4/8] drm/i915/bios: de/allocate VS/PE-O buffers for each
 port
Date: Fri,  4 Sep 2026 14:31:44 +0200
Message-ID: <20260904123148.2165596-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260904123148.2165596-1-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
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

Every devdata needs VS/PE-O dedicated buffers since each port can
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

v11->v12
- set vspeo->num_entries once (Sashiko)
- free allocated vspeo->entries (Sashiko)

v9->v10
- add separate non-const field for `entries` caching
- cache `entries` into const field after data is overwritten (Jani)

v4->v5
- set devdata->vspeo->num_entries in intel_bios.c

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 9610b794bc147..1a09f7933e491 100644
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
@@ -2648,6 +2651,30 @@ static void sanitize_device_type(struct intel_bios_encoder_data *devdata,
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
+	devdata->entries = entries;
+	devdata->vspeo = vspeo;
+	devdata->vspeo->num_entries = num_rows;
+}
+
 static void sanitize_hdmi_level_shift(struct intel_bios_encoder_data *devdata,
 				      enum port port)
 {
@@ -2866,6 +2893,7 @@ static void parse_ddi_port(struct intel_bios_encoder_data *devdata)
 	sanitize_dedicated_external(devdata, port);
 	sanitize_device_type(devdata, port);
 	sanitize_hdmi_level_shift(devdata, port);
+	allocate_vswing_preemph_override(devdata);
 }
 
 static bool has_ddi_port_info(struct intel_display *display)
@@ -3403,6 +3431,9 @@ void intel_bios_driver_remove(struct intel_display *display)
 	list_for_each_entry_safe(devdata, nd, &display->vbt.display_devices,
 				 node) {
 		list_del(&devdata->node);
+
+		kfree(devdata->entries);
+		kfree(devdata->vspeo);
 		kfree(devdata->dsc);
 		kfree(devdata);
 	}
-- 
2.45.2

