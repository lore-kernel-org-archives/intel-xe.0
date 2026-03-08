Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57297F55139
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1150010E13E;
	Sun,  8 Mar 2026 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpBUFtQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BE210E041;
 Sun,  8 Mar 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772976305; x=1804512305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LMv3uQczRBkIFAVHRrkOuh9xObNvwtfMsnBkMH/SPYQ=;
 b=lpBUFtQvS59VX1birE0jt5EZsE/i2ewJfojnjIFdU5BlGS53LLAhp15z
 y3y/ZLoZ/gvu0jKuqKXEyuoNsqOru5ZS2H4YX6fz0l8aT57sPeiGIJSmC
 7CGzeGZCLL7cXwZtTgxzTRsi9kIycl6v5YBueN2+PFX5Y/qM/OcAX7cEk
 WyixOy837LKxYHSdzcFAb9tpkndeivr8QPt7ALcjum8QWFV+CKJ088Vha
 YwRiKOifZObQO+koqrNmwQoIkr3kgpnLFGznoty+yCdTBCcUMWo+16AhW
 xSx1lL35pC//WJ9QelKtfrPBq4dK6UVtYZbDX9/2VAZTUntBGHOnchkBN Q==;
X-CSE-ConnectionGUID: N6xSKB2JSu6EhlK8SVUt1Q==
X-CSE-MsgGUID: FaaOXV35T/+fMoZf8hfipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77871398"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77871398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:25:05 -0700
X-CSE-ConnectionGUID: bt8sOfBTRCWez08HEtjrlQ==
X-CSE-MsgGUID: mVRlTXpDQ8iuAtBqreTWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="217598090"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 06:25:03 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC v1 02/11] drm/i915/bios: cache V/P Override block
Date: Sun,  8 Mar 2026 14:24:37 +0100
Message-ID: <20260308132446.3320848-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260308132446.3320848-1-michal.grzelak@intel.com>
References: <20260308132446.3320848-1-michal.grzelak@intel.com>
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

Add field into VBT data structure for pointer to Block 57. Cache the
pointer into it during VBT parsing.

In case firmware lacks Block 57 it will not be found during
init_bdb_blocks(). In turn it will not be appended to ->vbt.bdb_blocks
list. Thus bdb_find_section() will set .vswing to NULL.

Init the field to NULL when no VBT was provided.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c         | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_display_core.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 5700de438fdf..ae33b93772ef 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2185,6 +2185,15 @@ parse_compression_parameters(struct intel_display *display)
 	}
 }
 
+static void
+cache_vswing_preemph_block(struct intel_display *display)
+{
+	const u32 *block;
+
+	block = bdb_find_section(display, BDB_VSWING_PREEMPH);
+	display->vbt.override_vswing = block;
+}
+
 static u8 translate_iboost(struct intel_display *display, u8 val)
 {
 	static const u8 mapping[] = { 1, 3, 7 }; /* See VBT spec */
@@ -3046,6 +3055,7 @@ init_vbt_missing_defaults(struct intel_display *display)
 			    child->device_type, port_name(port));
 	}
 
+	display->vbt.override_vswing = NULL;
 	/* Bypass some minimum baseline VBT version checks */
 	display->vbt.version = 155;
 }
@@ -3276,6 +3286,7 @@ void intel_bios_init(struct intel_display *display)
 
 	/* Depends on child device list */
 	parse_compression_parameters(display);
+	cache_vswing_preemph_block(display);
 
 out:
 	if (!vbt) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index d708d322aa85..f974df3becef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -233,6 +233,8 @@ struct intel_vbt_data {
 	struct list_head display_devices;
 	struct list_head bdb_blocks;
 
+	const u32 *override_vswing;
+
 	struct sdvo_device_mapping {
 		u8 initialized;
 		u8 dvo_port;
-- 
2.45.2

