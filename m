Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DF8CD6E4C
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9311246D;
	Fri, 29 May 2026 19:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OENnBm2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4686112463;
 Fri, 29 May 2026 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780082959; x=1811618959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W3WB9Neo6zWdrCdq4qqVyakoSDVTNLLyzBtbXCDCVV4=;
 b=OENnBm2ig/xskfiVL9IwZcAqoZTcIt8lmTsoXhLshYtwhzMlocpmo4bh
 PgmGbYZlUVdMCB7XlAPlv/jmcZCOR38ut9fK0uP6Fxd/zrv7iht//YWSL
 TC3806p4/5S0qQF+2RsvHW6rdt2TJWHNDjKgbrsSnfrPNjcUljOyBh7iG
 3nhvIO3ziBPYEQ80K0t3KGv6XBXDVhNNfVtTU91ksHmZeUYwqP2i++1fp
 G4PGmDoPcTXFt0bh86RXIfahmFsuEG5oHhJLPsDwK4tYKy+ccT5SYulWD
 81xUFrfs5H6Elymivy85+AlxmAAA5IqyNDZC2Zap1MlbWlNjfZrfFbSPT A==;
X-CSE-ConnectionGUID: LH4zIZBBRzmeZfre2P8l9Q==
X-CSE-MsgGUID: /ZMEyvEGRwmw1G5YBZfQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="103611795"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="103611795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:29:18 -0700
X-CSE-ConnectionGUID: BDrbKspwTLOtD2YDEKTRhQ==
X-CSE-MsgGUID: SQT/WeLUQvqQpCNfzybyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240393481"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 12:29:17 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 03/10] drm/i915/bios: structurize VS/PE-O metadata
Date: Fri, 29 May 2026 21:28:52 +0200
Message-ID: <20260529192859.4172376-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529192859.4172376-1-michal.grzelak@intel.com>
References: <20260529192859.4172376-1-michal.grzelak@intel.com>
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

Store all VS/PE-O relevant metadata inside anonymous struct in
intel_vbt_data.

Name the field as vspeo: an abomination from VS/PE-O, which in turn
could be expanded to VSwing / Pre-Emphasis Override.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c         |  8 ++++----
 drivers/gpu/drm/i915/display/intel_display_core.h | 10 ++++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 12275738299f..d071f0e5d438 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2204,10 +2204,10 @@ parse_vswing_preemph_override(struct intel_display *display)
 	if (!block)
 		return;
 
-	display->vbt.tables = block->tables;
-	display->vbt.num_tables = block->num_tables;
-	display->vbt.num_columns = block->num_columns;
-	display->vbt.num_rows = vswing_preemph_num_rows(display);
+	display->vbt.vspeo.tables = block->tables;
+	display->vbt.vspeo.num_tables = block->num_tables;
+	display->vbt.vspeo.num_columns = block->num_columns;
+	display->vbt.vspeo.num_rows = vswing_preemph_num_rows(display);
 }
 
 static u8 translate_iboost(struct intel_display *display, u8 val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index c0530a54abb6..061bf479458f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -242,10 +242,12 @@ struct intel_vbt_data {
 	struct list_head display_devices;
 	struct list_head bdb_blocks;
 
-	const u32 *tables;
-	int num_tables;
-	int num_columns;
-	int num_rows;
+	struct {
+		const u32 *tables;
+		int num_tables;
+		int num_columns;
+		int num_rows;
+	} vspeo;
 
 	struct sdvo_device_mapping {
 		u8 initialized;
-- 
2.45.2

