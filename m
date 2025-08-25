Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F56CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 22:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4E10E552;
	Mon, 25 Aug 2025 22:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Os144/Y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE910E552
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756161145; x=1787697145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CM8QyCE8DXnQHrjFfgnDnlkHGOJJ14Bq7shYn6YtT+Q=;
 b=Os144/Y9tijE90g1e+WP87LSyDszaJTLbcjniQ5o7Ht3TCMB6GouBCoh
 BIvE/LGXLPvatJ+ErkXj3YgMkDqCoXUURXOZN5TGzf4YcG4P1mdZNhYjC
 tzLcjWZvp+CUCjEA/r4Yv7jdrJNbEeEhtAx6TdDWrZ3PQ/W35pON9Un3v
 daVj3Ibz10KEU3gzaAea05tYAjIQSHxQGDAhnXtoTigS/e2Ese2QcT7IO
 J2ma0iJOJDXpKhPK0OFiyoo7SmAWx8oCuIOJ8gCPg/Muv4ggf4t1/DkWG
 rCoxvkbU8wt4ZtrP1Rk0zihG+QmIwAhFOLR81dU/rKvhWCF9Vr95eiQXz g==;
X-CSE-ConnectionGUID: rxxbCeh9SzS2C4CiNZv4pw==
X-CSE-MsgGUID: RGG+lEjXSPOgqoN3BT+MHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69818297"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69818297"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 15:32:24 -0700
X-CSE-ConnectionGUID: r+v6TmFGRe6qTxP7hA0yzw==
X-CSE-MsgGUID: 4/FvC+vvRWWiibPJmDnlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170243493"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2025 15:32:22 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 0/3] Ensure GT is in C0 during resumes
Date: Mon, 25 Aug 2025 15:32:16 -0700
Message-ID: <20250825223219.1351786-1-x.wang@intel.com>
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


Xin Wang (3):
  drm/xe: early-return for SR-IOV VF in C6 funcs
  drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
  drm/xe: Ensure GT is in C0 during resumes

 drivers/gpu/drm/xe/xe_gt_idle.c | 29 +++++++++++++++++------------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 drivers/gpu/drm/xe/xe_pm.c      |  8 +++++++-
 4 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.43.0

