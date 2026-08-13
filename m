Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A409C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893B510F407;
	Thu, 13 Aug 2026 16:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/3Ad9lN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253210F401;
 Thu, 13 Aug 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786637415; x=1818173415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qJshARwRn/dyMFbzeUXHOZO3og/7wP1iMY8jmWIml0=;
 b=l/3Ad9lNjS5q35nAGGAyteM63skrbcZA8QfEoyypBxz/qMDJHVg+H3Nr
 TkW7NLV0xZexV5cTAFDRFyuR1jJ6ktNUr9NNhjiLS4w6LVxSG48XuxNt7
 k8lkxtbZN7LmITGJ8s3vKfk4rT5Qjw02vTHqqjMD/yoCwlg/E7Hg/feeT
 QfVuwGvsXtIxtn8PvzLIxBtpiUf5YQ+8q/6UkAkYDm0kC+4c5tJ/gyTFg
 u6RunBSw3rxRnZZIHSgMomtHgTDr8hqV4YBaDbWpo9LWtFaUqzJ8cDXV4
 3Pa77qe4ojjaYBsn6hQy/rL6hftLGLv5gvBZbpsCQFT26nm112i6AFvku A==;
X-CSE-ConnectionGUID: i3si4c5rSfWHIBM69wSrYA==
X-CSE-MsgGUID: v79VglLUT7KizzpfgmcRXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97882437"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97882437"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:10:15 -0700
X-CSE-ConnectionGUID: tZpT/ceYTZ2sxtP3EiChIA==
X-CSE-MsgGUID: c+OdkPAUTTGwpByHDxHfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260175385"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 09:10:14 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v11 3/8] drm/i915/bios: print VS/PE-O port info
Date: Thu, 13 Aug 2026 18:09:13 +0200
Message-ID: <20260813160918.918857-4-michal.grzelak@intel.com>
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

Issue a debug message when port asks to override default Vswing /
Preemphasis tables.

Add helper intel_bios_encoder_requests_vspeo() to check if port
requests for overriding default VS/PE tables.

v6->v7
- expand VS/PE-O acronym in debug logging (Jani)

v3->v4
- change debug message when requesting VS/PE-O (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 06a8dd7581bb8..9610b794bc147 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2801,6 +2801,11 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 			    "Port %c supports dynamic DDI allocation in TCSS\n",
 			    port_name(port));
 
+	if (intel_bios_encoder_requests_vspeo(devdata))
+		drm_dbg_kms(display->drm,
+			    "Port %c requests vswing/pre-emphasis override\n",
+			    port_name(port));
+
 	hdmi_level_shift = intel_bios_hdmi_level_shift(devdata);
 	if (hdmi_level_shift >= 0) {
 		drm_dbg_kms(display->drm,
@@ -3829,6 +3834,11 @@ int intel_bios_hdmi_ddc_pin(const struct intel_bios_encoder_data *devdata)
 	return map_ddc_pin(devdata->display, devdata->child.ddc_pin);
 }
 
+bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata)
+{
+	return devdata->display->vbt.version >= 218 && devdata->child.use_vbt_vswing;
+}
+
 bool intel_bios_encoder_supports_typec_usb(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 195 && devdata->child.dp_usb_type_c;
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 75dff27b42289..7a50a272cd27d 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -73,6 +73,7 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
 const struct intel_bios_encoder_data *
 intel_bios_encoder_data_lookup(struct intel_display *display, enum port port);
 
+bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_hdmi(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dp(const struct intel_bios_encoder_data *devdata);
-- 
2.45.2

