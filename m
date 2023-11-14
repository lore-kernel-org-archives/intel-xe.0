Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE41C072A2
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673710E44C;
	Tue, 14 Nov 2023 13:05:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E0F10E443
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967115; x=1731503115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6c0y3KkBN7szdaYGE8zUFwOQx4+csDxRUDH20j+0wCM=;
 b=O551xRZwRYEpZ+sFdA4mGfQa9N3ToXgfBqPRP3r5hVeEsFapvhqNm94D
 5wVXVWniSK0NE4qMk+udquJ/+NhrL1Hu+5iYtkKHKqtGu9QKRHJphlJzu
 inkfMHuZkI3PeHWN1hz3Iwu5COnQrMbKyWUh8ZGlVr2ZMHmigEFTcJDXi
 iLipbB3BorFWlqJCTmOppbaYZQekQ/mTiQbqqo2ojOq2VnLM9YwgG0DT0
 yiHX9nlFD4OKoFV33yjEfkn2J9i9xOS+pdVDTic1/y2Psp7ui9+nnSdy3
 qrKKiemicTpeT+pyjuv8L7t2WtULCHY1AsHfliNMwSCbnxD/f4VZf4Omm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565377"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778954"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778954"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:13 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:40 +0200
Message-Id: <20231114130443.2503708-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/9] fixup! drm/xe/display: Implement display
 support
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

ifndef _I915_GEM_OBJECT_H_ was used in several header files due to copy
 paste error.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h  | 4 ++--
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
index 227965e5f784..2a3f12d2978c 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _I915_GEM_OBJECT_H_
-#define _I915_GEM_OBJECT_H_
+#ifndef _I915_GEM_OBJECT_FRONTBUFFER_H_
+#define _I915_GEM_OBJECT_FRONTBUFFER_H_
 
 #define i915_gem_object_get_frontbuffer(obj)		NULL
 #define i915_gem_object_set_frontbuffer(obj, front)	(front)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index 32f60258ded6..888e7a87a925 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -1,5 +1,5 @@
-#ifndef _I915_GEM_OBJECT_H_
-#define _I915_GEM_OBJECT_H_
+#ifndef _I915_GEM_STOLEN_H_
+#define _I915_GEM_STOLEN_H_
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
-- 
2.34.1

