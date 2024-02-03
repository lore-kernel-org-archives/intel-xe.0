Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E1C4828F
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18D610E8CF;
	Sat,  3 Feb 2024 06:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gywIMceA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864E510E8CF
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706941144; x=1738477144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6sDrXUdx2XSj57qqvtxHE8FkzH3kk5b0/AsUQ/TXSgQ=;
 b=gywIMceAeVazEOWFMDpx8mcmuBG7NxdujPsImBhYEapztGpLRDx25guC
 oGLQ4/TRsuFS71DGbkUt8OK6c+UZISDAL12qN4twh0zIEVrW03LsiOdJs
 TMlhABfAG6I5YUHL4gcBmsYsR3Kxg3isLbG2TM/f3fsci4sg4YzPD+Nms
 2nhYbZkndmy6IigyvSUbaqFR70cAeRtJzpy3de9EqdM8vMQXaXhJ2FfX9
 r94iABBGj5Fe01OhckalM4WMvh7Nia/ek8/CLjStuSqv2Am6z9vKTSfWY
 XS686m9vysORZrItox1vRsF2Lv+8oH2EN6WzBwMQzP07tPcPWGimYiChL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4104080"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4104080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4872325"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:19:03 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, joonas.lahtinen@linux.intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Date: Sat,  3 Feb 2024 07:05:34 +0100
Message-ID: <20240203060534.6839-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240203060534.6839-1-nirmoy.das@intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
expose various capabilities of each engines.

Add wmtp as engine capability which is retrieve from
GT info.

Take a field from the reserved for that purpose.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 +++++
 include/uapi/drm/xe_drm.h     | 6 ++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7e924faeeea0..10981b46c56f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
 			engines->engines[i].instance.pad = 0;
 			memset(engines->engines[i].reserved, 0,
 			       sizeof(engines->engines[i].reserved));
+			if (gt->info.has_wmtp &&
+			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
+			     hwe->class == XE_ENGINE_CLASS_RENDER))
+				engines->engines[i].capabilities |=
+					DRM_XE_ENGINE_CAPABILITY_WMTP;
 
 			i++;
 		}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..5dac079e64de 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
 struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-
+#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)
+	/** @capabilities: Capabilities of this engine. */
+	__u64 capabilities;
 	/** @reserved: Reserved */
-	__u64 reserved[3];
+	__u64 reserved[2];
 };
 
 /**
-- 
2.42.0

