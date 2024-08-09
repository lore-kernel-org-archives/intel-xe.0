Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EDEC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 11:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3DB10E8C6;
	Fri,  9 Aug 2024 11:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cy/OPNcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7DF10E8C6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201416; x=1754737416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1hcLKsnbczn3GH1hswtBV8GYyZ2uIe9HkI3NRtLXrw=;
 b=Cy/OPNcPS7tIYIXbbUdeRZiB4zfv0xTSSospZJ17aWf7wGtXaLv5QphC
 SLPPHb27XJiCbCZchfGAicxmzkaUCn5QzsRUDMIM98h42P+auexpPlu6M
 i/zPi19vAN8cnOMVoHIX04n2ua7fOLOucXgvpbcvscApCJcb1q0Z0SsDc
 XZXg7+YCX65JGQ7mbn9qRuXMNtgHPPS/cFwrFOCGU8i30zuDC8GkroXmR
 cJkEKO9a4J9v6Mw74OVzsQo29xkQkHa5y+zUHdpFuejE/hd2p2qEUsK3C
 W1GSXNOgdR6L/ZZViBBGAoYrgJSzc1nHra+7jUToFsNu+m89apDcqQUns A==;
X-CSE-ConnectionGUID: UTfB7qsuQK66tG2o9wBl4w==
X-CSE-MsgGUID: bHyFnWKJQg+xRdJNgpNsIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21512428"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21512428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:36 -0700
X-CSE-ConnectionGUID: IZpLjXp9Q9+ea1HhaxahaQ==
X-CSE-MsgGUID: /0UEhGdkQWGjm3eqKT5FIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57494217"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:33 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Date: Fri,  9 Aug 2024 12:47:36 +0200
Message-ID: <20240809104736.10423-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240809104736.10423-1-nirmoy.das@intel.com>
References: <20240809104736.10423-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add capabilities to engine struct which can be used to
expose various capabilities of each engine.

Add wmtp as engine capability which is retrieve from
GT info.

Take a field from the reserved for that purpose.

v2: Use 32 bit for capabilities(Lucas).
    Only Expose Compute engine till there is user-case
    for Render engine(Joonas).
    Don't use BIT() for uAPI (Francois)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  4 ++++
 include/uapi/drm/xe_drm.h     | 12 ++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 73ef6e4c2dc9..005f4f2da3d9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -213,6 +213,10 @@ static int query_engines(struct xe_device *xe,
 			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id = gt->info.id;
+			if (gt->info.has_wmtp &&
+			    hwe->class == XE_ENGINE_CLASS_COMPUTE)
+				engines->engines[i].capabilities |=
+					DRM_XE_ENGINE_CAPABILITY_WMTP;
 
 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e..975666b6fe28 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -247,13 +247,21 @@ struct drm_xe_engine_class_instance {
 
 /**
  * struct drm_xe_engine - describe hardware engine
+ *
+ * The @capabilities can be:
+ *  - DRM_XE_ENGINE_CAPABILITY_WMTP - represents a engine's mid-thread
+ *  preemption capability.
  */
 struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-
+#define DRM_XE_ENGINE_CAPABILITY_WMTP		1
+	/** @capabilities: Capabilities of this engine. */
+	__u32 capabilities;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @reserved: Reserved */
-	__u64 reserved[3];
+	__u64 reserved[2];
 };
 
 /**
-- 
2.42.0

