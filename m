Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FF3D31898
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8D10E5A9;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbCGr7k8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085EA10E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3eYq0B9JbH024B5Bf/phu2aW0pkIGei+epOroViP/2c=;
 b=NbCGr7k8Wvf6WEjBZKOZPdi+QYhTJSPR6HjeJPeJsorCl+c3kwLN2CFK
 KaVD0xI7rjk/SCnF87GVZ/QtXkv4D8rSv+1ToTWWBF60nlKtgoFOFT2Ex
 vh6JcdAe1hx9R9NB4uglDV+1Pt8QfyvZZhlSTN6gpUatz2W40rsnsUlKj
 0sTiWbnVzJsW0o3PAIFE/Ijj7t6FV57wfjVmpki2oPHp4JAyj9zjpXkDh
 jfVRXnh5AvNc698TS5ruqok+QjmSJT6OIYewX7nGD1YaBgiJAjc+JXv0g
 xQQDcRTYJGzV99JFtpQfSrfpQiG7giM8AGxrTlLxegUUIPNMhikIRufpf w==;
X-CSE-ConnectionGUID: AR+fH6n8TWSICL/6iUHL+g==
X-CSE-MsgGUID: v4ntHfoERV6/ZXbVbdfshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311125"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: cL3iYoMkRR25zg98txRTbw==
X-CSE-MsgGUID: cLaFaIz+TLyzaut5U3HoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147345"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 20/79] drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
Date: Tue, 13 Jan 2026 15:03:25 -0800
Message-ID: <20260113230315.3081153-101-matthew.d.roper@intel.com>
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

xe_gt_sriov_pf_policy.c doesn't use anything from xe_bo.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index c28606ca6623..848e24926ecd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -7,7 +7,6 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 
-#include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
-- 
2.52.0

