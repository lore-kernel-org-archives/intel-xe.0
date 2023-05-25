Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5243C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6565710E782;
	Thu, 25 May 2023 21:35:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E2710E78C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zwp22fLXbOpIEh0eH0ij5m21WUcNmIrTWTYxH0fIfvo=;
 b=RAzaRA3wblENmBVIliFcAIrsv+/rPdVQ6UJl7v9K3W0OFOKAhBlQ+Em4
 uaBi4oyhPlbNbuIJSp81PWhHxi0k2i8lfD+me+3Ibconto1hOqTlAmePV
 j1arimlvSBIINCAL6R8k+5dkgMjFXReC7QUZ2wRJYrOb8jRz0pnBmwa05
 kXKeBRtqks1Ycv7+o5RMDa83bqKHS9Lv/O3JC8w5cxKeAuDV6LerqFDpI
 LRZKrUqSVGNEFlel9+LeVvXUV7D6iZhqrvHdpV5wgNbdr9I5hS6DhyCQB
 DXj+LaYKnrnDpACg6wI3ljBOcRLVfY3PDyAYBvz0hSv6iNbArntGfKvZz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377921"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970784"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970784"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:07 -0700
Message-Id: <20230525213407.3907094-22-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 21/21] drm/xe/guc: Port Wa_14014475959 to
 xe_wa and fix it
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Port Wa_14014475959 to xe_wa fixing its condition. The workaround should
only be applied on the primary GT, not on media. So just checking by
MTL platform is not enough: checking GT is of the right type is also
needed.

Since the GRAPHICS_STEP() does checks the GT type, we could leave the
first check as a platform one: it'd would be easier to understand and
not go out of sync with the graphics_ip_map[] in
drivers/gpu/drm/xe/xe_pci.c. However it also means that new platforms
using the same IP wouldn't match. Prefer using the IP version.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 4 +---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ed460d3b6ca..ecc843d91f62 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -142,9 +142,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 16011759253))
 		flags |= GUC_WA_GAM_CREDITS;
 
-	/* Wa_14014475959 */
-	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
-	    xe->info.platform == XE_DG2)
+	if (XE_WA(gt, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
 	if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index fc9846af460c..c58f3eb3e993 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,5 +1,7 @@
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
 16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
+14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
+		PLATFORM(DG2)
 22011391025	PLATFORM(DG2)
 14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
 16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
-- 
2.40.1

