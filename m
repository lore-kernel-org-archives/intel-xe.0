Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE42CE7545D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 18:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D09910E314;
	Tue,  3 Oct 2023 18:09:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A0510E311
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696356558; x=1727892558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4t7yxA4f91RdbUPTJOFmi2bfpb30TNqZ7+Uei4n1CI=;
 b=Zzox6Pe5L2MWmPE2UzUi4eQ4WMs+qtKhbZ5J9zjlzTzygLfCwCpNxe5/
 X8yJGpWBOkqSS0iRZm49tGISa1mPkHhx8ZwoH8GjTaOiFXGRmOq4O6u+z
 n7Z8yGCeqGt1Ws5zTLyrqTr6QplRUnD9qKqMcQ85vw03tAszosgfS1yWj
 ca+qT2uw39N0JXDlshh6akETM4U8N6tsTcAGzqqqF2YP5yIcjlaE2rWXS
 VH9xmtLHwykkJ8D2IMGRH6q5FyIVZY31uDn4nrREZwHxWmjIMSXosKQBY
 j2gEkLzYuf2+qtlG43oIZ1wYAA3ATuBjWbJ5VsQb4LlEXgnCYXVijOXlB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386813751"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="386813751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="866977604"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="866977604"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, francois.dugast@intel.com,
 jose.souza@intel.com
Date: Tue,  3 Oct 2023 11:09:08 -0700
Message-Id: <20231003180909.3241390-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
References: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe: Set the correct type for
 xe_to_user_engine_class
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

User engine class is of type u16. Set the same type for the array used to
map xe engines to user engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e0c2203e428e..cbccd5c3dbc8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const enum xe_engine_class xe_to_user_engine_class[] = {
+static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-- 
2.38.1

