Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8F4D6CFAB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 23:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFD810EB00;
	Thu, 22 Jan 2026 23:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxcOk/Ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32710EB00
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769124232; x=1800660232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hRIVnwAezwuE/NeVEGOfnbhDB3lp4dEx9EN6GFm+O3o=;
 b=GxcOk/NsFB9TKJBrpr9UqjzRxXafXMAmu/krAWxGk+CQvgxNVtxL/ple
 NATTIgqa5K8Dj3nre4c851NH5X/QiVEkCduF84jehxhT3DANLbjoKH5nU
 ML8sBuVUoFcSXAN0ZZU9i7qPVAyH3YvjJLzmYfV+0tkNPasrxNqiSHCNu
 uD+VQEqzWvsgnZEvlZckS0XK1JMtQW4alIL0nPHwCU0QtHvQGrDgJ5ZCv
 469CvHHb5R/P+Z5g95f+3LbqhBZdlczfNhBLvFOZQURHzqIwtd/ndv2O6
 a3bnJr9gY/B96h2Jxh/G+I1BWzVmVYoh5fUBGWePSCjkO65ayGPEuLu0p w==;
X-CSE-ConnectionGUID: 3Za5Mm5DRpSXHH7C+toL7Q==
X-CSE-MsgGUID: r3n0+7VcTTy9QNIO8Fk65w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81002202"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81002202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 15:23:51 -0800
X-CSE-ConnectionGUID: Ff5RBtHGQByLntQLyAgmNg==
X-CSE-MsgGUID: Adtw4c6gTISixpmxqfwijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="205979355"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa006.jf.intel.com with ESMTP; 22 Jan 2026 15:23:52 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v6 0/2] drm/xe: Separate out GuC RC code
Date: Thu, 22 Jan 2026 15:20:55 -0800
Message-Id: <20260122232057.150725-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This allows us to independently toggle GuC RC feature.

v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)
v5: Review comments (Riana)
v6: Some more review comments (Riana)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 Documentation/gpu/xe/xe_firmware.rst |   3 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_gt.c           |   1 -
 drivers/gpu/drm/xe/xe_guc.c          |   2 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 118 ++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c       | 144 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h       |  17 ++++
 drivers/gpu/drm/xe/xe_oa.c           |   9 +-
 drivers/gpu/drm/xe/xe_uc.c           |  10 +-
 drivers/gpu/drm/xe/xe_uc.h           |   1 -
 11 files changed, 218 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

