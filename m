Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8408D30CF7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609610E569;
	Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0XoYOcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616A10E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345420; x=1799881420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ez09D8uBGwlkSMLw9SoAqm3kjn3mPVVB607mlnJx7QY=;
 b=L0XoYOcLKCW2gPHnM7BazOmKQaSeJ7K3svfCTA4dBNVATrDcDn4hxSgh
 2jP84CLsIHKd/mUTXfRmWEeJ9s2tA6TK5ao/qQJgLVqBYmdLpOQrYKKYY
 SH3CP1c9QL7g8mSVNwUu2FM6KQEJ81RZY2Aq9ej1oj1hqrKAOWPC1L5Ol
 +iGTpX8u2Lzf92B+vkRUjt2FA/zEV2S7/qBqDBWydyjVFjd4QkVVqRo0I
 Vbhl/aEP9GDrnOigQURi0wViOJmkdgIa3IStViem6roH7obv8HhGwT5Q6
 gOubUYa4J8H4EPkhRVFN5S2pfosM1JpRWGJKMbO1kUd0DP8ZKl420fcqi A==;
X-CSE-ConnectionGUID: UqPHiS5NR0qIRAJmVAsrIw==
X-CSE-MsgGUID: IstEtFHzSyqszwZ/5HR/Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311120"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: EQnpUzmuQzWPTpG8dzDHjg==
X-CSE-MsgGUID: GsegfjHjS5+aGiQtYG6x9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147298"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 16/79] drm/xe: Drop unused header in xe_gt_mcr.c
Date: Tue, 13 Jan 2026 15:03:21 -0800
Message-ID: <20260113230315.3081153-97-matthew.d.roper@intel.com>
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

xe_gt_mcr.c doesn't use anything from xe_gt.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 164010860664..7c1fe9ac120d 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -7,7 +7,6 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
-- 
2.52.0

