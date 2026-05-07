Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE24CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8B10EF3D;
	Thu,  7 May 2026 01:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmGJ6l2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60710EF3B;
 Thu,  7 May 2026 01:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117519; x=1809653519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8fl4WD7/1C2TVNAnCCj31Ea0zAhQaXM9hWBFoGJQ4rk=;
 b=UmGJ6l2m5zE6GqqkjSHMVLwdN+CyYAlBJd3gNznLOcOBEc55WxgV7IyD
 NwLEx1VHzSegbz37N0iQsy4La8+fgJFFDEQr+H7Lun4QQf3GtklqeFQe2
 /vVsmcXS99qMyxYleXAaPXdgGMTKNIgg217CX0dYp3s5KSOBXu/atgp8T
 /Fg+0BCPGXdrNzdhjGpFmVztauH4uX1f+c8x2g+ywbOEESBf2JsenYsNG
 Q8H0h6S605dOD7RxljKanulH130cC361HdrE304MeaK1gAqiI4tTOFWlm
 OGPRThCMVQCbiMEazeekNkEGnJmV3yJRv6M7TZHggUoofzKOJC0KuxMrh w==;
X-CSE-ConnectionGUID: bCuvj8qUSMyhCSJZeehF/Q==
X-CSE-MsgGUID: sJnE1/ZaQMWhtuNgmA1TwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089023"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089023"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:31:59 -0700
X-CSE-ConnectionGUID: d8C9z0nJQQSy9xpVcsqXxg==
X-CSE-MsgGUID: 1yuPKeE0RCed/rpDyIsCdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692760"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:31:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 07/31] drm/i915/bios: add buf_trans for each bios_encoder
Date: Thu,  7 May 2026 03:31:13 +0200
Message-ID: <20260507013137.527510-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
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

Initialize the pointer to NULL when no VBT was provided.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 6ac8dd16ea7b8..a3f0334c3a582 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -73,6 +73,7 @@
 struct intel_bios_encoder_data {
 	struct intel_display *display;
 
+	struct intel_ddi_buf_trans *buf_trans;
 	struct child_device_config child;
 	struct dsc_compression_parameters_entry *dsc;
 	struct list_head node;
@@ -2656,6 +2657,11 @@ static void sanitize_hdmi_level_shift(struct intel_bios_encoder_data *devdata,
 	}
 }
 
+static void override_vswing_preemph(struct intel_bios_encoder_data *devdata)
+{
+	devdata->buf_trans = NULL;
+}
+
 static bool
 intel_bios_encoder_supports_crt(const struct intel_bios_encoder_data *devdata)
 {
@@ -2847,6 +2853,7 @@ static void parse_ddi_port(struct intel_bios_encoder_data *devdata)
 	sanitize_dedicated_external(devdata, port);
 	sanitize_device_type(devdata, port);
 	sanitize_hdmi_level_shift(devdata, port);
+	override_vswing_preemph(devdata);
 }
 
 static bool has_ddi_port_info(struct intel_display *display)
@@ -3057,6 +3064,7 @@ init_vbt_missing_defaults(struct intel_display *display)
 			break;
 
 		devdata->display = display;
+		devdata->buf_trans = NULL;
 		child = &devdata->child;
 
 		if (port == PORT_F)
-- 
2.45.2

