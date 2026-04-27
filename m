Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07C8FF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCC10E06C;
	Mon, 27 Apr 2026 20:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NN0nkox8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB53410E06C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777321620; x=1808857620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6nSX1/e4BeE2FVvW4mg3BdhawvHSzi/Ydelg/d18TY=;
 b=NN0nkox8Y8kn8WWPv8+ZtxQhVlImx1O8fZIc2e4F6Lgx/teGHy0kCNNB
 qGqL5Zinc99CL1EsUaUiaaylfHjCshTrvcf6EaJcplv8Wbg0sUkBETKF4
 xccw7HRWW5bupxJC7tG+8mtPfY4NnLoRHxUzE3w2kiPTUPIWrGLdpU1Il
 yHu9rih75DiHtx/qNeDo5US0QIxpjmv1iWrA0mihxMn0RyDm684zv96EU
 MSvB0rXzsPVOJPcyVcVoW0QAVWW6i9ar8RsPuHpnkylzS+URCFfoSUDtq
 9inlXpv4WtZ4An2u5ieIAya+JE9s2RMSJ22ik64CqaWJTfTyuRcsWYQ/l Q==;
X-CSE-ConnectionGUID: rDetRO1nRcOBcCruwbV37g==
X-CSE-MsgGUID: zy7uzxGURDWFBvOj6q0oOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78114617"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78114617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:27:00 -0700
X-CSE-ConnectionGUID: wWyQNHeTT7m4nkxSJ6Fqlw==
X-CSE-MsgGUID: gPoTLaahQUGl+D0bsYC/2A==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v7 0/3] drm/xe/oa: Wa_14026633728
Date: Mon, 27 Apr 2026 13:26:52 -0700
Message-ID: <20260427202655.2493474-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

v7 though v2: Change to Patch 1 (see changelog in Patch 1)

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 125 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   4 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 72 insertions(+), 58 deletions(-)

-- 
2.54.0

