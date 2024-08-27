Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E4C5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB5710E39C;
	Tue, 27 Aug 2024 16:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/kPUnZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D5210E39C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724776987; x=1756312987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EO8Jtq6kdG19Va9V3CV5OnC3OthewNyovMRC6h9RHm4=;
 b=c/kPUnZy+BMr0uPl8FTQPb5j6mV5aBuR6KxlS03Ff7Bz8x6zq7iqSCJl
 AygBrOxSRjFi0YQ7oBk1rivLh5ZRtqZ3fGRVCSWNFPmpqE1Szx4yS+X6J
 dqwGHqHkruZviG3iV3seABE8T+H35IC3NnfO3xx4xEZKnaRxl0OXaApuv
 HJcBj74aHA1Gm2rNq4A8ZJU21ZNTRoXi1KQHHPJVxYxgj1V40RvMGl2ZO
 SAMJUp1aO2DjmoCFx08iFYwxwFDUKLzhThhtPNOd3ATxddWMdWoNsx0sx
 SqNh4jLitb7iBZnvFXQIsJdg/KS1rg3XuF2L6jydiwEIiGxlWq4t/quGd Q==;
X-CSE-ConnectionGUID: X7zkzwSmQziYSHvfP7si+Q==
X-CSE-MsgGUID: w8CejDqRQ5ei1DmNWJtaGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23143715"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23143715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:43:06 -0700
X-CSE-ConnectionGUID: 1eNCON7FRaSIqFcU5KOTMw==
X-CSE-MsgGUID: DR0ND0LgTVCxG74rt9acYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63424188"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 09:43:06 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/4] drm/xe/pmu: Enable PMU interface
Date: Tue, 27 Aug 2024 09:41:03 -0700
Message-Id: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
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

Port PMU event capture capability to Xe driver. This is being
requested by users of tools like gputop or turbostat who
use these PMU events to monitor GT freq and residencies.

First patch is from a previously done review-
https://patchwork.freedesktop.org/series/119504/ and the rest
of the patches are ported from the i915 driver.

There is an attempt to break up the code into a few chunks
so that everything is not a single blob. Basic PMU setup is
done first, followed by timer init and then C6 and frequency
events separately. One change is we now provide a modparam to
control sampling frequency.

A patch for IGT tests for this is in progress and will be
posted in a couple of days.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (3):
  drm/xe/pmu: Define and init a timer
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |  20 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |   1 +
 drivers/gpu/drm/xe/xe_module.c       |  10 +
 drivers/gpu/drm/xe/xe_module.h       |   1 +
 drivers/gpu/drm/xe/xe_pmu.c          | 931 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  28 +
 drivers/gpu/drm/xe/xe_pmu_types.h    | 142 ++++
 include/uapi/drm/xe_drm.h            |  43 ++
 12 files changed, 1182 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

