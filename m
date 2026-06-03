Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49B8CD6E6B
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 23:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715F2112473;
	Wed,  3 Jun 2026 23:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTtV1uQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6588F112471;
 Wed,  3 Jun 2026 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780527962; x=1812063962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwc/4W8IHTIA3Td2ZKnpzPanZnyWjTJfVLDOrOx7XaE=;
 b=WTtV1uQoYRnTdJjJzTJBU5IbpqoCV1R20EA3Ao9nSyU6nRU7jUNI6sQf
 j/eB7syt1MB4hxXKNtFRAy5B2Ql3aErf0h/M9W+LmTpDC2CFU0cGH/Fcg
 2rZFWAWcq92FOcrpxcCB+UmZk1oqmlaTRT3veHL6rIMzVEt/WCkTk2iah
 8sYjDFn6KoqPgQi0vjgUhpPAK+DAUOHEijX2HaJg2eG+/HInfhwC3vJQC
 JxlRaQWvA9mQg6kM1LfDUMDI9jwT7MOd1bE9OOMG+9vfxMwtJb8HVD6y6
 nkdfbIvmWKdwVrF1434btPm79DSeXR3eAY1N2qDcvpJ5yhWcGEqnI7Ms/ g==;
X-CSE-ConnectionGUID: GxnRXy+iSMexEWBClcvG6w==
X-CSE-MsgGUID: D1/+aygrRoapv+GHK4BpLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104013971"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="104013971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 16:06:02 -0700
X-CSE-ConnectionGUID: qDub1wxuQkaNO5iFKGUDsA==
X-CSE-MsgGUID: uPuyXb+VQGWoFCJG1Pqbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244223635"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 16:06:00 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v6 3/8] drm/i915/bios: print VS/PE-O port info
Date: Thu,  4 Jun 2026 01:05:39 +0200
Message-ID: <20260603230544.1993439-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260603230544.1993439-1-michal.grzelak@intel.com>
References: <20260603230544.1993439-1-michal.grzelak@intel.com>
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

v3->v4
- change debug message when requesting VS/PE-O (Suraj)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_bios.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index d071f0e5d4380..204176088a7cd 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2781,6 +2781,11 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 			    "Port %c supports dynamic DDI allocation in TCSS\n",
 			    port_name(port));
 
+	if (intel_bios_encoder_requests_vspeo(devdata))
+		drm_dbg_kms(display->drm,
+			    "Port %c requests VS/PE-O\n",
+			    port_name(port));
+
 	hdmi_level_shift = intel_bios_hdmi_level_shift(devdata);
 	if (hdmi_level_shift >= 0) {
 		drm_dbg_kms(display->drm,
@@ -3809,6 +3814,11 @@ int intel_bios_hdmi_ddc_pin(const struct intel_bios_encoder_data *devdata)
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

