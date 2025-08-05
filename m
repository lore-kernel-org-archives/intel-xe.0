Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5107C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846F310E69C;
	Tue,  5 Aug 2025 14:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffY6/sJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D5E10E478
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754402474; x=1785938474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xUStV6tzGaIo0eZxVPLvmC2Oypdw+9I10MiftqCgaWk=;
 b=ffY6/sJneSGKqQLWJrGjwRaD+6zQnK86gE6J2VIJooR5U7K8VLqSDjhR
 2GT2urm22ikcHrIPbCe6ZN92vk+AufH8awLCcUNK9D/btZm9M+aVFImCX
 +4H6gZZdDOLrZqlSVbEuK3KtJMbuUXQ/dv+mcfMnBfbOhLLdGd4w/SiZ7
 JrqSaM6s+PFY1LtaXcXXlWQd+arniUWvowDaDSMWKp86MPLpqBY+MNEEU
 XTbgHWvng6U42A3d1g3lB21vYk2YZbwWsNC+T/K6qsrbklVbUegJ/rGTE
 RX5oqXc0ImmdVmMnmWEgVqIrcpWN/iWph/mdqXlRJ/YtA18R90L8U1X18 w==;
X-CSE-ConnectionGUID: f25XeKaMTxWwEgsjUtJX1g==
X-CSE-MsgGUID: cDZ/bz+NQnefOwkFW4sVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82145223"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82145223"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:12 -0700
X-CSE-ConnectionGUID: 8wAaqLgVTDahcJ+iHCM9Mw==
X-CSE-MsgGUID: Jn/vp4rfTsCXP2eQMLU9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201686289"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 0/6] Prepare GPU SVM for migration of THP
Date: Tue,  5 Aug 2025 15:59:01 +0200
Message-ID: <20250805140028.599361-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

v4: Minor fixes in patch #4, trigger CI to confirm absence of warnings

Francois Dugast (6):
  drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
  drm/pagemap: Use struct drm_pagemap_addr in mapping and copy functions
  drm/pagemap: DMA map folios when possible
  drm/pagemap: Allocate folios when possible
  drm/xe/migrate: Populate struct drm_pagemap_addr array
  drm/xe/svm: Migrate folios when possible

 drivers/gpu/drm/drm_gpusvm.c       |   4 +-
 drivers/gpu/drm/drm_pagemap.c      | 138 +++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_bo.c         |   2 +
 drivers/gpu/drm/xe/xe_migrate.c    |  88 ++++++++++++------
 drivers/gpu/drm/xe/xe_migrate.h    |   5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h |  10 +--
 drivers/gpu/drm/xe/xe_svm.c        |  49 ++++++----
 drivers/gpu/drm/xe/xe_svm.h        |   4 +-
 include/drm/drm_gpusvm.h           |   4 +-
 include/drm/drm_pagemap.h          |  50 ++++++-----
 10 files changed, 225 insertions(+), 129 deletions(-)

-- 
2.43.0

