Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D15C79F89
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB7D10F986;
	Fri,  4 Sep 2026 12:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr3LhOXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1315310F97E;
 Fri,  4 Sep 2026 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525118; x=1820061118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CeuF2p0RFfiIje0Ieff/BiXCdtFz5eOCS1jzswuYZXk=;
 b=Rr3LhOXmh0m6WWBF99NmTueJnn6NtDRBlekoumiFL/uwcIaUBKpVDElk
 xIfqkHtR4HpH8heYfNtrMQjEi49MIJCK4of5KS2GqmlMJOy0WS17mHd3n
 EBXFMc5sLcl7/SQ0eDxYn1ZwUaUBy8mnFoaiPRz5/sPvn30a9fIpIRrXO
 jHBeHForNACw74DYU19RqPQ/YLxKwnMSAIQv8COU9XOhzs4TcM1ldDkzu
 u/tU0pQIp3EtqZ/mdswmi00TAr5D6c38+dUeTnQXe56ymPG/UaacJ820O
 cT0n3BhuA5jPlDWlg7PFa1zHuCexzZBpz8WW1yqIk73DN775ud3z2fA1w w==;
X-CSE-ConnectionGUID: /5PCw0BLSyqEPiqxjOYIZw==
X-CSE-MsgGUID: pReggfbNTSacUAog5LdVxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92896571"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92896571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:31:58 -0700
X-CSE-ConnectionGUID: 7nwmRCpwRaWuRiZ0HtbsSw==
X-CSE-MsgGUID: iVWkosYrRbqVyj23ifNnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275311570"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2026 05:31:56 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v12 2/8] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
Date: Fri,  4 Sep 2026 14:31:42 +0200
Message-ID: <20260904123148.2165596-3-michal.grzelak@intel.com>
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

Store tables, number of tables, number of rows and number of columns in
intel_vbt_data when search for the VBT #57 has succeeded. Structurize
all VS/PE-O relevant metadata inside anonymous struct named as vspeo.

Presence of C20 or newer PHY causes each table to contain 16 rows. Each
table contains 10 rows in case C20 PHY is absent. Use display version to
determine number of rows since there is no helper in intel_bios.c to
check presence of any C20+ PHY. pre-MTL platforms should have 10 rows
while MTL+ should have 16 rows.

v5->v6
- add Bspec (Suraj)

v3->v4
- remove unnecessary init of VS/PE-O metadata (Suraj)
- add helper for computing number of rows (Suraj)
- fix num_rows's type (Jani, Suraj)
- declare num_rows (Suraj)

Bspec: 68963
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c         | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_display_core.h |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index ece4df4a9d62a..06a8dd7581bb8 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2205,6 +2205,11 @@ parse_compression_parameters(struct intel_display *display)
 	}
 }
 
+static int vswing_preemph_num_rows(struct intel_display *display)
+{
+	return DISPLAY_VER(display) >= 14 ? 16 : 10;
+}
+
 static void
 parse_vswing_preemph_override(struct intel_display *display)
 {
@@ -2218,6 +2223,11 @@ parse_vswing_preemph_override(struct intel_display *display)
 	/* pre-ICL GOPs don't have VBT #57 */
 	if (!block)
 		return;
+
+	display->vbt.vspeo.tables = block->tables;
+	display->vbt.vspeo.num_tables = block->num_tables;
+	display->vbt.vspeo.num_columns = block->num_columns;
+	display->vbt.vspeo.num_rows = vswing_preemph_num_rows(display);
 }
 
 static u8 translate_iboost(struct intel_display *display, u8 val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 7e988b7b1fe7a..c80b4a2f74f9e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -244,6 +244,13 @@ struct intel_vbt_data {
 	struct list_head display_devices;
 	struct list_head bdb_blocks;
 
+	struct {
+		const u32 *tables;
+		int num_tables;
+		int num_columns;
+		int num_rows;
+	} vspeo;
+
 	struct sdvo_device_mapping {
 		u8 initialized;
 		u8 dvo_port;
-- 
2.45.2

