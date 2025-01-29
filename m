Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D96C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 17:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CCE10E129;
	Wed, 29 Jan 2025 17:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxhLHcnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66010E129
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 17:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738173178; x=1769709178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pxU3C9dIJnD8yWQkRbF7JAShBfkauQPg74vNHGcF4No=;
 b=fxhLHcnZf3MXXQkI5tdiZK1H/alFrPROUHrIYtM8wplSPHVtsGDLDNCo
 X0UmzkiY3VSAh61AV/XU3dIi8c3fjbW2wM4OUAdS4j3N2YJ5QsKiczlkF
 CFFVNTSAuE4GHI6mVY61kzr42U1FBXKXRKoEAztX0f7LrSybeW9KCpFYa
 DcT96gXCSTgD6c4Uy+yW3vdNp384tM69sSngAVFg5A0oQY8CnyaxCx6rC
 Kr3I7zmDoi0d+fyorbbo9tX2UdcXFkYzeKOy27bhRiLDY793THfFWoXAD
 Ccgf9pXkaJOL0PPP9lnT5BiIRTUGIN+GSCbaYjgLbUemaMA0aGORbGWBP g==;
X-CSE-ConnectionGUID: t5gDZcvxStClRcw2pou6JQ==
X-CSE-MsgGUID: ed7As9xKRECmSPhvAZeuuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56127330"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56127330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:52:57 -0800
X-CSE-ConnectionGUID: VkMwZJ8PTtirbFeNVeFG1A==
X-CSE-MsgGUID: L+F0JtS5RbGfe3czhe6UtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113715729"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.2])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:52:56 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/gt_pagefault: Print engine class string
Date: Wed, 29 Jan 2025 18:52:41 +0100
Message-ID: <20250129175241.338043-1-francois.dugast@intel.com>
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

The engine class index which is printed here is an internal representation
for debugging. It is _not_ an index based on DRM_XE_ENGINE_CLASS_* values
provided in the uAPI. Add the string representation of the engine class to
the output in order to limit possible confusion by users when analyzing the
logs.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 2606cd396df5..cb92fb5cbc75 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -263,12 +263,13 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 		 "\tFaultType: %d\n"
 		 "\tAccessType: %d\n"
 		 "\tFaultLevel: %d\n"
-		 "\tEngineClass: %d\n"
+		 "\tEngineClass: %d %s\n"
 		 "\tEngineInstance: %d\n",
 		 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
 		 lower_32_bits(pf->page_addr),
 		 pf->fault_type, pf->access_type, pf->fault_level,
-		 pf->engine_class, pf->engine_instance);
+		 pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
+		 pf->engine_instance);
 }
 
 #define PF_MSG_LEN_DW	4
-- 
2.43.0

