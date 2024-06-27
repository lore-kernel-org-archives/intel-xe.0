Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DADC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494C210E035;
	Thu, 27 Jun 2024 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="IWLQhfaW";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471C10E035
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:10 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492068; bh=muOgNKhNPqVcgULmabkmoIMnfTL6AFCxhXTejG2yU+4=;
 h=From:To:Cc:Subject:Date:From;
 b=IWLQhfaWTKBrXufZt/I33RNq87vYSZ2CxCW0RNnOCtPgTdbsJyNmAQGR7uPrjA6Ap
 DhpIK/XZUt/Pp+kkN7/EjQmaDjCd1DOHTJNU4KuxjCG8vMmTRTQYPckxG906n4KT8x
 BcivVts7e3zYDtdxeUnZGq4oXiq58JbSvfg6pcMnOV3Pgj6IWguVGzZwxJybXBgerg
 RCUr+A1i0rI3IEwq0Fp1IkxE+UW2Y/rvHyTJb4EpJcHJC9fxG8+cKQcnQ23JEw3lNM
 Xkaj0hmrbll1rgdu2PuG0pDY89fFw7g3wAdBJiMBZqhnr4sJwFLx1m2T9MA31SyrP1
 qENfKTF4khQCg==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCeuF92923616
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:40:56 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCeuok2923615; 
 Thu, 27 Jun 2024 15:40:56 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 0/8] Add MSIX functionality to XE
Date: Thu, 27 Jun 2024 15:40:35 +0300
Message-Id: <20240627124043.2923586-1-dliberman@habana.ai>
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

v2: 
  - Rebase
  - Fix build and checkpatch errors
  - Fix commit messages

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
 drivers/gpu/drm/xe/xe_execlist.c         |  20 +-
 drivers/gpu/drm/xe/xe_execlist_types.h   |   3 +
 drivers/gpu/drm/xe/xe_guc.c              |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  22 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   2 -
 drivers/gpu/drm/xe/xe_irq.c              | 288 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_irq.h              |   7 +
 drivers/gpu/drm/xe/xe_lrc.c              |  24 +-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 drivers/gpu/drm/xe/xe_memirq.c           |  46 ++--
 17 files changed, 389 insertions(+), 108 deletions(-)

-- 
2.34.1

