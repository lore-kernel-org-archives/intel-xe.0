Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15BCC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 21:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9A310F3EC;
	Wed, 31 Jan 2024 21:48:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90C910F3EC
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706737696; x=1738273696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pCyHxcIVNFsQ61FDDVfVtYPLid1GXJ/2cwDcgq2R6T0=;
 b=cq0XOMj/toraiZ6+A1DbVMdpWP00WuuN2li8qhTjEo3ArLf9rMShNPq7
 Jyh0OnOe0apF8CUd/Ny4P/PyNWqf7CDd4jN+mIvjNVBZQBb0omkJCQ8CO
 dRWdHu/OJIJLdEVrWkof2n+1B30nZ2t533wsFhgeuO3fcv24hAkaOjiMS
 /zqlhva0EslyiXU4ejXFA5w1UtIhiMhule9U5EgqLgNAafArluYFJbcGu
 N0kgInSccq2m/7dzlNikTPNUYJ8BqbKoiqwZphgfhs8kPIRcmjLmg9IXA
 B0EJE9952CE9LWUR5CXH93KKs7UA0Y/O1zGiddYYUJuIvqjH7nVgXoWnN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394178232"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="394178232"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 13:48:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119748666"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="1119748666"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2024 13:48:12 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/1] drm/xe: Add helper macro to loop each dss
Date: Wed, 31 Jan 2024 13:48:10 -0800
Message-Id: <20240131214811.309263-1-zhanjun.dong@intel.com>
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
v7: Updated commit message
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Add helper macro to loop each dss

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 17 ++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 5 files changed, 64 insertions(+), 4 deletions(-)

-- 
2.34.1

