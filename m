Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39D1C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888A210E09B;
	Wed, 26 Jun 2024 10:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="cNL67GcO";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000BA10E09B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 10:34:07 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719398048; bh=RtaJIM2nsM48kjMuN1AAP+5qSzzoKI/g5/FpLRkErPI=;
 h=From:To:Cc:Subject:Date:From;
 b=cNL67GcOdF4PmUPPA3dsR+YpI811yRDVfZvc81Ae1Poyj6UnzZyRNYN3ivaTdK/hr
 rwr0c6biwIODWcq7/ftXBUBBDmqt1a7KMdZK4/edo/xb1AqHwN0N9taQ/Xpz0QgIp2
 6fs2npahI0U0rp26KprjnAaPxIg8RH1NX3GVOIXdChzKLGmW7tOgaCX/MVHnbPVvDS
 su0Ccz19HCeupObR1Utj+Pa4DeFNgscmuCVxCuLuf4v41kV34wqrD6XmXWLF/Ftyhv
 K4BFvFEtXRAb8bGJFwHCTUm1xmJmPxwnOCHxpy6ApdVKdGKy4ufGXDosKLrUwVg97W
 6x1GgyPsb4osQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45QAXuC02801767
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 13:33:56 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45QAXuMp2801765; 
 Wed, 26 Jun 2024 13:33:56 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai
Subject: [PATCH 0/8] Add MSIX functionality to XE
Date: Wed, 26 Jun 2024 13:33:37 +0300
Message-Id: <20240626103345.2801735-1-dliberman@habana.ai>
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

Dani Liberman (3):
  drm/xe/irq: refactor irq flows to support also msix
  drm/xe/irq: add msix allocator
  drm/xe/exec: adding msix infra to exec queue

Ilia Levi (5):
  drm/xe/irq: add hw engine irq handler
  drm/xe: move the kernel lrc from hwe to execlist port
  drm/xe: move memirq out of vf
  drm/xe: msix support preparations - enable memirq
  drm/xe: msix support for hw engines

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   8 +-
 drivers/gpu/drm/xe/xe_device.h           |  12 +
 drivers/gpu/drm/xe/xe_device_types.h     |  12 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  41 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  21 +-
 drivers/gpu/drm/xe/xe_execlist_types.h   |   3 +
 drivers/gpu/drm/xe/xe_guc.c              |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  22 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   2 -
 drivers/gpu/drm/xe/xe_irq.c              | 290 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_irq.h              |   7 +
 drivers/gpu/drm/xe/xe_lrc.c              |  23 +-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 drivers/gpu/drm/xe/xe_memirq.c           |  46 ++--
 17 files changed, 391 insertions(+), 108 deletions(-)

-- 
2.34.1

