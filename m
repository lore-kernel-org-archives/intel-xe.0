Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6FACD6E72
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 23:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D32A11246D;
	Wed,  3 Jun 2026 23:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMCeOnMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A29411246A;
 Wed,  3 Jun 2026 23:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780527958; x=1812063958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/QUOIOAolo/OLGR+ywMrT2nOPCdar9t8G4NxN4kTVA=;
 b=MMCeOnMBE++dnjTiKsKDkh7WJ3YAzMImAwjM+BvgtKratTSvhL/KUH6R
 OVer/UfaK6viHmXWRVjMc+NlR2qjXSumx8ct8RPdMiCEBeWjjahkrh2VM
 DXi3YOE5sYSI+AxLWBLt0pDzwOIORMkG0aWJTjjRrBYJlwON9720wEvum
 lgErXbo/Y1ONsRCHLmEXSc3L3zWryDD6Jpktt1EdL3uL7QVt5GQvjVedj
 57Ea7czrcYeh0FWbld9OrEBmpn0kOgORLvxlHsfjL4NcWMSAbBLh1o4se
 sWZi9Cle4xmkVD9O7uXllljbB7Xu+jya1iKEn4Ab8ldoth+4ecFEOYWmJ w==;
X-CSE-ConnectionGUID: e0KO84V5Tty/ERBfBMaNsQ==
X-CSE-MsgGUID: DSJ0nXpERUaQMrD+nmVlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104013968"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="104013968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 16:05:58 -0700
X-CSE-ConnectionGUID: yLB8sxP1SrS/Bx0DYpUfhg==
X-CSE-MsgGUID: lMGKMUrETBitBOnSwEbdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244223627"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 16:05:56 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v6 1/8] drm/i915/bios: search for VBT #57 by default
Date: Thu,  4 Jun 2026 01:05:37 +0200
Message-ID: <20260603230544.1993439-2-michal.grzelak@intel.com>
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

Start searching for Vswing / Preemphasis Override Block during VBT
parsing at init_bdb_blocks().

Check for failure since pre-ICL GOPs do not contain the block. Check
also if VBT version is appropriately up-to-date.

Issue a debug message when port requests to override VS/PE and parsing
VBT #57 for the platform has not yet been implemented.

v3->v4
- add Bspec (Suraj)

Bspec: 32063
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b6fe87c29aa7c..420b09b4d01ef 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -200,6 +200,8 @@ static const struct {
 	  .min_size = sizeof(struct bdb_mipi_sequence) },
 	{ .section_id = BDB_COMPRESSION_PARAMETERS,
 	  .min_size = sizeof(struct bdb_compression_parameters), },
+	{ .section_id = BDB_VSWING_PREEMPH,
+	  .min_size = sizeof(struct bdb_vswing_preemph), },
 	{ .section_id = BDB_GENERIC_DTD,
 	  .min_size = sizeof(struct bdb_generic_dtd), },
 };
@@ -2183,6 +2185,23 @@ parse_compression_parameters(struct intel_display *display)
 	}
 }
 
+static void
+parse_vswing_preemph_override(struct intel_display *display)
+{
+	const struct bdb_vswing_preemph *block;
+
+	if (display->vbt.version < 218)
+		return;
+
+	block = bdb_find_section(display, BDB_VSWING_PREEMPH);
+
+	/* pre-ICL GOPs don't have VBT #57 */
+	if (!block)
+		return;
+
+	drm_dbg_kms(display->drm, "valid VS/PE-O request but not yet supported\n");
+}
+
 static u8 translate_iboost(struct intel_display *display, u8 val)
 {
 	static const u8 mapping[] = { 1, 3, 7 }; /* See VBT spec */
@@ -3274,6 +3293,7 @@ void intel_bios_init(struct intel_display *display)
 
 	/* Depends on child device list */
 	parse_compression_parameters(display);
+	parse_vswing_preemph_override(display);
 
 out:
 	if (!vbt) {
-- 
2.45.2

