Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE44CD30CF8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5A10E579;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmZm93pV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9210E56B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WG7PhLevKR0CZdWe3HAH13iNzH2pvL0bkhjDlUf/NLk=;
 b=SmZm93pVrJFEo0BQNEWeoJdbOEsDYecEWPcSx+NPVT/cXJfUSw2pVjv6
 yqmi0AnNuvJzQZvfr44Xq/QUcEXoJNyNIz6xagQlIhmmTRxMJVU4yKdbJ
 5GBh9rZDxNgZtD5Yn4fkYds0j/fVpiorh34jy7lQXCeGPp2ou8Xt/kGFd
 YL6uYCdIv2FmaeGPf6YFZ+pcVDcT0xg9GddJAEEmZC0375hIwGLsQbAFl
 HMRG1i7nPMeCUcy01HQwd+Z26q0kgr8/m6poCgDj+wPUKu8M4goFYnIZ6
 cy6IsD+fzMbyBULDJ/s+fayhqpFkCEAMmm8x/NnfYU7TZnJySwwV/9ltU Q==;
X-CSE-ConnectionGUID: AtvOzYQLTc+zKcGdxr1cQg==
X-CSE-MsgGUID: QVYP5XQWTaK1RPCDsGGbMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311132"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: Jjn+AUy4S+OIOXFFvWSBmg==
X-CSE-MsgGUID: /eWVRQc2RTGVHaAXhDmrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147365"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 27/79] drm/xe: Drop unused header in xe_guc_buf.c
Date: Tue, 13 Jan 2026 15:03:32 -0800
Message-ID: <20260113230315.3081153-108-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

xe_guc_buf.c doesn't use anything from xe_asert.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index c36fc31e0438..11f77decd8d1 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -6,7 +6,6 @@
 #include <linux/cleanup.h>
 #include <drm/drm_managed.h>
 
-#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
-- 
2.52.0

