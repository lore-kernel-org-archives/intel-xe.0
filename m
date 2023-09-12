Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AECCA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8705110E35B;
	Tue, 12 Sep 2023 06:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A0010E379
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501247; x=1726037247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbKBIkBQhydjQmFmf2dk4DbL+cGWt3sEWJRYOnE/FkU=;
 b=LjCP0VhruU8FuVrTI4kI/9yqlRpS4az11zoTq+0yNhRBhwVmOTMVgRUH
 R4lwiay0lq/+iZo5QSQn7O3imH0LnInuWAuh/1AD3bGrVwpKUq2HygLJn
 hnUJoCAFibFszdFJ0mnRpqpm42i2AARqdk1Ujgmk6TeRaZtbSJrHKnfK8
 GJqrCI/SJ3RHmzx8cYhErqd7wNaGxTCZ+qiaKLOiRxcoL3GYyjfHK95Jf
 RaW5OIv1Oklz3pmkjbntuvFdy0/yaFT1pCm1MP9GLkb5GGk5C63ScCgRq
 DSKgvQmFIT/DR+B9bYcai2KhElwktXSe4mM8eQ6vP/DgrCgDl5Y1oetlK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730327"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699018"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699018"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:25 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:00 +0300
Message-Id: <20230912064709.2802305-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 03/12] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
index 629185e5a880..ce08bc4f5219 100644
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

