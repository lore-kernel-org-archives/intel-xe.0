Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731DAD31896
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7A210E5A7;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgqcdEAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198510E567
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wWAGJBbStVlGhkycRNea3G+Ixko7Dt+fWqfhd7kHO8Y=;
 b=SgqcdEAYJx/JfqIqro4fIAkT/rnVZJlX4SZE0081A1SELFZQ0LmINl8i
 VQyDeMMmT+3PtHMa/tUKkaWvnDgSPC+rx4XQG5D2RAEu65iQXIdVI5CXq
 xnbGNyxBonY3bxFv6zyLjPu/p3FBZiKWt+j9ZDOKdJGpvBvaq2U05VxQ7
 a/+gbfD/PukWavyg+GBxUNA4sFkkVgox1kdQTIssZXZOAVkL72dDlpz6G
 u60fKr67QWj7v5rpjtQ6TeqIY197Yia1dEP1ltjPBeYLQHmY9uhhFDLaz
 j5C5GE+h8bGTJGu3HTFP6bu+s1YqKVBMN7AFUXS3WTxcebtw7d/d7GK3+ Q==;
X-CSE-ConnectionGUID: 0gSsH5dSRxChcnqzSaTDQA==
X-CSE-MsgGUID: V1ABi9o4QYirFwsUyjeyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311137"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: Oz44v49bS0efRxU7YFigww==
X-CSE-MsgGUID: 2n1vn23NSriClg+DF7T5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147371"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 30/79] drm/xe: Simplify headers in xe_guc_hwconfig.c
Date: Tue, 13 Jan 2026 15:03:35 -0800
Message-ID: <20260113230315.3081153-111-matthew.d.roper@intel.com>
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

xe_guc_hwconfig.c doesn't use anything from xe_device.h or xe_gt.h;
instead if only needs the corresponding 'types' headers.  Replace the
includes accordingly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index af2c817d552c..b300901dbb8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -10,8 +10,8 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_gt.h"
+#include "xe_device_types.h"
+#include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_map.h"
 
-- 
2.52.0

