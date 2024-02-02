Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F891C47258
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 07:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD48010EC45;
	Fri,  2 Feb 2024 07:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMRZavPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DC510EB60
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706859214; x=1738395214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ag+3hYUClAosfp9Htgql0gmmao4oD1KXrzj4kM9dcfw=;
 b=IMRZavPuv1MaQjhQ17XfUO9MHTfwVgSC96P9DmPGAmo1+KX+dsPqk+Ti
 casXt5wsiMb26WN0lfMX4CBUumqK+eVqT612wlTaZiGI1XPh+aE8icXjH
 duiLOzB1dOjVfczo5EJtTvts0tMoxzY+LPNMjAoOs3YrBOI9J0oh+oeiH
 B/Viu4nEUnzCly/QGRhOLHhcS0phi7cOYmZ33Fz6EiQiOIT+bfY1ilMoc
 fkUXvRpldPvGRg+jck7qdGyPBN01KFN6fqJyVm0ju4yMG3JJ1TfzrJQnk
 veCmAy6QphePd9SXtn/oXqU0DdlbSqM7mw8FfQUf9p7abtkLqtjkXGVNg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3026071"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="3026071"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 23:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4634272"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 23:33:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Update to GuC firmware 70.19.2
Date: Thu,  1 Feb 2024 23:30:49 -0800
Message-ID: <20240202073050.1986142-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
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

