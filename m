Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E52C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 06:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732FD10E4F5;
	Wed, 15 Nov 2023 06:32:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBFE10E4F5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700029960; x=1731565960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RNKCi9Q/2SgMAUhhBArKlhjzUb44LS+5H6guLUGWhqw=;
 b=BdPqy/amjee3EvyjmJk5KGTuYeSwP5tmB0B5rFvvJjZyiLPMGtRMcW9U
 khnL4b690A+Bjn8HJHYN6dVKFui+JjKnKgFMJznQY/S1LEgwYU8IBMp9f
 61H0Z277lPT0ffbZAv406Zovf7+YeBZ2txEVYJLI300PQTJtpaqwGZg9d
 bioi7cu3Arkotm2sh5sP20JwaJG3DMOjcNQEg0JGsqL6QiOfYEyiyev5G
 FZoaAgTVIY7P8acscyUyKXB1A6q790RNjBFwYqRm5251z9Rm1MAmqaBR3
 Fftn8SX9IiBSZcZpRAFKBAFacSVtrfOhOemy9XW8hN/vcjoZv02H6y/VO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390616511"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="390616511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938389811"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="938389811"
Received: from tmagriss-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.218.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 22:32:38 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:32:07 +0200
Message-Id: <20231115063210.3112123-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/9] fixup! drm/xe/display: Implement display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

ifndef _I915_GEM_OBJECT_H_ was used in several header files due to copy
 paste error.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

