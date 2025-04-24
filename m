Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B19C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659A410E814;
	Thu, 24 Apr 2025 14:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeWkV0n9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EA010E814
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505049; x=1777041049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7/LoIAkzu5l25o1m92qtr2VXf/2sruH9p7K+7JZKEdI=;
 b=PeWkV0n9ws6Oq5ulvpqffwJokVDjr2L593CqIZufM1R0zgF84soICdop
 2uZmUv0BR5Kjl3SD6xHhLg2HCg2b4IoNYzsEivhLTZF8kv4Flxq8+Pm+c
 nqIFa3klJzpndzSh+VDtS5HYO7uM11MGjGWCwzple3jnHE7PdJDYIlF/Y
 LrX762Vpv01nZA8HYCnonvXfmmKFNKG4kq1s+eUd3x5tZzEGmR1f1rjeH
 b7VYuBthBPHYxN27oy+G3m9aMwldMORa5FGR3OwdpGRQn4tvQHJzwatGL
 YI1DyvlRK2C8qVA13X2okI93Yla2V06X2EP7Vul5U0veoeHRSO1zJqhhB A==;
X-CSE-ConnectionGUID: atrpv+e+SkCDdTmTJJTrVA==
X-CSE-MsgGUID: Wvmh+qHHTuqyn0gjY2VOGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50805554"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50805554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:48 -0700
X-CSE-ConnectionGUID: T9pvxOSHSGiT4CN/rXDGwQ==
X-CSE-MsgGUID: DFwPUeXaRfqSveqKD6eFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137632692"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:47 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH 0/4] drm/xe: Improve wedged mode handling
Date: Thu, 24 Apr 2025 16:30:39 +0200
Message-Id: <20250424143043.937-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported on VFs.

Additionally, validate the wedged_mode module parameter input, update
the internal wedged.mode state only on success, and allow setting
wedged_mode=2 only in debug builds if running as PF.

Lukasz Laguna (4):
  drm/xe: Don't update wedged mode in case of an error
  drm/xe: Validate wedged_mode modparam input
  drm/xe/vf: Disallow setting wedged_mode=2
  drm/xe/pf: Allow wedged_mode=2 only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c     |  6 +++++-
 drivers/gpu/drm/xe/xe_device.c      | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.c |  2 +-
 drivers/gpu/drm/xe/xe_module.c      |  2 +-
 4 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.40.0

