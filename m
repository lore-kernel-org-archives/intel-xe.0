Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F61CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 23:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584A410E118;
	Thu,  9 Oct 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLVmbv0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42B210E045
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 23:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760051087; x=1791587087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mf1YC2ZJJQu3ETmSgmqTVUiGKhqyZH+WQg/zGkF2sOs=;
 b=OLVmbv0Vu/FSw/2NWwwBcPwgHzCmsSRqB781wlUVIPMNs7mbpQcFG7NT
 IPO0CivGOYPE7TnFIdce0BN6GSFOAmTqAmENgSRDJY4G75BoVDMLUD7vk
 MIVGSe6EhzopUrvMrY4/947FRuG+zrT0l6/xh8eEl3U8OU82YommgJWa2
 epGmfvCVMmZTx5VRdwp/JbWw4nSREkeikF1ERS+Wv6YuWDlsc8QORfqpJ
 7dhr0ZnU8xDaSYypbBuu2UzvYZ3jbGuKmTRUn0sdJ9ZO4Eq+zpvFstdIv
 4EogeNJ2YZk+C9VIt6Lcpz0ey07PtAiKs3C4SELdI3VSCcALax5jsqEqn g==;
X-CSE-ConnectionGUID: fpAwGAVXQjenVytomGfVBA==
X-CSE-MsgGUID: Nxf0eIR5T/qic7nqpmSoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72884854"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72884854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:04:46 -0700
X-CSE-ConnectionGUID: mq6mFNHZSCmN0UxhZT7aAQ==
X-CSE-MsgGUID: 4vLE71a3QomNoeG9X1g9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="181601039"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2025 16:04:44 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/3] Fix copyright
Date: Thu,  9 Oct 2025 23:02:27 +0000
Message-ID: <20251009230239.2830207-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Fix copyright and minor refine for the same file.

Shuicheng Lin (3):
  drm/xe: Fix copyright and function naming in xe_ttm_sys_mgr
  drm/xe: Fix copyright in xe_ttm_stolen_mgr
  drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64

 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c    | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
2.49.0

