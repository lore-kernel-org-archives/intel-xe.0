Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E937C982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C0C10E5CF;
	Mon, 21 Sep 2026 09:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj3r/lsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710E910E59E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789983235; x=1821519235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xqp9PIVw8aGyhICR02lLeXzp4bdOHyQ3zmTYg10qE1I=;
 b=bj3r/lsA2UMiqwHtoKw8KAKC+lxzx159LhqptubGauBsKmiFEWV6TIEx
 Axmxl6grNe/wptP0ABDBtjFcHqk4kDrQy+Dz/g4E0kZjgQJZFvk0fmQ9T
 l7qenMJ/STlXGwZosblJZz3KpG2gjothyteuizi+231PsYTmaqISq9PD7
 bhaECM4KBnQRUvh2n/58v7SF6FgcUukep6xgpc+kjtX6dPIyef0jo0F/d
 M7HiIA4OLhMyv6cG46KjQYE+vWs5kavAB3nxKCjvHOhCOs8gHCWlh+wQU
 YNWTxWby0Lqnt1fE45a/32v0JuZmrzW1MJe5kgOdU2QXPHKf3zyPbrt+g A==;
X-CSE-ConnectionGUID: /Ys8Fe+aS1mXCYrWiQJAlw==
X-CSE-MsgGUID: mcrmQ5cISyCl7YT6Unw5og==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="988886"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="988886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:33:55 -0700
X-CSE-ConnectionGUID: 7JWGmYnyRwqP1S7lXGttLw==
X-CSE-MsgGUID: GFDt6egbQrSftQJnhGO06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272734477"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 02:33:24 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/4] Refresh TTM LRU on SVM prefetch
Date: Mon, 21 Sep 2026 15:06:52 +0530
Message-ID: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
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

Himal Prasad Ghimiray (4):
  drm/pagemap: Add helper to access backing devmem allocation
  drm/gpusvm: Add devmem callback to get_pages
  drm/xe: Bump prefetch BO LRU via GPUSVM devmem callback
  drm/xe: Bump prefetch BO LRU for already-valid ranges

 drivers/gpu/drm/drm_gpusvm.c  | 90 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_pagemap.c | 15 ++++++
 drivers/gpu/drm/xe/xe_svm.c   | 62 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h   | 18 +++++++
 drivers/gpu/drm/xe/xe_vm.c    |  6 +++
 include/drm/drm_gpusvm.h      |  6 +++
 include/drm/drm_pagemap.h     |  7 +++
 7 files changed, 181 insertions(+), 23 deletions(-)

-- 
2.43.0

