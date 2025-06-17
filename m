Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E811C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 02:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509E810E479;
	Tue, 17 Jun 2025 02:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7sxAm2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0C10E479
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750126155; x=1781662155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nGcgaR0fCjaXHDPnM7dO46bLK89wr6U4n9bfbAw3YbQ=;
 b=T7sxAm2hZleBBoUmgMQ15KlntD88U8Tftja4dT8FmVTlqfaBv3ZY4ETQ
 XIZGb2wtm32AcBjWwFcuThY7H0yxWeQ1Hel5EKgQz0PKL+pX1lKxKNss4
 rhkefA0UO8o7GJp2WAcAmvxxaZ8/oVv//uuQaKsgTBQoQLqQUBqf18jhG
 v248Lw5UOEg/o9WNMpM7S4/WeVInWawWnY91XspiaD9ia94XoJD3Eam+M
 A99bJX9Bov8RyaR6ulpqFYOo/88KAxym8u/0+aQHjQw4jT4eyfsN/xvAJ
 ZBytZALuktkBMCA58Cda7stsTZK/9YRJvKv+jdxZMU7nKD+UjowAHCBHH w==;
X-CSE-ConnectionGUID: xU6+JHqGRIemx/ZoBdlYNg==
X-CSE-MsgGUID: huuC8B7CS6malsHIyO/MQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62890150"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="62890150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 19:09:14 -0700
X-CSE-ConnectionGUID: ygXz4x8FT6uV642mM9+FZw==
X-CSE-MsgGUID: bMbpprajRaOeoGDZmKdXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149174187"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 19:09:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/5] drm/xe: Export xe_step_name for kunit tests
Date: Mon, 16 Jun 2025 19:09:08 -0700
Message-ID: <20250617020906.1719276-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617020906.1719276-7-matthew.d.roper@intel.com>
References: <20250617020906.1719276-7-matthew.d.roper@intel.com>
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

xe_step_name() is used by xe_assert(), so adding assertions to functions
like xe_device_get_gt() will result in

  ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!

while building the kunit tests.  Export xe_step_name to avoid these
build failures when adding assertions.

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index c77b5c317fa0..10e88f2c9615 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,6 +5,7 @@
 
 #include "xe_step.h"
 
+#include <kunit/visibility.h>
 #include <linux/bitfield.h>
 
 #include "xe_device.h"
@@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_step_name);
-- 
2.49.0

