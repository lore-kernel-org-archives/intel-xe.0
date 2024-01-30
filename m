Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B83C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 21:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473311135D4;
	Tue, 30 Jan 2024 21:22:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9873710E05A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 21:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706649735; x=1738185735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BnB/dOa2K57xKZMZ/JPs+xo9NipVUBU25ggkIqe/7M8=;
 b=h51f2fE2ecxhncKVhjr2wJ+Ad+Xbspmg2l30q1B8cVE95hfz+lMC6KnY
 UdzdovBD4Vl1t58UGhptGoQhz03leMsMHq7LQ9opETjoLDfJKfHSNoy+3
 rylUMUp/BFoIX6bLVtyeYdp0zDqLzkpH7Gqko2RoerrULgrZBXWO/2p8o
 EvkYXPHOIR932i/jraAb1WS7yxL5s78QpLuWd7m9o9yBF6SnQJ+g1OEfo
 A8Fo4KXE3hG/8qJ9bOFI3K3UDIkb0bhdpQyMDmpkg2MyuOyrepJZ2DRzG
 lG+KqAcSqlxrYd1FAHvyOlQZrIBJ3htyC21wZPzP9lYCCCvt1c/P2T2cY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10504694"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="10504694"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 13:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788327367"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="788327367"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 13:22:13 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/1] drm/xe: Expose number of dss per group and helpers
Date: Tue, 30 Jan 2024 13:22:07 -0800
Message-Id: <20240130212208.235448-1-zhanjun.dong@intel.com>
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
v5: Reduced 2 checkpatch warnings
v4: Revert function name with mcr back
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Expose number of dss per group and helpers

 drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 4 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.34.1

