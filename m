Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE741C5DF6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519310F40B;
	Thu, 13 Aug 2026 16:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deJ8JYoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED7410F3FC;
 Thu, 13 Aug 2026 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786637414; x=1818173414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6DZywVEYHDl8UIUMScKgNanTrnhti+XiOZRZG91nW4=;
 b=deJ8JYoilKrg35E5uKFSvxF1JCXD7lkx91jcLB1jhRxMPxJnFB1cF3mN
 WfGYvPIUN/Ho3mzSZpUajdQIJhUuUsXEonqzP/QqOfrgOS+/pg13EGfLV
 p5gH3LhbY9aKGfWBceP/+Mzw8El5W4KfKBz/Pjv/BUJrmhnouWXGcJPG3
 HkGGTZuA2I+CuHO8EaEZuxmJgMZeDfajIZPkRi5fewBIcdnXSA6ZY2MHH
 IukQvermVdta/BMQQX8bQXDGz3DDHOOeVm963h0yN52YnFTEkWB7huE0X
 N1jGUbEaRqk/bRTgRo4AcoMPCdzxjhoRdbJ1TsT0Yjv5KGPKWEsrc2RzA Q==;
X-CSE-ConnectionGUID: 14m2oJVURwyqKbKdEyWWlQ==
X-CSE-MsgGUID: ekCYzzIEQveptrHLTL3P9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97882431"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97882431"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:10:14 -0700
X-CSE-ConnectionGUID: qWuO44FlS4qy/4JH95Q0Xw==
X-CSE-MsgGUID: G8RpclYUTYqFkikKd05pYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260175378"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 09:10:12 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v11 2/8] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
Date: Thu, 13 Aug 2026 18:09:12 +0200
Message-ID: <20260813160918.918857-3-michal.grzelak@intel.com>
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

