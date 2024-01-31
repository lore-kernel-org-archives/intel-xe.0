Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328FC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03D910FCFB;
	Wed, 31 Jan 2024 20:52:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA910FCFB
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706734375; x=1738270375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lBUMkMON42F8wQo0KM7gb71z0wDP7/bfuoYetNQUijk=;
 b=MKNdFgZ+rEbx/bNHzvYKIUoXKVxpJYOxy4/mWA+VWIwt/Tu1VmzU6bj/
 fWysLZ1yvN+hT0x7PqBs+cTRCsJ4qI8BuWsAYSjDjI3YJiNgC3Db1bdNs
 XGcLJIB+LaQBTmt8mjcXfZDGQeSJB93ViZ9hvMuIjlDggzKHaMo2YyRHx
 QMBfs+bmUXKdJbG84fbGNq2OiTe+Krhyq7a7L0S43OMvUQf6mKfc7gtAP
 dfejt56FJI4XuCxmnL43Bv6Gf8Ld9OIyZNgSQXcF2asZ/ZQfKYKC3VsA9
 tHLKkc73FOUp2qyznDopuuFr7pfFbMpwO9ESMUxXPheClp2QNWl1dPgVh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11094862"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11094862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="36995941"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 12:52:55 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 0/1] drm/xe: Expose number of dss per group and helpers
Date: Wed, 31 Jan 2024 12:52:41 -0800
Message-Id: <20240131205242.293046-1-zhanjun.dong@intel.com>
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

Expose helper for dss per group. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Changes from prior revs:
v6: Optimized for_each_dss_steering macro
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Expose number of dss per group and helpers

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 17 ++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 5 files changed, 64 insertions(+), 4 deletions(-)

-- 
2.34.1

