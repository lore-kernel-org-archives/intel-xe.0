Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98515C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 12:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE8F10E0A6;
	Thu, 11 May 2023 12:29:09 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA40710E0A6
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683808147; x=1715344147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DxzhxGLF4Jv0FPlhJRM58TU1X3B5o+2ouXZga8qHTK0=;
 b=nv40hmd69xa6D4fDUXjQxzpgyT8grD+nXCqWshm+3YUKb++RxPqZ5YjJ
 FIS2iW77gYt5fnWjPmjv4oZLJ3RXsNhIiVL1SuCL9G0tclPJ5iQ6XYY19
 /xKSTPWHoyaNYyF1BIf2CQFD/Tyvmx2AMpuEWrs9LaAIgLEvxR8xqXXys
 WDJPImB/nQGre3WS1ogPbk8cowBNczaz0EeEfviq7TApz1jt5ArYdpVMm
 WBeRvqUcz5e2lYZ9c5EBOSpQPuHbymzsuCrkuRXi+qns3exP6I6ZH6Daa
 RZPpJrZ3hx8RcB5jspr6mUNK311IixerkjIAThJU7tDhmWZoO/3eNhksc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436817201"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436817201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823949161"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="823949161"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:29:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 15:29:01 +0300
Message-Id: <20230511122901.872670-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes to
 make xe compile
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

I don't think the ifdef is needed anymore.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index eac5a4141bfa..622d603080f9 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -231,12 +231,8 @@ typedef struct {
  * simply operations on the register's offset and don't care about the MCR vs
  * non-MCR nature of the register.
  */
-#ifdef I915
 #define i915_mmio_reg_offset(r) \
 	_Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)
-#else
-#define i915_mmio_reg_offset(r) ((r).reg)
-#endif
 #define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
 #define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
 
-- 
2.39.2

