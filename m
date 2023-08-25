Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43F3C3DA66
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAF410E64A;
	Fri, 25 Aug 2023 09:39:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A371610E64B
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956363; x=1724492363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjfUvkZ6mr08VCqK+aAaavCkzVDwUoTwrj3ugbas5OQ=;
 b=GKK78eGt8zkCMIrGXzR418+A0QsUgb+n7N6e6IYKyr2Yh5EOI0G9dQEr
 xImFmNq1dgDAx6YZeLepU4s9ZKPxooxat9v9bZYhd8nRHiBKD0SL4Pa9K
 Rkib/ETYnV1cgj2fsTV++XZfSjSIWltFyjpIa8KGcRx4Hh1Achi0fDWQo
 35ik6sYRz9UvFTYR7jfCmPficX/oqFnbNZFl+4ggKtbyf6bfpfthNa/9s
 hhcyF72zFXHv6GVeHQTkEptwZ0gfuz87/osbP45BuAnW2f0ge49THQ4nG
 ToFvI8VNTN0m2kM5e5VHSqSl1Jy1Bw395/SFrJ1Jinj5zSqGEcrvM1Lxj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037103"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037103"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246761"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246761"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:22 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:53 +0300
Message-Id: <20230825093904.1230143-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/12] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Fixups related to "drm/xe: Add macro to get i915 device from xe_bo"

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 4f077b222b36..bfd348e72d09 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -163,10 +163,6 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
 }
 
-#ifndef I915
-#define intel_bo_to_i915(obj) to_i915((obj)->ttm.base.dev)
-#endif
-
 void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
-- 
2.34.1

