Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD3FC7EE2C
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBC810E65A;
	Fri,  2 Jun 2023 10:43:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8010E659
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702579; x=1717238579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGNCzpglzr2Ihad3WB0Fwgsnd8Ly8xCek+HdzP3Vz4w=;
 b=W3bdK461qzryXoAqCU4G7c7ijjSFhmeq6LAdAoQNJjigdtk94ICS8UsP
 AFWr9JyJiUztkjyVIVhnxNKjKh4ROgnvGQTmsTKZ8SIgzkX6xwQ1slwb2
 CcaS5k6u9/1VmZ6vk+Lx0muLK8mW9x43dFGpFM/0gBiGWhWy8RP++V0L3
 YbnThRsZlNOebmVcge3BBx/3erSNJeLChPn/krRe2C4sEAFCsgwVfUcFe
 NPFORtdK8Fg4M+ZHD8k5F1pU1wQQgmkIgJpSCuCtMnrbZTds+bXbnjIOo
 JUwtACCrRJrC9a88/g3XpdMMBnMEEHxpquA3QdLjVqSYwEV4KrrySAsQY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215540"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215540"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237898"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237898"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:57 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:29 +0300
Message-Id: <20230602104237.1014684-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 02/10] Revert "drm/i915/fbc: set compressed_fb
 to NULL on error"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a85e885ec8004b465d477a37ef6dd3ea4e714bef.

As a part of clean-up we want to revert this patch and introduce required
changes as a set of patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 0a9b081c18b8..3dc9620552e9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -76,7 +76,7 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
 					ttm_bo_type_kernel, flags);
 	if (IS_ERR(*bo)) {
 		err = PTR_ERR(*bo);
-		*bo = NULL;
+		bo = NULL;
 		return err;
 	}
 	err = xe_bo_pin(*bo);
-- 
2.34.1

