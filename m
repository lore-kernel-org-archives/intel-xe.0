Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282A1D3188B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755BF10E592;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMEv16vS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7942310E578
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0uObOJ2CqbewYY7+ExRrn2cYcGFbHsR4S4xIZ16tnsw=;
 b=bMEv16vSKwSDIomCJBwyTVHG/IdakT4MAuwGO0UdSLOsUvhB+x4cRAn6
 hNyw5Q4fgdOE5+7OFsqzwy+raExiyrsEeHlC7rBfvnhjskXAYwiv3RpeZ
 VFlBBtr5w+edZjXpkg0UtdU3VbFpJCUmM4lhn/GCF9QQRJ1FO/2RQtHpt
 jyX7I7CNwwHWgkCinr/+u8DPLJZILEz3+pnp3sNHJBBnOLQysY+JhXiKH
 x0oGK1yvYesM2gnwG27fdvFir+EYAld86Uqqw+MhJwwI1IR3MJ2t1rqSQ
 IHkkTsHajOce3EXMQ2TnLvJobqguk8tQs2Rg53MegDCifMPqFja5rKp1h Q==;
X-CSE-ConnectionGUID: iNP3itPPQ12U/yplKqgpBw==
X-CSE-MsgGUID: XDVoVbc/SAyeJHnuIrmafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311159"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: D+W+hFRGReWg+3sIwpO1/A==
X-CSE-MsgGUID: 0k0jiB37QnaEDUueIsPnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147428"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 56/79] drm/xe: Drop unused header in xe_rtp.c
Date: Tue, 13 Jan 2026 15:04:01 -0800
Message-ID: <20260113230315.3081153-137-matthew.d.roper@intel.com>
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

xe_rtp.c doesn't use anything from xe_macros.h.  Drop the unnecessary
include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index ed509b1c8cfc..b7c26e2fb411 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -12,7 +12,6 @@
 #include "xe_configfs.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
-#include "xe_macros.h"
 #include "xe_reg_sr.h"
 #include "xe_sriov.h"
 
-- 
2.52.0

