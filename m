Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E74CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1FA10EF26;
	Thu,  7 May 2026 01:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3pmparS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4870610EF26;
 Thu,  7 May 2026 01:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117513; x=1809653513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZ8KmPOVks77DEs3AnKY+VHpKb0vWS0YIJ/GOFaqdTM=;
 b=A3pmparSssgyUhc3cKCZfFNjIn2DT2ukLajs+D82ZzqIij4dT4qw4qmS
 zjp+sSq5bybYiesxSkSoAIEGMklrVB1Drno5W2lAgGgEO3NmSCrWxOvSe
 FgcAaCsTL7SI/8kPqZpwrGjEhHljsM+IIKEA/eUzE7Mm3xgPoxj9rNyb4
 GkqilAQgA0E8gyQUoWOE48e5/cUSXAp9+HKZg1m2UqORAmLjjC5NFTTOH
 T5VFsp6PxakXMq0FtkDrDKpEeEf0m2PIao8Dg+r7fPFgLchGV/K4ldP1m
 mVUiyhZokdMfLc/ncafxskE8K/feJWDb/eRiVUZh2JRj6V8oHzTy4g8pg Q==;
X-CSE-ConnectionGUID: S4PzWh4gQEmYGvQD/VFOhg==
X-CSE-MsgGUID: ooTt+nk9QuuxqAOsXi157A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089018"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:31:53 -0700
X-CSE-ConnectionGUID: sc4axW0/TCK+rSchDSxs0A==
X-CSE-MsgGUID: nqC6neLNT1CriJesvjy83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692735"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:31:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 03/31] drm/i915/bios: log unsupported VS/PE-O parsing
Date: Thu,  7 May 2026 03:31:09 +0200
Message-ID: <20260507013137.527510-4-michal.grzelak@intel.com>
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

Search for VBT #57. Check for failure since pre-ICL GOPs do not contain
the block. Check also if VBT version is appropriately up-to-date.

Issue a debug message when port requests to override VS/PE and parsing
VBT #57 for the platform has not yet been implemented.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 5700de438fdfd..3f9e4d31c7375 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2185,6 +2185,23 @@ parse_compression_parameters(struct intel_display *display)
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
+	/* pre-ICL GOP don't have VBT #57 */
+	if (!block)
+		return;
+
+	drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
+}
+
 static u8 translate_iboost(struct intel_display *display, u8 val)
 {
 	static const u8 mapping[] = { 1, 3, 7 }; /* See VBT spec */
@@ -3276,6 +3293,7 @@ void intel_bios_init(struct intel_display *display)
 
 	/* Depends on child device list */
 	parse_compression_parameters(display);
+	parse_vswing_preemph_override(display);
 
 out:
 	if (!vbt) {
-- 
2.45.2

