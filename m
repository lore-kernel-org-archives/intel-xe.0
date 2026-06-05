Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46142CD8C85
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41E611ABBF;
	Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNr4vOAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDCC11ABBC
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701679; x=1812237679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mZnxwwhGt0SfK/S38E9QnrXIlY9jhH1ni1tGTyfStPI=;
 b=TNr4vOAhbN1meBiRoEGmNzLGkx2N57Ez+qqDqTWfpNYZl+jAOq2ophik
 ca+OWxVcxbIX7KIB3Owop9OtCSIcrkfacq6mdfa6jU4lLS4QpLTBKdccv
 YaylXS8z2o6GUXkmmBXee1izwLxtPPib5inETgxjVE0zQFhfpbuBnAzzZ
 b2exjfiSilWmRfFs3ecKy8lgn5bQzTUHxHg7fcupQcFcZvKYaadmMff/K
 hZQex1eYgmsAhmzzxqbTBBYi4ElmmoQPoFUP44PoaO6cdHebkkJIobsNF
 xj/e7w2JS5OBP+mNu1xNrX9kacA3t6YYqLEWahZAY+bqr1HT/q6Elk83y Q==;
X-CSE-ConnectionGUID: 9Qj0SjkCQ/qhIn7x1X60pA==
X-CSE-MsgGUID: HgP+vUaeSAiaijpPLHx3xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449674"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:18 -0700
X-CSE-ConnectionGUID: +pwqmWTRQJyOVozlGRJoJQ==
X-CSE-MsgGUID: 60j5nXYeRR+9gei6sOxtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018281"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/12] Enable per exec queue MSI-X vector assignment
Date: Fri,  5 Jun 2026 23:21:07 +0000
Message-ID: <20260605232108.674580-14-stuart.summers@intel.com>
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

Stuart Summers (12):
  drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
  drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
  drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
  drm/xe: Assign dedicated MSI-X vectors to exec queues
  drm/xe: Add configfs max_msix_vecs attribute
  drm/xe: Change MSI-X assignment failure to drm_dbg
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
 drivers/gpu/drm/xe/xe_exec_queue.c       | 47 +++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  6 +-
 drivers/gpu/drm/xe/xe_hw_engine.h        |  3 +-
 drivers/gpu/drm/xe/xe_irq.c              | 38 +++++++++++--
 drivers/gpu/drm/xe/xe_irq.h              |  9 +++
 drivers/gpu/drm/xe/xe_lrc.c              | 15 ++++-
 drivers/gpu/drm/xe/xe_memirq.c           | 54 +++++++++---------
 drivers/gpu/drm/xe/xe_memirq.h           |  4 +-
 drivers/gpu/drm/xe/xe_sync.c             |  3 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 64 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++
 19 files changed, 308 insertions(+), 46 deletions(-)

-- 
2.43.0

