Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB87FF885A
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 00:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78710E070;
	Sat, 25 Apr 2026 00:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDND/tsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD310E070
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777076084; x=1808612084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DBLGzdFnEtAFtMCsaY8om88Ld5SIgpSTXSz3AUwA58A=;
 b=YDND/tsSKrXDjbz0FBvA96cA7kUpeeTzBLXI3vOCfzyDCCswU9hclAXQ
 oIsOqNeWOxj15MTiL3oj5tvil250vyXaDHBZOvcgbI2emieRZehip0VSh
 WpHY3MKFeCyAzwhYiGj2fTZxVMF+etefwR/aABYifAg8MlxcGoyFcVboc
 C8M3mw5B5G1ubYR6dYqdx0B+rDmm4vNc4HAXULTC/8R23CqDsD+UWPOyg
 Q4YLnhPr96dDtPkG8GZtCoZdEyXkjQUT0xM+Je0sGC13Lmg/MQgnCsLSn
 iHk0Dp7WrZUNRvWYj2uv1/NK4xpzSjqthOcjB6U4bV/t1+Ml8AvIBG02E g==;
X-CSE-ConnectionGUID: I/p2YzMGTA+3bD1Be8L6BA==
X-CSE-MsgGUID: 7Vcr6+d1Sm2DkwcMtTcBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78081508"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="78081508"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 17:14:43 -0700
X-CSE-ConnectionGUID: p9vTs5DZR3OIAKUy2gZKdw==
X-CSE-MsgGUID: ZsAFUhSdQ5e6HbvPNQK/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="238156001"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 17:14:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v5 0/3] drm/xe/oa: Wa_14026633728
Date: Fri, 24 Apr 2026 17:14:36 -0700
Message-ID: <20260425001439.2148765-1-ashutosh.dixit@intel.com>
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

v5 though v2: Change to Patch 1 (see changelog in Patch 1)

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 123 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   4 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 70 insertions(+), 58 deletions(-)

-- 
2.54.0

