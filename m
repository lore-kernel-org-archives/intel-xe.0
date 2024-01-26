Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8854C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 23:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928D10FFE3;
	Fri, 26 Jan 2024 23:23:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002BD10FFDC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 23:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706311394; x=1737847394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1AbRIEJjsahQmuSKlXKxsWxHbavdoGWPV+1C+6vDJ0g=;
 b=dhsF8KScR8nVkxlaqXzS8bCAzWrCi4MNfXMWND+po/fozlnEbCfAUpjW
 8v9aLbYRG7UaX4tQCS2et5lb35n23cnYfyB3bXk/79mBNt7ISnZIweGoJ
 4eyiZHxx609BmJB2X5DwYBymBTZIZATJSXCDsKSnwL9X8N4ml5gNW+eB1
 C+XcLlzhlOm3N8kSJcq+ms9HwS+z1DpS5+l8vMDc18y12W8SeVZ7/6BrD
 CxX2+yOqslA+FPshC/3fcbKHZDMZU8Qp5Ec6L20M+Ax1IDKxmtaIMfCAq
 7wkn9/kdhfqmPFhctlsTC6fo65vQHVLCw08YvLh5vRDBLAQgRbAtnY2xj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2496263"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2496263"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 15:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857531390"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="857531390"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2024 15:23:10 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/1] drm/xe/guc: Expose number of dss per group and helpers
Date: Fri, 26 Jan 2024 15:23:07 -0800
Message-Id: <20240126232308.305358-1-zhanjun.dong@intel.com>
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
Cc: Roper@freedesktop.org, Matthew D <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose helper for dss per group of mcr, features like GuC register
capture will need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Roper, Matthew D <matthew.d.roper@intel.com>

Changes from prior revs:
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe/guc: Expose number of dss per group and helpers

 drivers/gpu/drm/xe/xe_gt_mcr.c          | 38 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h          | 17 +++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 ++
 4 files changed, 57 insertions(+), 4 deletions(-)

-- 
2.34.1

