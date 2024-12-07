Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44346E77173
	for <intel-xe@archiver.kernel.org>; Sat,  7 Dec 2024 00:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A8710F1E3;
	Sat,  7 Dec 2024 00:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNr23RfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC26A10F1E3
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Dec 2024 00:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733532936; x=1765068936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOf4GBqJxFEXjO4YbSduzn/JkO5xWs/lh+eOAerFq6o=;
 b=LNr23RfKZRTxt8r5qRIW9OXV3KLaCscSt/++ln/d3Z1ZAmC63y1kx1IN
 ZIi172hOpgJEMYHs+cy7xHos6nRZwKot7PHrplmsOP1xrDDBnFmqKmrO2
 H6nVxRLL+KCe+z54CY7TAQdSekJFi4LWgrYGo1r1zArFI7ONJ4+Fkh8w+
 kxBLboRi+MEqiN6Odtr7Ptp/5jfJdNtZsqOSyFDgxxlioHTQ3KTn6B+pQ
 Gkq+ty+QoyFhvBLMUW5emSs2H0Ter9/y9/5Xz7oOYnT9Ng6pD7ZxDMmMD
 vRU7K3sR22rcEHybwYLY0JI9+baALDGenUHn5YDLJmQ4hX0492mHZWRYO Q==;
X-CSE-ConnectionGUID: pxausqNuTJiEKX4RYXDWbg==
X-CSE-MsgGUID: pqeAL7jyTrqQ3Vk7IeGI5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34023302"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="34023302"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 16:55:35 -0800
X-CSE-ConnectionGUID: R+yGgF+wRAeO2PuEZPaBoQ==
X-CSE-MsgGUID: WqniP6f8QMKnw50gG+GvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="99363983"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa004.fm.intel.com with ESMTP; 06 Dec 2024 16:55:35 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 0/3] drm/xe/pmu: PMU interface for Xe
Date: Fri,  6 Dec 2024 16:52:17 -0800
Message-Id: <20241207005220.839003-1-vinay.belgaumkar@intel.com>
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

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |    2 +
 drivers/gpu/drm/xe/xe_device.c       |    3 +
 drivers/gpu/drm/xe/xe_device_types.h |    4 +
 drivers/gpu/drm/xe/xe_gt.c           |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |    1 +
 drivers/gpu/drm/xe/xe_module.c       |    5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 1091 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  155 ++++
 10 files changed, 1308 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

