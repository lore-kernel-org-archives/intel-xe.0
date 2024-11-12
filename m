Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9FD597A5
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52210E0BA;
	Tue, 12 Nov 2024 20:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JULnE7rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1810E0BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731444893; x=1762980893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LoRF5yTzitx8D9yMhOjkglq+UJvloteSPfctgqvTbFE=;
 b=JULnE7rE24MZWPpAGApFJnUtGACGE8x5alhLMjQDs2AOdjMu8ZisM6nF
 J5fQkWqtGoJKIbMv2sdSN8F3WzZhynx9dphrD6vYNNkiWz9pgVnSLxxw3
 xMWL9hUJUluEWewLbKRo49ERf1MedXt3Xp+ljQGY3pidSUZ2vBTlF7Y1L
 6LBSfUY/dpx4aHOcLSctZBVWR5qnFBQV2KLtGBymCckHy/FYju70Ec0bJ
 LMc9twv7XBt3JubB3shdtUqqNZP9F6mGD+4ILg0Go/S3CuMXbMAGzg12X
 bIqxQT8SOQkXOQnZhA5DjoPCKSWtDd2saVbIvzta9xEcJmwlN68snxrew Q==;
X-CSE-ConnectionGUID: PTKiL3AESc69UrYT5vneDA==
X-CSE-MsgGUID: T1CwfcYwR5C+ftIoyqeTyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41866799"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41866799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:54:53 -0800
X-CSE-ConnectionGUID: Z/Z8pIyjSjimh/cz7lz5PA==
X-CSE-MsgGUID: 0nAgbDkxTpimHshZ9lU9jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92423338"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2024 12:54:53 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] drm/xe/pmu: PMU interface for Xe
Date: Tue, 12 Nov 2024 12:51:39 -0800
Message-Id: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |    2 +
 drivers/gpu/drm/xe/xe_device.c       |    6 +
 drivers/gpu/drm/xe/xe_device_types.h |    4 +
 drivers/gpu/drm/xe/xe_gt.c           |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |    1 +
 drivers/gpu/drm/xe/xe_module.c       |    5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 1044 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  159 ++++
 10 files changed, 1267 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

