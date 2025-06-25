Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC6C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 18:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A83D10E7B6;
	Wed, 25 Jun 2025 18:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OL/BFhFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B79010E236
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750874898; x=1782410898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9z1JxGiBhRiXzn7MCBDGOTWHLL3eVZUYprUkr3VnEeo=;
 b=OL/BFhFPwEwoRpjuqxWKqo0YYY31/7yKqNHB5MDGj6sEcnoWqd2OfX71
 IsQj4oRmHMyaEh1QldWz7vmq/NK0quoplfycxS08l0myMRaQo6nn73+Wc
 faEAXYhikq4evCOiBod4RUojnGs2smo8kvzw8iaAlIEMIyL6MJEbUrGuR
 wAWfIlmrJRSB0+zlY4IWwjPfRQ0F3S2e7pIcg/zE+b3oKDplcnqfET5NE
 6Zqhp8NYlSCHuja3rVer/wQrKra9JRekB4e5wp1hALV5vgkmkw1qvpVFS
 mncrGbmweeFNm8H4Y+le12xbg65KvLY57akLTLDOecPRDMipf3mS33rZJ g==;
X-CSE-ConnectionGUID: VEo21EuzT/ODp93PXGlElQ==
X-CSE-MsgGUID: D0YvHi6qTeGT4Eap31KVDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53293590"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53293590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:18 -0700
X-CSE-ConnectionGUID: I1VXaHiTSbSuBms+/G/2+A==
X-CSE-MsgGUID: OWGg9lYSTh2osDOFDMS3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="175941849"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:18 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 5/5] drm/xe: disable wa_15015404425 for PTL B0
Date: Wed, 25 Jun 2025 11:08:11 -0700
Message-ID: <20250625180811.17112-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625180811.17112-1-matthew.s.atwood@intel.com>
References: <20250625180811.17112-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
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

This workaround only applies to PTL Compute Die A0. The reality of
modern platforms is we're Multi Chip Packages with logic spread across
multiple dies. Because this information is not available during PCI
probe it becomes a bit more complicated.

This workaround needs to be applied on PTL until we prove that we are
not Compute Die A0 stepping without reading any MMIOs. So use the new
XE_DEVICE_WA infrastructure to apply early, until we can determine our
stepping.

There are at least two ways to determine Compute Die stepping. This
patch uses the Media GT stepping to map to Compute Die stepping, in this
case Compute and Media dies step synchronously.

Since we're using the Media GT information to determine Compute Die
stepping, use the XE_WA and the oob infrastructure to come back and
toggle the workaround off when we know its safe, and after GT init.

v2: rename SoC to device, avoid null pointer dereference, update commit
message.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        | 7 +++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a9f708608f3e..a294a1b26d8f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -34,6 +34,9 @@
 #include "xe_tile.h"
 #include "xe_wa.h"
 
+#include "generated/xe_wa_oob.h"
+#include "generated/xe_device_wa_oob.h"
+
 enum toggle_d3cold {
 	D3COLD_DISABLE,
 	D3COLD_ENABLE,
@@ -896,6 +899,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (xe->tiles->media_gt != NULL &&
+	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
+		xe->oob[XE_DEVICE_WA_OOB_15015404425] = 0;
+
 	return 0;
 
 err_driver_cleanup:
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 8c2aa48cb33a..822cbff13819 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
 16026007364 	MEDIA_VERSION(3000)
+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
-- 
2.49.0

