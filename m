Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D786C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58441129A3;
	Tue, 16 Apr 2024 03:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvcsBeHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB91129A3
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wc9pJbkmhooXCHnr+TBpA63DT/5/yXEkd0d3tCOWRaw=;
 b=lvcsBeHl9FjBLovNs28DBYt7UMBXc+Gw+b1OqtlicFIqisO2nvUeluRZ
 4auknfmbVH4WqS2dCaf/LNMuf2lgEykBzVSL44ZB4XVK99aZPtl/OGhR8
 PIvlVmpGb91kBmIVHWNUhBLy8/xyMaWZoz8+2hj7ERKQ7ymudaQoAyXQ1
 Ul2uaY9jNIjWIIu6Lgvhzphy84FShLcwQdiRYxoX+TBfpHCZF1uUb/5tJ
 x+ICRm3dyjN/LY1K98YNDf30d22kkB1h9qVytdWN/s6gniS6wrVZMTALx
 oV0p1SHEmhmjGUM3jAGgJx2JiarCs2e8gjHneLfZmS7wM7jg8prsTb05G A==;
X-CSE-ConnectionGUID: QstEqCIESPiyy8oCc2XQBA==
X-CSE-MsgGUID: tN0ZG8jBQWimIZH+kV1dRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213829"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: lS/nDZ59QL6Mx6wlupo0AA==
X-CSE-MsgGUID: L0Yqfo9/Q+eZwkiY1In26g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895709"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/7] drm/xe: Add helper to capture engine timestamp
Date: Mon, 15 Apr 2024 20:04:52 -0700
Message-ID: <20240416030454.3739862-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
get the timestamp for the engine so it can be used to calculate the
"engine time" with the same unit as the runtime is recorded.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
 drivers/gpu/drm/xe/xe_hw_engine.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ab227fa8984a..528b271c9f23 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -981,3 +981,10 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
 	return NULL;
 }
+
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
+{
+	struct xe_reg reg = RING_TIMESTAMP(hwe->mmio_base);
+
+	return xe_mmio_read64_2x32(hwe->gt, reg);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 843de159e47c..41cd0cd71ae0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -69,4 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+
 #endif
-- 
2.43.0

