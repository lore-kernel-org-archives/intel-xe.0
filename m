Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA08C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 19:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F69510E517;
	Wed, 10 May 2023 19:54:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28D310E512
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683748488; x=1715284488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4/h/Qm5j27/GVSW+9g5vj61hpnl4TOwuB53V+yJLPk=;
 b=KrgezHx8bmJOtJuQyye1bRJXbYu/01gzLPtVS5xI1BAq6O1MyRdezOu0
 BYxRpk//o9ITmTSqPZt7PbLFOTtHbOwZ/0Kph3K2GcrcfUL1Va+YQCysC
 JlsfxC4BIuZ82HTPU6x7j15WLP1LgiOvBj6VgGTcOiO3WLERwwik8JCVV
 s7S2jjYJYbfHN75zCclhrq8cUZDm4Mr5IBAVPBQjJky1UPAPPxAI04FPy
 WDY2hCQ8+Tbb4IxuGpF3sb91Dm3/vhvKPMxza0jOYyp8us7XFDXJE0JsF
 bONK7Y1MLw6BTLmmP1FwLP07sx1f4O4u46O7pWBgexQVxpz9WIluNrUE6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350336274"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="350336274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730056888"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730056888"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 12:54:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 12:54:22 -0700
Message-Id: <20230510195424.3045127-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510195424.3045127-1-lucas.demarchi@intel.com>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Annotate desc of platforms with
 display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some platforms don't have the display IP. Currently those are PVC and
ATS-M. For PVC the current initialization order works as the display
initialization can check by platform. However the display side can't
differentiate ATS-M from DG2 to act accordingly.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a6858fc7fe8d..7dfbc4fa138a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -52,6 +52,8 @@ struct xe_device_desc {
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
+	u8 has_display:1;
+
 	/*
 	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
 	 * already determine that from the graphics IP version.  This flag
@@ -179,7 +181,8 @@ static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_TIGERLAKE),
-	.has_llc = 1,
+	.has_display = true,
+	.has_llc = true,
 	.require_force_probe = true,
 };
 
@@ -187,6 +190,7 @@ static const struct xe_device_desc rkl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ROCKETLAKE),
+	.has_display = true,
 	.require_force_probe = true,
 };
 
@@ -194,7 +198,8 @@ static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_S),
-	.has_llc = 1,
+	.has_display = true,
+	.has_llc = true,
 	.require_force_probe = true,
 };
 
@@ -204,7 +209,8 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_P),
-	.has_llc = 1,
+	.has_display = true,
+	.has_llc = true,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
@@ -220,6 +226,7 @@ static const struct xe_device_desc dg1_desc = {
 	.media = &media_xem,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
+	.has_display = true,
 	.require_force_probe = true,
 };
 
@@ -244,6 +251,7 @@ static const struct xe_device_desc ats_m_desc = {
 	.require_force_probe = true,
 
 	DG2_FEATURES,
+	.has_display = false,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -252,6 +260,7 @@ static const struct xe_device_desc dg2_desc = {
 	.require_force_probe = true,
 
 	DG2_FEATURES,
+	.has_display = true,
 };
 
 static const struct xe_gt_desc pvc_gts[] = {
@@ -267,6 +276,7 @@ static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
+	.has_display = false,
 	.require_force_probe = true,
 	.extra_gts = pvc_gts,
 };
@@ -284,6 +294,7 @@ static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
+	.has_display = true,
 	.extra_gts = xelpmp_gts,
 };
 
-- 
2.40.1

