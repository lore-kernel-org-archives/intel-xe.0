Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A0FD30CF6
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4010E573;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezJK0i2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D5810E56F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPYXvK5eFDW/y3/845iXRag4QPJFb1+hevOIiYWe81Q=;
 b=ezJK0i2qOiI+vcaCow1Sseki7sxaOdF3ttQX4ttszqJcSF4bL3TaGA84
 umoOouQRHDcdr5ELpayYKMZ1MZULz9e5/UFswopNsCCg4ETZRQ6M47Smp
 RtxsZ5savZX83LhB7FpsVljsAR0PNQuLE2sf2y9JfFrnbII1BIvmlRLsk
 29qI3cUskoQMooYX4vDVjC1lOu0+ERbdwPwa7XBJnl8S6dwe42K7giTS6
 BaEwcoKscWulIsi7LTXKPajk2CyRCypiopZRg5bMX6sH9XoLesz4jdQ4d
 9elyapWwQGtxsQFn9MF4q2oewEOn2jqPP1mLms8ekcQAg1VXjSkXSDgNb w==;
X-CSE-ConnectionGUID: rD3zkJrVSb2knSSZD+EXcg==
X-CSE-MsgGUID: OGakdQLZSdKFOr+usxWASw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311178"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: YteXdWOgTFKb3irivY/khg==
X-CSE-MsgGUID: CPHIsqA/RRiokZ7Ubd4JGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147470"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 72/79] drm/xe: Drop unused header in xe_validation.c
Date: Tue, 13 Jan 2026 15:04:17 -0800
Message-ID: <20260113230315.3081153-153-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
MIME-Version: 1.0
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

xe_validation.c doesn't use anything from xe_bo.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_validation.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
index 826cd09966ef..a611438eaafe 100644
--- a/drivers/gpu/drm/xe/xe_validation.c
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2024 Intel Corporation
  */
-#include "xe_bo.h"
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
-- 
2.52.0

