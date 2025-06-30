Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B46CC83033
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 17:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B9410E4AB;
	Mon, 30 Jun 2025 17:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neZbmbB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6CF10E4AB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751304886; x=1782840886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nGcgaR0fCjaXHDPnM7dO46bLK89wr6U4n9bfbAw3YbQ=;
 b=neZbmbB9hqAAbmZf3v2mLgDewww1naVxLwHKgdHcK8Jvpgs3PLzkFd2z
 uXWWfzMY+HavPpydWGOjAJFkFgrWT1hCGlKcIaCTzsQcXNC9t8Pq6iYdJ
 j2Z2JKB+829Q5VZcUwhauHswyLw0/WJffB40gzyfIqQSKrgzkM17POxVB
 IqMx0Xk6EnDZ3TaakDLaHpWyVm3HH1znod7iqNTXBP2j+iTQ3bC4T3Gg7
 H80SYcCAwwlZYab4BXT9zbMmRDnqmuuq7yWLjZvU9zgnSQHl7/V4GZrY8
 8eIFZ8TcGC3AoRKqJx/guhUnOdV2Y3eLDbaw2q5ujnUINfxK5Y/zAwdX5 g==;
X-CSE-ConnectionGUID: GqW0xluxTaagM15QpGOUIg==
X-CSE-MsgGUID: pn6msBL7Smubh5p0yC/8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57223398"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="57223398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:46 -0700
X-CSE-ConnectionGUID: AEFZJ3Z0QI2ku9jjcmgBkQ==
X-CSE-MsgGUID: a2xCcKUCRoGz+Wtz6q8z5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184543702"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/6] drm/xe: Export xe_step_name for kunit tests
Date: Mon, 30 Jun 2025 10:34:40 -0700
Message-ID: <20250630173438.2342706-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630173438.2342706-8-matthew.d.roper@intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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

