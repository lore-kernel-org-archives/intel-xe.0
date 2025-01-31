Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975D3C02196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5693810E275;
	Fri, 31 Jan 2025 22:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQJGrYov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EF310E257
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738362718; x=1769898718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZGUc9nrRysA5DR0qXEUOmmznQ0QCIMcPUATX2y7uhc=;
 b=WQJGrYovTBbXX4/08Goyxygx3nWD4hljA7TPJy01qDt1xq5kVD3AVPm3
 RARNELBLJuRjp7XFjvm71ELt1Q5EnTVxCUXgdxU6CLslaczNt2M/fpL60
 u4F1q/hFR+FN4x0JoD/XYCYChd4muwYNl8jSKiXODFhX/aAxa7SCVDsv3
 /gCFCZOs4d+XouuXXUO/GLgDxtpRset/DfiYJTzTjdLplEB+VeFBekhRN
 i1B+VmGyVOp+iKe92jI9d1ucGbmpJ5fXEytlZ01wnxVt+glZwCy6QDei5
 Up4zEMNTMnuvfzxnlRwTKjylZ0FOga4e4uASV4Q5tWMaCY7+hfXF4N7oC g==;
X-CSE-ConnectionGUID: w19SYdqXSeCWYbJsVEMovQ==
X-CSE-MsgGUID: og95gDPlSbWLsS6PFPN4WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38149064"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38149064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
X-CSE-ConnectionGUID: tXQVI9SdRzisDFrJRe+5uA==
X-CSE-MsgGUID: FXwSd1PLTP+j5jENgNxlXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110622316"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:31:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/7] drm/xe: Fix xe_tile_init_noalloc() error propagation
Date: Fri, 31 Jan 2025 14:31:36 -0800
Message-ID: <20250131223140.4144292-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250131223140.4144292-1-lucas.demarchi@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
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

Propagate the error to the caller so initialization properly stops if
sysfs creation fails.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f7..377438ea6b838 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -172,9 +172,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
-	err = xe_tile_sysfs_init(tile);
-
-	return 0;
+	return xe_tile_sysfs_init(tile);
 }
 
 int xe_tile_init(struct xe_tile *tile)
-- 
2.48.0

