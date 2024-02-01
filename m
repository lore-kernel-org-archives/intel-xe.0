Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0BC4828C
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 00:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DF10FDE3;
	Thu,  1 Feb 2024 00:14:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C474810FDE3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706746482; x=1738282482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1pVXgQsgSSQwPE2sEDzeqKdg7jBG8EmWh757nUDDxs=;
 b=PQW+nLRsoobzI0qIYyamwCAPwrcNBD6gsL3q3IZLyTzAmqlithSE4NAJ
 wfkOkuZVjkXTTkLNOjuS/pxXx3ism2+a5ipCaoRkccYcmh3dl7GkOoBig
 WNrxOup96xNhAJv5qR+AYfjGIgtn3n/g/3hPJuVQJpyzGT1oURieB/Vfa
 rtUsMCZbNmDex8xZmgdfjBNjAos2D8j5kyd9KuvDatOzZpBlrFq7RSrOb
 AZhZwPCOEA4++ldyHtEwgnqTbxw0zrScmFg81W59b+097ALG38oWyU6UH
 qnRegNAasxZwuy6DDUebHLaIiZIaycZsL8/zzfBkMbprGtrkP7bX3lwIs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3601978"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3601978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4225628"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2024 16:14:20 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 0/1] drm/xe: Add helper macro to loop each dss
Date: Wed, 31 Jan 2024 16:14:16 -0800
Message-Id: <20240201001417.354270-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to loop each dss. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Changes from prior revs:
v8: Chang range check to assertion. Add function kerneldoc
v7: Updated commit message
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Add helper macro to loop each dss

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 32 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 28 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 5 files changed, 72 insertions(+), 4 deletions(-)

-- 
2.34.1

