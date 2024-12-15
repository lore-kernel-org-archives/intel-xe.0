Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD26E7716A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Dec 2024 17:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3FD10E013;
	Sun, 15 Dec 2024 17:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4HHpU2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1410E013
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Dec 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734284744; x=1765820744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WA+w/Nm+bPK9+lziMjGXSFjUC4EINkXAVIL3OmhTSxs=;
 b=Z4HHpU2zPzuFtX5IV9+fRpIQ8yAJyTX9Ja4w6XlDQZo1eNRjMWQLy4r5
 UEyreczoDROUNNDt4tnPZC2UFIS49RyMZFyhKTYaDoxiU/mH6UG1ofrSS
 +dUGrNlABLi27d3ud7V8PLX2qIj/wClY54RHwx9iGBGYcydtLettjJUCF
 UKRGxZlvd5dGv/Bm3A9KQr0pDqSjWGGXE7zq1axo62nCJzK1JVU1lkz4g
 SMp5Dx100iJ3+Aw0Aq295QnCUHFcy+5w+7x8S2Om1rb90SalMNzWNVV6X
 Yd9tHmnWnQzcauUD7vC0QlA3ZBLXQDBwm/yhOUlMLwkwIVcD/mE9jl5Y2 A==;
X-CSE-ConnectionGUID: S/73uMoCSgOPZZGkCyYV/A==
X-CSE-MsgGUID: wF/rRerGQImmXLH0BsPRUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="60061402"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; d="scan'208";a="60061402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 09:45:44 -0800
X-CSE-ConnectionGUID: BkYeBFyDS+yQT3naIdL4Yw==
X-CSE-MsgGUID: +VV8igGgSbC1EjPU8d348w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; d="scan'208";a="96901266"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa009.jf.intel.com with ESMTP; 15 Dec 2024 09:45:43 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v9 0/4] drm/xe/pmu: PMU interface for Xe
Date: Sun, 15 Dec 2024 09:42:30 -0800
Message-Id: <20241215174234.2857485-1-vinay.belgaumkar@intel.com>
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
where PMU events are used to monitor GT freq and C6 residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (3):
  drm/xe: Add locks in gtidle code
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile           |    2 +
 drivers/gpu/drm/xe/xe_device.c        |    3 +
 drivers/gpu/drm/xe/xe_device_types.h  |    4 +
 drivers/gpu/drm/xe/xe_gt.c            |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c       |   23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h       |    1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |    3 +
 drivers/gpu/drm/xe/xe_module.c        |    5 +
 drivers/gpu/drm/xe/xe_pmu.c           | 1091 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h           |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h     |  147 ++++
 11 files changed, 1311 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

