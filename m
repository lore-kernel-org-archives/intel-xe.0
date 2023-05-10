Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49425C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245B710E486;
	Wed, 10 May 2023 12:12:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAC410E492
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720759; x=1715256759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ouf93saP0karimptJtrOQ2zPrQFM0MjBeObktWDoKkQ=;
 b=QAUByQ4/eJLSK02omW0Y4yf5/RJW0BqRasPXHwBf4rI8ETRDCokSycWy
 CCd6tLs9H39gTFBFBrGR2yNZ++beaEr1Cx1c2JaS9gTb/N+AZoJbDjJtn
 xzRhNlvezSSnOg6scuiv454vpXupj9CWAwtHI70m598/L7b4cn0bJjEnq
 Cl3oA3lx/azdicSqQ4n3JFV2eNgSfBsIfI6dtVVF4IyTmUqRTNSZOSxVG
 XzqEC653B0AZn/eZy6Dx5Xkyr3VfgllyX8TLmsBbO9QenPiC5iVo3tODM
 5944C5H4sa2pVDhQpHzpcraUBrturMqa5gYyYR4Ig4qAnqSSN+B/anKL4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268150"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906246"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906246"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:40 +0300
Message-Id: <20230510121152.736148-12-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 11/23] drm/xe: Add
 intel_bo_flush_if_display define for Xe
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add empty intel_bo_flush_if_display for Xe. This is targeting to get
rid of need for #ifdef I195 when doing
i915_gem_object_flush_if_display during dirtyfb call back.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d456d913eac9..229fedc8ea72 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -73,4 +73,6 @@ struct xe_bo {
 #define intel_bo_to_drm_bo(bo) ((bo)->ttm.base)
 #define intel_bo_to_i915(bo) to_i915(intel_bo_to_drm_bo(bo).dev)
 
+#define intel_bo_flush_if_display(bo) do { } while (0)
+
 #endif
-- 
2.34.1

