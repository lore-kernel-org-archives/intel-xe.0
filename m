Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74446CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0937510E6C6;
	Wed, 15 Oct 2025 00:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fv++u7Zw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8DB10E6C2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760488005; x=1792024005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p8GBo/bLxmmDY+wY5vv0pVZfky4/LsegQYRztJXZJuA=;
 b=fv++u7ZwRoNm5N6ooLv/e5jYUgW8PvsSb4Ki0phpqnXb7ISTeF21vXbt
 ms21P6Qes29+9maCl5OawsX75oGv2xOTQCmI9+/Ey+QSd1G5FbTjA4ipZ
 4v6GDytqH7EUMZl97YjmUQyeIYj2TjyxFjr/hyOog9S0zgMObkmLS5OOF
 QPzzzXuEq8EKNGIPGTEvb2A2NzDsAagcy4t+LN0b1Ihl0iG2KgPd2R3IE
 b/wiOkPSxWFN5tMSrOkmhYUZ6eakPKLWJ9fUzFMw/Y/0AaAqC5H+Eqi4W
 bVlG1mlInrr+PS0xh3VmwaGwLa18i6sQElfR4q/IKby1gzFWWjnilMNOO A==;
X-CSE-ConnectionGUID: B3yif7dFTEqtLgE6LjRaUQ==
X-CSE-MsgGUID: S8ES3bhdQQeWyrroGTtUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62551492"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62551492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:26:43 -0700
X-CSE-ConnectionGUID: P1F/iAUpT+OmuBnwkSsM0w==
X-CSE-MsgGUID: wR9vvuWDQhe5uEExOlAphw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181239923"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 17:26:41 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/4] drm/xe/vf: Minor fixes to post-migration recovery
Date: Wed, 15 Oct 2025 02:27:51 +0200
Message-Id: <20251015002755.720992-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

The series contains few minor fixes, mostly related to VF driver probe.

The fixes are not strictly related, but all go under VF migration category.

v2: Add fixing the currently broken GuC ABI check

Tomasz Lis (4):
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe/vf: Skip fixups on VF migration before getting GGTT info
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c          |  6 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 56 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c         |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 15 +++-----
 5 files changed, 69 insertions(+), 11 deletions(-)

-- 
2.25.1

