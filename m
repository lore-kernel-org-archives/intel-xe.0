Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ADED318AA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8CB10E595;
	Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxwvg1qh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B415E10E576
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1vXfBeEnr7oWDmUHpL4QX7bQ8szbdwm0byZj7bHFRYw=;
 b=bxwvg1qhTOyEMU4OqXaQBqXZsTt0/AI/LZMkN6jLcuEmQXK0eVXSn+Ak
 ZvqmvvT2x1hHeEjNcPBhFYBL7WkqRl8n0sR3XKXkK6zxASF/8S7PJwE7w
 VRxjESrMCs+N+oxdP3K/SB1G1rLPQuMopdIGDPBDwgI931j7epzOUaElG
 zjZPtWHbPAQsskyJO+lTbOAyMak4on0IYXWJM9BKpS2TBxYA0J3VAo0zF
 qxMCFmutVY6Tochf0ndVbsII+l03cn9TPvq2q2BUEVMorkO5qDppM+GHQ
 t4HfrK/Dd7/nCXA3s4oQ38zo2UObq5tg7F/D/OCWWP77LTSmcN/fu2F3T w==;
X-CSE-ConnectionGUID: Vn5rBYiaTryDub8LoViCFg==
X-CSE-MsgGUID: QQ9l5BIfS/KfSr8p/bWmQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311166"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: cI8WfUmWRKWfSrwFZ1Wq3g==
X-CSE-MsgGUID: dG5MjU4aRRem/6gcazyV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147440"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 60/79] drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
Date: Tue, 13 Jan 2026 15:04:05 -0800
Message-ID: <20260113230315.3081153-141-matthew.d.roper@intel.com>
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

xe_sriov_pf_debugfs.c doesn't use anything from xe_sriov_printk.h.  Drop
the unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index e84bdde9bc80..81b377830d6d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -16,7 +16,6 @@
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
-#include "xe_sriov_printk.h"
 #include "xe_tile_sriov_pf_debugfs.h"
 
 /*
-- 
2.52.0

