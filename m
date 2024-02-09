Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7778C48297
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 17:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984EE10F86E;
	Fri,  9 Feb 2024 17:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc8iSSWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7110F39B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707500752; x=1739036752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgN8ifpD0aoQdNlN9V+al38GuRtlT3eunhzlS8/E6mY=;
 b=fc8iSSWYTsK71m0iAXmeJjJQjoSokp6v2gzl1IL93wll7Ish/cBAB+2R
 HwUIfcY7ylslizKjCgHF7848Uj5LvZQYPrQvsyIU4njNzw/D2vOTGlWYW
 cVsrkfnyuKgzDUmBO2tNoE/PefN+TrlKlWU/h3T/8RiAksL/VU8m1Ii2i
 Y1VG61RN28276LGu50m7tNnydIJ/h4PWKjOYl+2juJX8Aprr6SO5wazDi
 5tosY0kihSbYasByVlJMk3A8Gm3mted977xzRp6hRSC3QWqePHhnMPHbF
 K+FT+2o45H3J0lp5hFMo3tM7/p3O7FJPjbq21WEy9W7km4wjaHWPcK9zc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="395898515"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="395898515"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 09:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825191383"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="825191383"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orsmga001.jf.intel.com with ESMTP; 09 Feb 2024 09:45:50 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: [PATCH v9 0/1] drm/xe: Add helper macro to loop each dss
Date: Fri,  9 Feb 2024 09:45:47 -0800
Message-Id: <20240209174548.19389-1-zhanjun.dong@intel.com>
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

Add helper macro to loop each dss. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jose Souza <jose.souza@intel.com>

Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
v9: Updated function kerneldoc text.
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
 drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 5 files changed, 75 insertions(+), 4 deletions(-)

-- 
2.34.1

