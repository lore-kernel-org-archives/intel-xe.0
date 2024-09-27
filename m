Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC20CEBF60
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 00:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA210E0FB;
	Fri, 27 Sep 2024 00:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRJjEP2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512110E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 00:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727396761; x=1758932761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xwjKUIfkwC6hi2SQ4JJekE86Ocf0IHjmTmT+EXHjaCU=;
 b=XRJjEP2hLHFxdVj46WrraUzcK8V38H5VGWoiYT4vHtmljJ7emwzJi1P+
 5SA+8ZGUyEK46IjhEZEe/mZ37ekIslpeL2QJKrHMjhvEFYj5CHi5GXglb
 0xpDASNCR2TGp3iw96hrfdixFagj9WZ7O1RnDZHtzUDriKyv/WuekdF7X
 JORxa/+Mri1/yynh28fE/sAbBJvT9yLcvT52rvNexDrQd0ZRu8C5oK/G5
 FWAOcXCF+g2JAmtC4iodwc9MAak7i/FyNf3YYKTdAqZmvBGMtQ2U55/Lt
 CHDsjbdlnsOmnzXleGKcMeb4Nl38/dz6DheVkzeDKB8GO5MV/hdMidmal g==;
X-CSE-ConnectionGUID: dHsKdFpNQHS8FyG5oPebdQ==
X-CSE-MsgGUID: tXplD9ARRUy9iBTyv7dWlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37909816"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="37909816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 17:26:01 -0700
X-CSE-ConnectionGUID: ogZDxoSZSneoXXZqHZtKhA==
X-CSE-MsgGUID: jYRTLOn/QtaVzIX78SsInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="72768105"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 26 Sep 2024 17:26:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] drm/xe/pmu: PMU interface for Xe
Date: Thu, 26 Sep 2024 17:23:41 -0700
Message-Id: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |  20 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |   1 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 960 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    | 143 ++++
 include/uapi/drm/xe_drm.h            |  17 +
 11 files changed, 1186 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

