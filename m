Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE419D30CF7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99410E571;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q12sIPht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827810E57A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LwKDX6BgNTis3T8QD05goy/YKbW6QMjHj1pnyUSMzlE=;
 b=Q12sIPhtFjfToqkePJw3h4HB9bz4gTjtac0YdnzqH5LjPzcWwxNb5C3s
 SRR0c8EpzXQFLWkzdGm+raOE8ALIZjX0IJQPxPX6gkI7YlBfAiWy1adEs
 hGDfTFO3bBU+THsyW5Oa2TDbR/W3vhqJfglMBttW/OByrM09xWC0KW6PA
 x02Cyv5xrBW+E8y5H6clyya5zKerSvkf4niVLKXR/YJtD1CfthlJnFEfa
 kwJgL4UEFUEMADeA/j/ubhsluqBBSFk/66ZKT0GlEA561gZ5CkpKbCN2B
 gDrXO4nL0DPZW8aPOrVZ0jLybbubFYY6vquajrU5JDZpLkYU/xqLo9XBv Q==;
X-CSE-ConnectionGUID: 6oMInapXSLqozbw6teI8Hg==
X-CSE-MsgGUID: KyH74VDYSIGP09gf4W7Wzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311164"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: zXxO7HlGSMeXjqfRX3y86Q==
X-CSE-MsgGUID: NuaFwteOTXKbbbcnsT26LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147435"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 59/79] drm/xe: Drop unused header in xe_sriov_packet.c
Date: Tue, 13 Jan 2026 15:04:04 -0800
Message-ID: <20260113230315.3081153-140-matthew.d.roper@intel.com>
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

xe_sriov_packet.c doesn't use anything from xe_printk.h.  Drop the
unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 2cefefaed9ba..7a4c3de662e5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -6,7 +6,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_guc_klv_helpers.h"
-#include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_helpers.h"
-- 
2.52.0

