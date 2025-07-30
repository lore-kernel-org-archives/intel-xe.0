Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73534C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50810E20B;
	Wed, 30 Jul 2025 14:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdsWT0z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A0410E20B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753885449; x=1785421449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c1vBveuxgIYbyzFpI4QvDL5oyjL+04TRz1RKyJmKTWk=;
 b=gdsWT0z+fjQbTQcdDwX+i2gZtusKTCJl5g4SOI+nR7PCIdqc94ihJAUa
 t8nxjXl+WcRCgSqfYnv61OD6jIk/Pmae9tYNrx2J89FVYa6N8wlHtifa4
 IH9Zy6ImBh0rFbln8313UvOuv5eFxPpxAjR09PvPpmURQTEv3pq3vh653
 UwLZo+YWjyjQ912t8JFXmkd3EzcJBOz9fWzNQi4b7/bo1PGmhU21hvUo3
 HZ8fhrXKhi5GWo02szqe9Sq4dELy/Y1UPM9lR155J30uQdxtVfctn2k+D
 ZONS7Mun9mMyjIFLN6Ppxp7oez1lESRLO84OVeyqCw19Rk7P76ruF6+FG g==;
X-CSE-ConnectionGUID: fsUvbVQaTzawMVUnQYto3Q==
X-CSE-MsgGUID: 5sXwj5IKSFa5loZeqc2jNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55392771"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55392771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:09 -0700
X-CSE-ConnectionGUID: 7s+ZgFO4SZCnUHdVwF3OCw==
X-CSE-MsgGUID: sdRZUz5rT7G/83tTelMtnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167254506"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 0/6] Prepare GPU SVM for migration of THP
Date: Wed, 30 Jul 2025 16:22:45 +0200
Message-ID: <20250730142357.3851167-1-francois.dugast@intel.com>
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

v3: Address feedback provided by Matthew Brost in v2 and style issues

Francois Dugast (6):
  drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
  drm/pagemap: Use struct drm_pagemap_addr in mapping and copy functions
  drm/pagemap: DMA map folios when possible
  drm/pagemap: Allocate folios when possible
  drm/xe/migrate: Populate struct drm_pagemap_addr array
  drm/xe/svm: Migrate folios when possible

 drivers/gpu/drm/drm_gpusvm.c       |   4 +-
 drivers/gpu/drm/drm_pagemap.c      | 134 +++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_bo.c         |   2 +
 drivers/gpu/drm/xe/xe_migrate.c    |  88 ++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.h    |   5 +-
 drivers/gpu/drm/xe/xe_res_cursor.h |  10 +--
 drivers/gpu/drm/xe/xe_svm.c        |  49 +++++++----
 drivers/gpu/drm/xe/xe_svm.h        |   4 +-
 include/drm/drm_gpusvm.h           |   4 +-
 include/drm/drm_pagemap.h          |  50 ++++++-----
 10 files changed, 223 insertions(+), 127 deletions(-)

-- 
2.43.0

