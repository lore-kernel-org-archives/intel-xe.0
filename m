Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABFF433D2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66CB10E7A4;
	Wed, 15 Apr 2026 23:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZyujyzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F5810E7A4;
 Wed, 15 Apr 2026 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776296819; x=1807832819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJVuY78Q7wAECozF8SLSQOSJjf+SR053eWMhUAEEeU0=;
 b=gZyujyzbdn+lo/ydFx4SQbvFHdUv56zMiWFn93Siwwt24seOeJZkESE3
 Kslrr4FKki+FCTn2eYdA3XeMq/mFmk2YvOPETq3xCHtSuZ1l5E2syNUnW
 OkxVunZZFLtrdqJFGyXUmlBZjgymGdjfDEGGFMEVusth8nkOKVDI8GR9W
 vSy7KGD0Gs9n6YKF6D4ePdkVP7pxh5U6qa5G8l42xslTw4kZP6f84HPPg
 DRheAhQtTgdq20yhaa88rqu+ahODWc0VCxijmJoD34QKV/nTlyohPOmzf
 QDaQSoTXEdHnAqwP9+N9rAqcuSZg0Lrfc0PTmlvXgHNdE/FGL8lVFANdZ w==;
X-CSE-ConnectionGUID: yPDo4g/lTd6d8dRwA4HBgw==
X-CSE-MsgGUID: eNL2DikKSUuYDudsXHj0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77403486"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77403486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:46:59 -0700
X-CSE-ConnectionGUID: 2N2NzOsWTJ6TGIO/1ywAcQ==
X-CSE-MsgGUID: OcocYZS/SOeUwbWE4XOJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235511129"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 16:46:58 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 04/32] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
Date: Thu, 16 Apr 2026 01:46:11 +0200
Message-ID: <20260415234639.3577774-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260415234639.3577774-1-michal.grzelak@intel.com>
References: <20260415234639.3577774-1-michal.grzelak@intel.com>
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

Store number of rows and number of tables in intel_vbt_data when search
for the VBT #57 succeeded.

Display version determines number of rows present in each table. pre-MTL
platforms should have 10 rows while MTL+ should have 16 rows.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c         | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_core.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3f9e4d31c7375..d64668c1022a7 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2200,6 +2200,9 @@ parse_vswing_preemph_override(struct intel_display *display)
 		return;
 
 	drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
+
+	display->vbt.num_tables = block->num_tables;
+	display->vbt.num_rows = DISPLAY_VER(display) >= 14 ? 16 : 10;
 }
 
 static u8 translate_iboost(struct intel_display *display, u8 val)
@@ -2997,6 +3000,10 @@ init_vbt_defaults(struct intel_display *display)
 							      !HAS_PCH_SPLIT(display));
 	drm_dbg_kms(display->drm, "Set default to SSC at %d kHz\n",
 		    display->vbt.lvds_ssc_freq);
+
+	/* Vswing / Preemphasis Override */
+	display->vbt.num_tables = 0;
+	display->vbt.num_rows = 0;
 }
 
 /* Common defaults which may be overridden by VBT. */
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index d9baca2d5aaf8..2ffdb71c4a726 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -233,6 +233,9 @@ struct intel_vbt_data {
 	struct list_head display_devices;
 	struct list_head bdb_blocks;
 
+	int num_tables;
+	int num_rows;
+
 	struct sdvo_device_mapping {
 		u8 initialized;
 		u8 dvo_port;
-- 
2.45.2

