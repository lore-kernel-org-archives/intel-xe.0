Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689E3CDD548
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395A210E5EA;
	Wed, 18 Sep 2024 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIGp0qDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59E610E290
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677648; x=1758213648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kpnf+YS1J5wJQZgPDzlXmiViv8KvZ9xgsEKhDMciaxc=;
 b=kIGp0qDz8pwF7nTyN8AvjfksiudonFV9Y25TtKK6iE8Gh0NSFnm6+Iqt
 bBq90eveBDioIbHjqXIURgFrkKocLGfL+jWvdu+XICRGC5pqO6ZgMgAuO
 RtZi7blmxd0DRZ/Y0CkPwTHwBqM2pyHNG0Os7jirXOnfClGJio9v762Qf
 7hwxvUkPh6LqnJoR8RSD7eEzgUvlmj2d/+gKFqQarwLjaqSOnmEuxsDDP
 otP0201eTqlIQWHpj6A+K13t30OWGS8vwzc2Iw3sxw1NGcoI6xsYxU4oX
 I8dqo+vpXnIqxPY9Efdqzpgls8j5wNgKG6a3PDX+58v+9MdNh1le0bh1N Q==;
X-CSE-ConnectionGUID: ZZoKc55qTRSxcA+hI1bilw==
X-CSE-MsgGUID: lbvtDPF5QcqBvHxoZaqE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25751933"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25751933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:40:48 -0700
X-CSE-ConnectionGUID: kU77SN9yRriqFH8rutu3gQ==
X-CSE-MsgGUID: dQCXvq8yRPOZ52sSSVtlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="70091006"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 18 Sep 2024 09:40:47 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 0/7] FOR-CI: test null pointer fix
Date: Wed, 18 Sep 2024 09:40:39 -0700
Message-Id: <20240918164046.1086803-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_bo.c                |    4 +-
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
 31 files changed, 2781 insertions(+), 390 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

