Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8BBCE7B19
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9797010E604;
	Thu, 28 Sep 2023 10:59:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFCA10E604
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898738; x=1727434738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DiFll5BELZ9ilj/GLm9zZ8rB9pl0xa17b32h7rFG4AU=;
 b=k5uq8ABv362Lbf+ldySNgG8nFYBdfF1jcCpSpQelF706lh6QtH7pCqmj
 qRynS1SS0PBNDGvl3OzNoCG9VfOoABhh5hNuhvaJCLkIPnJjguSTpx9tT
 pEdeXzNvLI4/8CAPjNSKg41h1VbTVatikL+oMtMxZ4Mh8wnMHCa7essee
 vHi02ijsKWbo+Kb7yvcXCA3dsPgoRqbvTxspQDlLRzTgSFtTPanhWw9fa
 qiJDrmnEhCZ0ysJryhs+ycjQFQRe4xK26lXo3RYbY32hkZ013DD3g+LPN
 65kBtFyQo+EoXjfsMnY/KkJm3tdAZLgBPPoaJvkhUs95aDgxHKDtANfRl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640120"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640120"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174412"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174412"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:25 +0000
Message-Id: <20230928105843.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 02/20] drm/xe: Set the correct type for
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

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
2.34.1

