Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E879EE4998
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DB310E0E8;
	Fri, 18 Aug 2023 22:08:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7FB10E0E8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtOIHK5Q7h/uN0J6++tYeZjFmoLSMGEyPWCWhkT3BQ0=;
 b=BvOf9JqzN21h62b2/7mcnaGCTlYNxXp7nu6UKssm325VxWrmHthyPt3x
 GxfalluLg1pFkmtWUlHyy6cg0oow9z9LG1eBPQY2X9J3n0keuWbcASB7f
 K2dOEXWfhKZ2onZGP6Mbo8HrsMLvG34Y91nTZmQzXQrpYMi6CdKObtqwx
 oBi/oUGdtrsIiGi0UtdmjOxq6HE25+PorCz2k6fnHI9t3xKMU+79AdMLJ
 vHvcrdBoG5KPxuw5wgCoSarroDlFRC8ZPmjCC2tQI3pN9b3kDKAtxwLqj
 p8pu2k0FpGgZ5TjZOi/uAyaWF46zRwElKORSqK88TX+zMz+dXN6529lqP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592982"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758176"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758176"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:10 -0700
Message-Id: <20230818220824.700519-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/15] drm/xe/xe2: Update render/compute
 context image sizes
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

From: Matt Roper <matthew.d.roper@intel.com>

The render and compute context are significantly smaller on Xe2 than on
previous platforms.

Registers:
 - Render:  3008 dwords -> 12032 bytes -> round to 3 pages
 - Compute: 1424 dwords ->  5696 bytes -> round to 2 pages

We also allocate one additional page for the HWSP, so the total
allocation sizes for render and compute are 4 and 3 pages respectively.

Bspec: 65182, 56578, 55793
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 7a7fdcdadf37..7c15c55964a8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -37,9 +37,16 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
 {
 	switch (class) {
 	case XE_ENGINE_CLASS_RENDER:
+		if (GRAPHICS_VER(xe) >= 20)
+			return 4 * SZ_4K;
+		else
+			return 14 * SZ_4K;
 	case XE_ENGINE_CLASS_COMPUTE:
 		/* 14 pages since graphics_ver == 11 */
-		return 14 * SZ_4K;
+		if (GRAPHICS_VER(xe) >= 20)
+			return 3 * SZ_4K;
+		else
+			return 14 * SZ_4K;
 	default:
 		WARN(1, "Unknown engine class: %d", class);
 		fallthrough;
-- 
2.40.1

