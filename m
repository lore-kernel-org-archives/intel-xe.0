Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72FFC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 21:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319910E50D;
	Wed,  7 Aug 2024 21:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dA5skgVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280CF10E50D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723065077; x=1754601077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tuEjiI1ys/rsKcSLW+vaSGHX9LtrSVfxJOiHib6Zp88=;
 b=dA5skgVVGr9USkG2hhlH5LkmQ94pTyYYUQp9V30yshrv7/ZAY3ARH5c/
 SYq9htnGgvSICMaePkgKw4VfcSvsKCvQvKu4kZ5KasIugN9u03Up3mLKv
 aWWwPsjKOpWY7FAskSmELFq/CI5JzScpIegckhwufn4YnN+MnBEa+RFKd
 4Wxg6VxjiXTbAxJpD/1iBYPgZWC1a3BDw+JV/0mfdhkywfA6YJJgiu09d
 OgbenkO7HPWfOCMA22wrtPu1cRdXfojP5GkiBh5USu4VoWXSg8fdR+8XY
 E7bTczPPP5M/AIvkJL5DS4p/Agjbjcs9gF8zCC3qyuI0bTJJC19Ees8y0 w==;
X-CSE-ConnectionGUID: RJe0hdSOT6esMBrTcZsL6Q==
X-CSE-MsgGUID: Tsrqt9XVRDqK36pC9y3uFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31832836"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31832836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:11:16 -0700
X-CSE-ConnectionGUID: mCTXzt/RRnOskqL1Yw4Kpw==
X-CSE-MsgGUID: cZIVeIVWTfW+DS7Jj2Neqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61817896"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:11:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: fix WA 14018094691
Date: Wed,  7 Aug 2024 14:11:05 -0700
Message-ID: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

This WA is applied while initializing the media GT, but it is currently
defined as a primary GT WA (because it modifies a register on the
primary GT), so the XE_WA macro is returning false even when the WA
should be applied.
Since both GTs are involved in the flow, fix this by marking the WA as
applying to the platform instead of just the specific GT.

Note that this WA only applies to PXP and we don't yet support that in
Xe, so there are no negative effects to this bug, which is why we didn't
see any errors in testing.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..40354fb01737 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,7 +19,7 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
-14018094691	GRAPHICS_VERSION(2004)
+14018094691	PLATFORM(LUNARLAKE)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-- 
2.43.0

