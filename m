Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F2DC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883CF10E2A2;
	Wed, 19 Jun 2024 21:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4FJxpxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08110E29B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833590; x=1750369590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j739fbJOqJWvLygvN2GmSf+ZBuX1OlYUe3bZ+WLMXwM=;
 b=C4FJxpxAZGLdF2mUZimQAbkuMUSbbiUJ5Ky7h0GrbYyCVuRgjHp7Joh3
 +DF+lVa90ZVhXmCkBK4bBeYrAjYgvk3XABbUEwEs7TmrzW82JQ4kJ03Q/
 CY5Y22dATAOFKE/OSgaWRH1K+Uxo97zTMYh+3rifVB/azM6vgfSTE5Ch0
 kuMjzs0ixq/aDelJIMqo17PnH26MVkVaFAxywtVOjKZ4jmBdlt/GVK9Ze
 i3QQf4aySjXFXwcSNa74ce98tRZhB/JBnjQyFik/cOB81Wij8hbb0XKXv
 q2jTQn5JaPrj90yhMkDDPQxD1vI/b0MEiUYu3mihmkVLVVFIodXx6c8OX Q==;
X-CSE-ConnectionGUID: dgNmq0gVQ9itYv2sllgejQ==
X-CSE-MsgGUID: oYWO+LBDSU23Neh40PYXCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662977"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:30 -0700
X-CSE-ConnectionGUID: TOdx+CRuSI6GcTq5El7A0w==
X-CSE-MsgGUID: Jrfa4TKdQW+sJN+fQZhPpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157806"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/xe/vf: Don't apply tile workarounds if VF
Date: Wed, 19 Jun 2024 23:45:51 +0200
Message-Id: <20240619214557.905-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

The VF drivers can't apply any workarounds as they don't have
access to related registers. Since xe_wa_apply_tile_workarounds()
function is not using RTP yet, we have to add early return.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 0b6fbbebc41e..73dd06ad50f8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -21,6 +21,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
+#include "xe_sriov.h"
 #include "xe_step.h"
 
 /**
@@ -865,6 +866,9 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 {
 	struct xe_gt *mmio = tile->primary_gt;
 
+	if (IS_SRIOV_VF(tile->xe))
+		return;
+
 	if (XE_WA(mmio, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
-- 
2.43.0

