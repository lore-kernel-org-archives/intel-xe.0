Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DEFEA4FA5
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB5A10E35F;
	Mon, 23 Feb 2026 11:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Skn0i5tF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484A10E35D;
 Mon, 23 Feb 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771844688; x=1803380688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+ee3qxC6zJIPv4nhzO4jqw851o0SbnC66bhGcurkd4=;
 b=Skn0i5tFhgswsdzbdBKptrGTqRC3Cy9N4W+r81dmY3v8BpR8wEANrcBe
 e2lk8cD1aPCVgxlwCY09iHeXZQ23lI+bvobA4bgTaV6DziM6BGIgREQXa
 d3uxWa8xF3+nH6pYD5GLUyfTneGOBVGpB5aFKk1cQ19ONx0fMgnYuwtYf
 F6DCFU7lHEAYKV900lYFTq4VK8nobWMrvkFhwh8kmheKnNKnfke4cMplL
 HyUB0IO1GpTHuAH0HJR3M7esahQF1b0rI9y01TGcQWbZgnuRrwO2Av1JR
 43lPFU9xIooNer1cGUZFvdhrwv7QUbKn083Z40aa1XOAqJXN6ir4BHVr+ A==;
X-CSE-ConnectionGUID: 9MrCjcuzRr+KRCqnCXfa1A==
X-CSE-MsgGUID: m8kX0OBOSkKTdEK6PX/UZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72900318"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72900318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:04:46 -0800
X-CSE-ConnectionGUID: ws7quEjMRY+W0a9xpIq4lg==
X-CSE-MsgGUID: m/nd7hWtSaGUG7KzAtA7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246133737"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:04:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/compat: remove compat i915_reg.h
Date: Mon, 23 Feb 2026 13:04:38 +0200
Message-ID: <20260223110438.279074-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
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

The i915 display code no longer includes i915_reg.h, and thus the compat
i915_reg.h has become unnecessary. Remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
deleted file mode 100644
index 8619ec015ad4..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#include "../../i915/i915_reg.h"
-- 
2.47.3

