Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96C3CD342C
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D42B10EF6A;
	Thu,  7 May 2026 01:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn9EfkmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2376710EF6B;
 Thu,  7 May 2026 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117556; x=1809653556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKIY8gpYQ+xkHXiu6za78ife2ZM6h/v7TwgRQriUEmM=;
 b=Nn9EfkmEsiwfi3ESTNCe9mtwj0b/7OTY57nbygZUWCz9PGUJ8WrILkvW
 DdTMBIislxtH53k4zn+E0QtavN3DLFCtUmrK/DxyhL+L8JS0pJffTWFQv
 wqGyGzBrKH65M2cULyK0018Ac0k2NOB3enRnlWky/m7PHCyjU41j79gXC
 u/sL8I+kfjE6Utwt2ZbvJ2VqteAsESGXrBuk91cCoRl6s592pHXOutam2
 aXthdS218NmPbw81Rm8TtI4ny55E5oLi+vJBxQFvAgcP8p6yex8gUaskK
 BLnqYQM2jVO/CgiOuKEvLXTOsuRgJqhQFJS5rz7iXGiDMxJwhdpimD9c5 Q==;
X-CSE-ConnectionGUID: 2tqwGaZLQUqmeeRTc/Ipzg==
X-CSE-MsgGUID: KdBgZLhjRXOOvrwOHg1hUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089065"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:36 -0700
X-CSE-ConnectionGUID: 1sVz3Mb2QZWvZlxVPXMbtg==
X-CSE-MsgGUID: cNDFqqx3Qp2p4L2W89xJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692900"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:35 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 29/31] drm/i915/bios: parse JSL's VS/PE-O tables
Date: Thu,  7 May 2026 03:31:35 +0200
Message-ID: <20260507013137.527510-30-michal.grzelak@intel.com>
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

JSL's VS/PE-O tables' layout is identical to EHL's. Parse it same way.

Add JSL to workaround for availability of VS/PE-O parsing.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 9138ec64b6b1c..22bbc659e24e3 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2289,10 +2289,12 @@ parse_vswing_preemph_override(struct intel_display *display)
 	} else if (DISPLAY_VER(display) >= 14) {
 		parse_vswing_preemph_snps(bufs_mtrx, block);
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.elkhartlake)
+		if (display->platform.elkhartlake ||
+		    display->platform.jasperlake) {
 			parse_vswing_preemph_icl(bufs_mtrx, block);
-		else
+		} else {
 			drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
+		}
 	} else {
 		drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
 	}
@@ -2758,8 +2760,10 @@ static void override_vswing_preemph(struct intel_bios_encoder_data *devdata)
 	} else if (DISPLAY_VER(display) >= 14) {
 		parseable = true;
 	} else if (DISPLAY_VER(display) == 11) {
-		if (display->platform.elkhartlake)
+		if (display->platform.elkhartlake ||
+		    display->platform.jasperlake) {
 			parseable = true;
+		}
 	}
 
 	if (!parseable)
-- 
2.45.2

