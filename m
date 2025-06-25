Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E5DC7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035F110E7EA;
	Wed, 25 Jun 2025 19:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mN/M8iRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8255D10E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750880029; x=1782416029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbKCdAuRyDMv4OxC5gAIadCTcjWIdMyzahPo3DzumWE=;
 b=mN/M8iRDOWCDTMJW4hQv+k2IBXQ1cRIQhcvUtYb84/sbay9Pv3zpuAhi
 gixmNPDkmXeyG2ERrgO9oVj31fEoAJkpg/9C/t5fRSkXHUJZ+oXY5nfgf
 1IJAVUx6EKZR0EvDJqxXMoIoRlSdRFsfbsInB4vQ8Fu3ihFCqcrpRccTu
 ly0wK9amEyNEZ2XLKERXWDzcxq8CSEvHs4CY+T7F46cLVy97Iq0yQFz+m
 ENCROswlLq3E3szwVbTJ6z9eOJ52wsU6sUNpjSpmMUdbpHyO3FrAWQCz/
 V5rEx2WygFun/F2nSjlwAxbmL+0XPmnSn1PyggIAHzcNd29QBpYym5Fwy g==;
X-CSE-ConnectionGUID: d5m2VeQ0Stm4N3pIPb1nwg==
X-CSE-MsgGUID: M4k2VOM7RSuSbRK7zqllQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53305193"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53305193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:48 -0700
X-CSE-ConnectionGUID: rLYTXC9eS12GlOvCKf5tig==
X-CSE-MsgGUID: je5lTeRMS9WCwDSf8Z7cjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156697212"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:49 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3 5/5] drm/xe: disable wa_15015404425 for PTL B0
Date: Wed, 25 Jun 2025 12:33:40 -0700
Message-ID: <20250625193340.38971-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625193340.38971-1-matthew.s.atwood@intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
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
v3: rebase

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        | 7 +++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 2 files changed, 9 insertions(+)

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
index 96cc33da0fb5..255e67113406 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,3 +70,5 @@ no_media_l3	MEDIA_VERSION(3000)
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
+
+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
-- 
2.49.0

