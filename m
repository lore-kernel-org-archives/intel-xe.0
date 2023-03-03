Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D123AC7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4310E0C6;
	Fri,  3 Mar 2023 10:53:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1F10E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840797; x=1709376797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XAEJ8t35L15XOCAslc/WLCG+GKd4zl1AWIpY980MYrA=;
 b=H/MwoM6S4ezc4YH/iB3tIJuq4Nz5spuZCRxUPmjowHh8Hl2gTkPF+b3Q
 /Nx3s7C2LqaX27kXgPvZWqqiN1TmglEHdilq/dBLGGDROqnN8ZM/B4Lsn
 ICqJ13q5+J2NMWVaaU22diQmcNmau+Ecs702R4jMs0B0KHDmtOkJ8SNEF
 PnDAmIRXbPdkcWpDCn4XpZBCFEt9o/3SYJbSB3AEAIovII/S2TBtLErNy
 4XEWOZQFrn7LffvMVcmEhL+TM0IrIJv+LwhF/Hz8LI/d8lH9tCAh04Z2M
 gtDADsByTLUdYFJs/6qssNSmUtFPm4QJDLkqs9HpCl5dM8LALA402L6fs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288250"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739467871"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739467871"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:21 +0200
Message-Id: <20230303105222.3550161-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/8] drm/xe: remove unnecessary include
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There's no need for the header, remove.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_device_info.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 6311b8494e4d..7f50b5e386f5 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -24,7 +24,6 @@
 
 #include "intel_cdclk.h"
 #include "intel_de.h"
-#include "gt/intel_gt_regs.h"
 #include "intel_device_info.h"
 #include "i915_drv.h"
 #include <drm/drm_drv.h>
-- 
2.39.1

