Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC28E8B387
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 01:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9253010E26D;
	Wed,  4 Feb 2026 01:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww2eUP/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458910E26D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770169554; x=1801705554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4EyvDnAQ6B4xLBca0y6JJ5pqr+XNXEeWoYc6cKdUDy0=;
 b=Ww2eUP/J04l6af/yJ+wHit16Euuotm05ipjl6E44QuRxCyl0OOS5lsPb
 H82R9TiWkzQcMc8VZx+ZaVipWrO75CqLTzmxSFLHwd5Y0PvDsjLRX3M0z
 uUjItbFvuSsbf2pDGKVHcafBDatcpB7wY0cJy6kfKXYHfL/dmbtutBIDh
 0X4hnpPmxDEcPREzHpuXlmuod0O+gCGI/my35L+pR1NzwUwloUuKSe/Ds
 F0kXfoJkLGnNlXAugAsHGSiSqPTRB8JFhyf3Z3Q7IrbqAgHsPHgb7Dl27
 aSPK4gQA9GIKO35R4YAuqpH+uO5sPh/ib7qXOGJ8PjgSCq982IGxDBxEV w==;
X-CSE-ConnectionGUID: psDp9ecmS6u5JiDf19e+Vg==
X-CSE-MsgGUID: HrUUcZzFSbqHCNwDh8WL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71250535"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71250535"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 17:45:53 -0800
X-CSE-ConnectionGUID: EGoAY93NSKGp2xl4Dqkm/w==
X-CSE-MsgGUID: 8tc7ahkBQsqJoqLbNKgVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214500358"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2026 17:45:53 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 0/3] drm/xe: Separate out GuC RC code
Date: Tue,  3 Feb 2026 17:42:31 -0800
Message-Id: <20260204014234.2867763-1-vinay.belgaumkar@intel.com>
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

This allows us to independently toggle GuC RC feature. The previous
review for this series was at-
https://patchwork.freedesktop.org/series/159128/

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
v2: Address review comments (Michal W)
v3: Add info about guc_rc, guc_pc and gtidle interaction (Michal W)
v4: Address remaining comments from v3 (Michal W)
v5: Review comments (Riana)
v6: Some more review comments (Riana)
v7: Some nits and other comments (Michal W)
v8: Change FW_ALL to FW_GT in separate patch (Michal W)
---

Vinay Belgaumkar (2):

Vinay Belgaumkar (3):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Use FORCEWAKE_GT in xe_guc_pc_fini_hw()
  drm/xe: Add a wrapper for SLPC set/unset params

 Documentation/gpu/xe/xe_firmware.rst |   3 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_gt.c           |   1 -
 drivers/gpu/drm/xe/xe_guc.c          |   6 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 118 +++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   6 +-
 drivers/gpu/drm/xe/xe_guc_rc.c       | 160 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h       |  18 +++
 drivers/gpu/drm/xe/xe_oa.c           |   9 +-
 drivers/gpu/drm/xe/xe_uc.c           |  10 +-
 drivers/gpu/drm/xe/xe_uc.h           |   1 -
 11 files changed, 239 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

