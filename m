Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D12CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9103C10E4DB;
	Tue, 17 Sep 2024 17:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX0cWUNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F273810E4DA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595007; x=1758131007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QVHeFx948xkTO5Jp513eop+ntJT+bzvMsI3MMYnZbf4=;
 b=HX0cWUNyvkECTsQLc/Qzpi1cChcyySgZDqJoksSFHzvauWnfbG8a7Hd3
 pjpYV/tdIUw5vZDavq8M0bgOtxikhjHKyqmsWBg4hEKsnGRJixDduseEZ
 TOYr3UWiKQQlcvkgbSXWCHFZBGHabfacxJcxt38OSRxR6OpBEiQgA6c2u
 lNK8oiyHPN4ocZjqmAYFt8k/BY3gKnGdY8+SuZ/onvb9KM6gBT2ldpvO2
 sRzjxOrlQpDuXiLr4eVxmTeMZz9z88B2y1Sac1ij5gjwAOJV7CVtmj1Wk
 pNBHNbafTVO+/sw4v7FEzANZpuPmQESx2ZvshidsFtUhKczc4e8wqjgbq A==;
X-CSE-ConnectionGUID: 4Ftn+9weSb+kW//s/J8i4g==
X-CSE-MsgGUID: +bTLi8ryRUSk3sJfm2v2nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25665230"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25665230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:43:27 -0700
X-CSE-ConnectionGUID: i+3f0IsRQfyM5XI7oabyNA==
X-CSE-MsgGUID: P5xgJY7XTpSB27ZfJ0J8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="70058959"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 17 Sep 2024 10:43:26 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 0/7] FOR-CI: test null pointer fix
Date: Tue, 17 Sep 2024 10:43:17 -0700
Message-Id: <20240917174324.967870-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Do not review.
This is for CI to trigger null pointer fix test.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (7):
  drm/xe: Add null pointer check for xe_migrate_copy
  drm/xe/guc: Prepare GuC register list and update ADS size for error
    capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Plumb GuC-capture into dev coredump
  drm/xe/guc: Save manual engine capture into capture list

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |    8 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h  |  186 ++
 drivers/gpu/drm/xe/abi/guc_log_abi.h      |   75 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |   20 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |    8 +
 drivers/gpu/drm/xe/xe_gt_mcr.c            |   13 +
 drivers/gpu/drm/xe/xe_gt_mcr.h            |    1 +
 drivers/gpu/drm/xe/xe_guc.c               |    5 +
 drivers/gpu/drm/xe/xe_guc.h               |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c           |  157 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h     |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 1938 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h       |   61 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   68 +
 drivers/gpu/drm/xe/xe_guc_ct.c            |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h          |   26 +-
 drivers/gpu/drm/xe/xe_guc_log.c           |  101 ++
 drivers/gpu/drm/xe/xe_guc_log.h           |   10 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h     |    7 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   83 +-
 drivers/gpu/drm/xe/xe_guc_submit.h        |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         |  251 +--
 drivers/gpu/drm/xe/xe_hw_engine.h         |    6 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |   66 +-
 drivers/gpu/drm/xe/xe_lrc.c               |   18 -
 drivers/gpu/drm/xe/xe_lrc.h               |   19 +-
 drivers/gpu/drm/xe/xe_migrate.c           |   24 +-
 30 files changed, 2779 insertions(+), 388 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

