Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1814C48298
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B74810E2D1;
	Fri,  2 Feb 2024 20:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auf2QGOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A63F10E1B7
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706904181; x=1738440181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gdgX0gp6uRex9smXwciUStlwMEmu6WJ8smfPIFBview=;
 b=auf2QGOIvkGGu3ZG+/mAyOsL+flnGMiq1m8/4PFMOdCGran6mtjvmbSl
 mGx7e4Nq/gPSZXMlG5KJRadZ4+7e6HsAv7kolpTTbhpc8MZekpjckg7J8
 8LNK5YW5z1KH/NlWKPLjIyjFI924lQKGqvE7O3esf1Zb3gHep7xwW7hQj
 WoCg/Z128+gopDJAYO6f0wvh+jpv90XsR5vup6gSbDG9RyR8GtGlFcftB
 /Tb6pd0jRN718oLx8rz9dxxaUtWr/4yWDIDsWkDpM3j4vbQibZWKFTHxb
 GRbP3cXWLU3UVGHcqQuzJZNk8qQKRevTkZ/vO6Cuz7PuXRwhhNJzuCEV0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3188624"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3188624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 12:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="439133"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2024 12:03:00 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/6] drm/xe/guc: Update to GuC firmware 70.19.2
Date: Fri,  2 Feb 2024 12:00:15 -0800
Message-ID: <20240202200017.2133438-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

API compatibility version: 1.8.2

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d3f0fe2101a7..d896c98dd0bb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -103,14 +103,14 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.43.0

