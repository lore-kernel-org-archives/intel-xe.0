Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1903C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B62010E244;
	Tue, 15 Sep 2026 07:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bS5OSuLz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4417A10E5B9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456342; x=1820992342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HS6/Jjqjef4CHHA2Px6hSG24p1FH++ZQU2H9iiTdl1g=;
 b=bS5OSuLzzcx4pjlIgJzR9iUeLqMgaDSi+z7FQ+xFQoMAjSexR2NSEtaV
 V1F2PGtEVhALjtCJMAKZbCkF985opo5fsbjJQxEn5xJ055JWIeGXjZMF1
 B9DFfKI2WAF++wPf5F7QXqh2AoBrUGJ8uPzNAmVQOSWK8TDjMSkrBCbz6
 hiC063oYQBByhb/bM+22QPe5sidpl1FnPqPcdoe8SLWJ7PrqXE5C2t/oz
 yfSS5pjffSJQ8nO8foWTJhJTcc+fzEMpK5J/AzSQDMcqCEIyx+VEpvL/p
 HdOB/LH0EIqNBggqI3csBloYtgM5yOSFJd18beLqzJ+XbfItR2bVEHzyJ w==;
X-CSE-ConnectionGUID: rfm57ht4Rg+hprrB/c2JzQ==
X-CSE-MsgGUID: FM14o2epSimvb+Ai+Ler+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511763"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511763"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:22 -0700
X-CSE-ConnectionGUID: qk0T3yQvTuK63CywqwCJVg==
X-CSE-MsgGUID: iqAnwCjXRQ2JwBh0TFUlew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081616"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:20 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 09/10] drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
Date: Tue, 15 Sep 2026 12:42:06 +0530
Message-ID: <20260915071159.51402-21-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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

Allow to replace xe_ggtt_shift_nodes() with a stub so that VF GGTT
provisioning can be exercised on the fake xe device, which has no real
struct xe_ggtt instance.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d65929720704..e5a9f6512657 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <kunit/static_stub.h>
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
@@ -651,6 +652,8 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_ggtt_shift_nodes, ggtt, new_start);
+
 	guard(mutex)(&ggtt->lock);
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
-- 
2.53.0

