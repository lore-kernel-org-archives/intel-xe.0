Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD5C61CE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 00:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B16410E1E2;
	Fri, 13 Jun 2025 00:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcJSRUla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95E10E058
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773692; x=1781309692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e3mu+YgnVfRSF2e048vZvMrv6nYY68spcq7UViIGau8=;
 b=NcJSRUlabTis7uzY19ahA4mxVS8cMg2Oh7c7CFP5D5ple08WwWK5zBJc
 iltCgdBbJBCXG+w0nOvVbuZ2ihwEOOq8AJ/OlB9RZN6s9HzasyiY0gsnb
 r+y9m7lSqUYEsXf5WW3ZzRbLqz5DuLWqxzK6pCPAWCBQDxuj4YrZZmEI4
 eqlycyoqFEdyQ3lbeVT/HSCRNd0iVa7e3WHB9OI0ukjkrSV9UAxDGwtKa
 lhTcG8I2bgrs8/M8csMhpDCE4AAFbLas69DhlGjrO0tjGclQfsP6RJ2xm
 y5BAoaGJ+Y9tkT9uH9RmNsdngdUMmnHFad7TxTuFny8hNXKa055Dy3kwm g==;
X-CSE-ConnectionGUID: TRchvWSmSbiXJHA94Uz4Pw==
X-CSE-MsgGUID: lOS5SpyzTR2O135KtoqKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51204672"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51204672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
X-CSE-ConnectionGUID: +cz60YnHQeeDmu1Zv+tKrQ==
X-CSE-MsgGUID: 01MbOrfHR1KwZCPGKvEKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="151491065"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/5] drm/xe: Export xe_step_name for kunit tests
Date: Thu, 12 Jun 2025 17:14:40 -0700
Message-ID: <20250613001438.678728-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613001438.678728-7-matthew.d.roper@intel.com>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
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

