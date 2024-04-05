Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E436EC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 11:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1C113B54;
	Fri,  5 Apr 2024 11:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4XjsbYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ADB10E7DC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712317134; x=1743853134;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pO+K/s9/IXApgUkz/8S7bMkHDem4SXDxe37+5VkiSw=;
 b=O4XjsbYRtitw6dBd5dbfw7gd/9/rlf+iV6+UZAfbakHjlvfYkbowWB96
 0MKGj8Rk9MPGq2OQjOtMIwbQ2XNlbPLc583DufyfEot9o9OZYJP3HIejt
 vt+0YTAnEnfLG0DuJEitjNLgKdni6Q+6NsSgx3BMvj4R4Im0T9VuYB8MJ
 tBRbHNALTBm3e3et6XiADBteaMMaRdGVrmZx0Jtc+AKQ+DW67YeMPWBao
 rmnHqBa9o9fJy9Vm5F6NrhH21Jq35UYyBlAnvXvdiAlh+b6xj7e2LKgNF
 OQs+oxOv+o5bU/D/8wIAXdUW76KVmvE159ACEMLcouAfOH9SMYBt0w3Yk w==;
X-CSE-ConnectionGUID: 6YrQ+uhCRpSLWisjS5XSBw==
X-CSE-MsgGUID: OY11ZddDRH+WU+TvdStVvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7540467"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7540467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:38:54 -0700
X-CSE-ConnectionGUID: X1EZG+YOQlaqkFThEXdDlA==
X-CSE-MsgGUID: sZe74tMOSzO0EJBEP9UcTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19066818"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:38:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop xe_vm_assert_held() macro definition from xe_bo.h
Date: Fri,  5 Apr 2024 13:38:44 +0200
Message-Id: <20240405113844.803-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

It is already defined in xe_vm.h and shouldn't be duplicated.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index bae042b35fa8..8d2da4022a17 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -13,14 +13,6 @@
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 
-/**
- * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
- * @vm: The vm
- */
-#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
-
-
-
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
 #define XE_BO_FLAG_USER		BIT(0)
-- 
2.43.0

