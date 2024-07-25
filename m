Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFCCC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955910E1DF;
	Thu, 25 Jul 2024 10:22:29 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592A110E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:27 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbV2182929; Thu, 25 Jul 2024 13:22:13 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 00/11] Add MSIX functionality to XE
Date: Thu, 25 Jul 2024 13:22:02 +0300
Message-ID: <20240725102213.2182896-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
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

This patch set enables MSIX workflow. The main changes are:

1. The code supports both msi and msix, some refactoring had
   to be done.
2. Since multiple interrupts are now available there is no need for
   interrupt aggregation in HW, hence there are new interrupt
   handlers.
3. MSIX interrupts are system resources so an interrupt allocator was
   implemented.
4. Adding MSIX infra to exec queues.
5. MSIX in GT also uses memirq, some refactoring had to be done to
   enable it.

v2: 
  - Rebase
  - Fix build and checkpatch errors
  - Fix commit messages

v3:
  - Rebase
  - Code review comments (Niranjana)
  - Proper memirq usage to distinguish interrupt source and status
  - Default MSI-X vector when unique MSI-X is not required

v4:
  - Rebase
  - Minor fix in msix allocator

Dani Liberman (4):
  drm/xe/irq: refactor irq flows to support also msix
  drm/xe/irq: add msix allocator
  drm/xe/exec: adding msix infra to exec queue
  drm/xe/irq: add default msix

Ilia Levi (7):
  drm/xe: add irq offset of engine instance 0 to hw engine properties
  drm/xe: move memirq out of vf
  drm/xe: memirq infra changes for msix
  drm/xe/irq: add hw engine irq handler
  drm/xe: move the kernel lrc from hwe to execlist port
  drm/xe: msix support preparations - enable memirq
  drm/xe: msix support for hw engines

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   8 +-
 drivers/gpu/drm/xe/xe_device.h           |  12 +
 drivers/gpu/drm/xe/xe_device_types.h     |  22 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  46 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  18 +-
 drivers/gpu/drm/xe/xe_execlist_types.h   |   2 +
 drivers/gpu/drm/xe/xe_guc.c              |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  50 ++--
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_irq.c              | 324 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.h              |   7 +
 drivers/gpu/drm/xe/xe_lrc.c              |  32 ++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 drivers/gpu/drm/xe/xe_memirq.c           | 123 +++++----
 drivers/gpu/drm/xe/xe_memirq.h           |   8 +-
 drivers/gpu/drm/xe/xe_memirq_types.h     |   6 +-
 19 files changed, 541 insertions(+), 133 deletions(-)

-- 
2.43.2

