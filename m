Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ED4EC110E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 16:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D5B10E402;
	Mon, 23 Feb 2026 16:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RM8xwLsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F910E3F9;
 Mon, 23 Feb 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771865624; x=1803401624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nwMXs4ltbqSKwF+Z2Nne/1X4M8VSTxz4QFpywvNUb6A=;
 b=RM8xwLsbNA1p3WsVsNtqWkxmu6I7o3meQogbScyiXcnvAkBkfyRB+seq
 /0eHv6bs3PGKRW8O45745c0YxWJkvKvJv1PlAUG94b+EmylnYwVGANDiR
 BtLlfpzeiDDxXChv52l3yfWXPh7JDpwwMt8/nT8jOyfB14rIsFW++NTra
 JksIAYsWY5Ri3olq1JlkoTW4zn2iCxlfmQgEKuGtrLXmxl64qAle+VfIq
 0bhFnFWqoIwpw24OsBGUvNXIsgknSqqdtvksbOptpeMfGvbdPW9BHDJAr
 ynzR5lc7Pu+e5CpR0aPWXriMgZYGqLGhUUukpggTB3xgQ7bwIiQmUZWi3 g==;
X-CSE-ConnectionGUID: nj0QQaVqR22gi3Ry/oSqiQ==
X-CSE-MsgGUID: RU1oUCCgTfSpIttnd+XQwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76477617"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76477617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:53:44 -0800
X-CSE-ConnectionGUID: Se356/5lRXaPvV0T5ekqlw==
X-CSE-MsgGUID: GUw0HBI7S1W9rn8Acwzs7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220613629"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 08:53:42 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/xe/compat: Remove unused i915_reg.h from compat header
Date: Mon, 23 Feb 2026 22:40:15 +0530
Message-ID: <20260223171015.1035550-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Display Code is made independent of i915_reg.h, hence
it can be dropped from compat header.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
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
2.50.1

