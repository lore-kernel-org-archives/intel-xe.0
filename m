Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AF3C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 16:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F4110E3DD;
	Thu, 14 Mar 2024 16:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu2nLdvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D564D10E3DD
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710432037; x=1741968037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYqotjQJPImHgzEjOC3JcVOXi4ff2JjmDj5tC+SgMJE=;
 b=Gu2nLdvwb5Y0C6ut8mxa94zXpib14D1MBBAQW9LnNWS1sZpBzYCs38Xn
 BMbelIDVqytQ7EMNB7LU6qHxqw4HIDDoOie5x7dxXK9rN0700yHWnXtTt
 NMjMXam/gja76z0gNxUvoRTWDvLx0049Hbbcp5da4Jdx9fJOsNldW1n3d
 0MW2SXGh1m2MwKBogwiJz80srpWsRZLdsnMusf7ZWhns2B3U5fcfQ12tl
 UzJNKuH7gnBk4DO2TtJtcr5m1/X7MmoBR2chto0rAt83emv8NhOaUkDtl
 arGknLEePvp4eqnERIuiQ0qRhEHLpBpZIv7b6yeOc5Hx52rkcmCA95ZfZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9087368"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9087368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16800912"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa005.fm.intel.com with ESMTP; 14 Mar 2024 09:00:32 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, Wajdeczko@freedesktop.org,
	Michal <Michal.Wajdeczko@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Stuart Summers <stuart.summers@intel.com>,
	Jose Souza <jose.souza@intel.com>
Subject: [PATCH v11 0/1] drm/xe: Add helper macro to loop each DSS
Date: Thu, 14 Mar 2024 09:00:25 -0700
Message-Id: <20240314160026.232786-1-zhanjun.dong@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add helper macro to loop each DSS. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Suggested-by: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Changes from prior revs:
v11:Optimized for_each_dss_steering macro and removed xe_gt_topology_get_next_dss.
v10:Change macro pointer type for uint to u16.
    Fix macro parameter typo. Updated function kerneldoc text. 
v9: Updated function kerneldoc text.
v8: Chang range check to assertion. Add function kerneldoc
v7: Updated commit message
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Add helper macro to loop each DSS

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 25 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
 drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
 4 files changed, 57 insertions(+), 11 deletions(-)

-- 
2.34.1

