Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3F810F92F3
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4865010EB8B;
	Tue, 31 Mar 2026 18:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UD4naFzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2010EB17;
 Tue, 31 Mar 2026 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774982082; x=1806518082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQgBtOkk9p8SV8y1PLs5BQUzj7/KUSJ9b0JCmXDHdjM=;
 b=UD4naFzyF9PgkrJhPjzkq9oRMTcbkaz8FFuCo/6ce4MwuwdaUMChW9IL
 hYrkZbhwrIweSokLxyBU/LX80hgLOkLC4rJC/Xw4/iwL2k1JtvlkYG17f
 FwUTKuh8vCXS5HRjkfu0k8GLBzR9v8fPMNBBpx/2ubVjouVWGFSHBvT2L
 z63w+uLJCDNptsbG32PQGwGtWnaKdCw7r0hOi10azfLqnd4BoO6yMU51l
 00XVas5Nf8OXTWZ/hZ84r3DIzl/BPkQ58Xc+5NYvrVHrGlOrjCkpsR4r1
 6z9iUZMA9QvD9Jk66L6rqGTFCWl8dMyHtfKAUDQdkvgmWhhwHzcdbOHPm Q==;
X-CSE-ConnectionGUID: MdRcLP8OR2K2E/5K30jLSA==
X-CSE-MsgGUID: 6+lb3NuYRwOE7BeJZnh8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86705186"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86705186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:34:42 -0700
X-CSE-ConnectionGUID: MB3msPlWSF2aZ7h32U2uGA==
X-CSE-MsgGUID: dCg7ayU1QlOJWIrEJ1xrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="256944504"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 11:34:41 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 10/16] drm/i915/ddi: cache VS/PE struct pointer into
 intel_encoder
Date: Tue, 31 Mar 2026 20:33:26 +0200
Message-ID: <20260331183332.1773886-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260331183332.1773886-1-michal.grzelak@intel.com>
References: <20260331183332.1773886-1-michal.grzelak@intel.com>
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

Add ddi_vswing_preemph's pointer into struct intel_encoder. Track with
it struct ddi_vswing_preemph from each encoder.

Add into intel_bios.[ch] a helper function to extract the pointer. Cache
the pointer by default into each encoder in intel_ddi.c.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c          | 6 ++++++
 drivers/gpu/drm/i915/display/intel_bios.h          | 2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c           | 1 +
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 4 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index f94093379df0..a0a5399711d6 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -3965,6 +3965,12 @@ bool intel_bios_encoder_supports_tbt(const struct intel_bios_encoder_data *devda
 	return devdata->display->vbt.version >= 209 && devdata->child.tbt;
 }
 
+const struct ddi_vswing_preemph *
+intel_bios_encoder_extract_vswing(const struct intel_bios_encoder_data *devdata)
+{
+	return &devdata->vswing_preemph;
+}
+
 bool intel_bios_encoder_overrides_vswing(const struct intel_bios_encoder_data *devdata)
 {
 	return devdata->display->vbt.version >= 218 &&
diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index 50c8fc91fbe8..2cf32ee58ed0 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -73,6 +73,8 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
 const struct intel_bios_encoder_data *
 intel_bios_encoder_data_lookup(struct intel_display *display, enum port port);
 
+const struct ddi_vswing_preemph *
+intel_bios_encoder_extract_vswing(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_overrides_vswing(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
 bool intel_bios_encoder_supports_hdmi(const struct intel_bios_encoder_data *devdata);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ebefa889bc8c..f2497d20e6bd 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5249,6 +5249,7 @@ void intel_ddi_init(struct intel_display *display,
 
 	encoder = &dig_port->base;
 	encoder->devdata = devdata;
+	encoder->vswing_preemph = intel_bios_encoder_extract_vswing(devdata);
 
 	drm_encoder_init(display->drm, &encoder->base, &intel_ddi_funcs,
 			 DRM_MODE_ENCODER_TMDS, "%s",
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e2496db1642a..e879c2c9b394 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -297,6 +297,7 @@ struct intel_encoder {
 
 	/* VBT information for this encoder (may be NULL for older platforms) */
 	const struct intel_bios_encoder_data *devdata;
+	const struct ddi_vswing_preemph *vswing_preemph;
 };
 
 struct intel_panel_bl_funcs {
-- 
2.45.2

