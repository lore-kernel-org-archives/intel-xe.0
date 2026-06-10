Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D0CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C44910EBF9;
	Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMg9yDPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A709210EBF9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126919; x=1812662919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LxVEpSwT5yilCmZ1yKd9a72b3H8yw/ajBXZ5Fr3qu20=;
 b=UMg9yDPu8NoIyGeeXNp5DKEocCoLXorFLTfOfx/F3I+eJEj7TBmF9E3L
 SoG8x9dLo2FRf2m+kucykoXXTo2yaW3PCPxd8wQ8W1cTTopWNfrMIiN+S
 sgY2St7o4Ive0xm7JP8g0s7UMNGBu1cjL1TNNSae8UDmi7YVjPXR+rvvF
 0oKClE4qi5AAGxKK1mV8bSsoWtOiHpqzJnMpoWKM+zDqVDl9TAgk2XgOc
 Xr8X83DJmfMonJp/yeJYb1HQdDndafZcXU5MAuh8id+ZA3WmYC9ubf7dj
 v8zuwVeTyF1ra/byE1n2FM04gWeatn7LezBJhlLG9xqGt9TgH6WLl6oUt A==;
X-CSE-ConnectionGUID: es+KtDN8RUuEOUvyBZHRQA==
X-CSE-MsgGUID: mD6FA1nPRaixwu9/XLdhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934679"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934679"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
X-CSE-ConnectionGUID: GmwVAwB0SMOx4nkHGjnlDQ==
X-CSE-MsgGUID: pmpukKtySCOYDg+826l6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292046"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/11] Enable per exec queue MSI-X vector assignment
Date: Wed, 10 Jun 2026 21:28:32 +0000
Message-ID: <20260610212833.153366-13-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for per exec queue MSI-X vector
assignment as well as a per exec queue wait queue in the
wait user fence ioctl. MSI-X vectors are dynamically assigned
during exec queue creation up to a set maximum. Once the max
is reached, everything else falls back to the default vector.

These dynamic vectors allow us to wake up a targeted wait
queue and user thread instead of broadcasting out to all
potential user threads like we're doing today. This is interesting
when we have many user threads outstanding as we don't want
to wake them up in a storm for each interrupt coming in.

Additionally, there have been changes in the memirq code lately
to isolate some of the interrupts handled here. Starting with
xe3p, however, we have new interrupts available for compute walker
post sync interrupts. Currently these are enabled for legacy MSI
use cases, but the bits are also available for MSI-X. Enable
those bits here.

v2: Drop the drm_dbg change patch
    Directly call xe_hw_engine_handle_irq() from xe_memirq_hwe_handler()
    Only add to ufence_list for user queues

Stuart Summers (11):
  drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
  drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
  drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
  drm/xe: Assign dedicated MSI-X vectors to exec queues
  drm/xe: Add configfs max_msix_vecs attribute
  drm/xe: Remove memirq status and source checks for engine interrupts
  drm/xe: Add per-exec-queue user fence wait queue
  drm/xe: Track all exec queues in a device-level ufence list
  drm/xe: Hook up per queue thread wake to the unique MSI-X vector
    allocation
  drm/xe: Enable per-queue ufence wake in ioctl and wake function
  drm/xe/memirq: Enable compute walker post-sync interrupt

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 +
 drivers/gpu/drm/xe/xe_configfs.c         | 71 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h         |  6 ++
 drivers/gpu/drm/xe/xe_device.c           |  2 +
 drivers/gpu/drm/xe/xe_device_types.h     | 11 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 51 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  6 +-
 drivers/gpu/drm/xe/xe_hw_engine.h        |  3 +-
 drivers/gpu/drm/xe/xe_irq.c              | 36 ++++++++++--
 drivers/gpu/drm/xe/xe_irq.h              |  9 +++
 drivers/gpu/drm/xe/xe_lrc.c              | 15 ++++-
 drivers/gpu/drm/xe/xe_memirq.c           | 59 +++++++++-----------
 drivers/gpu/drm/xe/xe_memirq.h           |  4 +-
 drivers/gpu/drm/xe/xe_sync.c             |  3 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 64 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++
 19 files changed, 310 insertions(+), 51 deletions(-)

-- 
2.43.0

