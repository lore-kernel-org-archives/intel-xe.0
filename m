Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E7EEB565
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 08:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D59A10EB07;
	Thu, 12 Sep 2024 08:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="IfgYO1OW";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3210E15B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 08:54:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726131290; bh=FagV8CmMVjcAA9o5BaIYc/l7qYpH26pRNk2knQ0cpd0=;
 h=From:To:Cc:Subject:Date:From;
 b=IfgYO1OWH4B5G69YOw207fE+fkPYzDg3Gdm71uMJKZQ2TPNtS1XHkFl3XUeZ553S2
 8DJxB2hgfmtPSe9DFi0c/Ly9VVVlR49YOjKm3unjVPf21a0i3Ba1FYKqe9NISzgd60
 TU3GHhNxWrEKejBDadhvn5pAaIuxUVbN7JBx3L1hZNcRWZFdLu7HwmMWnnqxvkIcE0
 HLwb63JcEaoGqmKdphz8XCGYaVD38VNHxXXa01ojBXIlyR2k73ZYR8HYZfyl+lMU2v
 QDCFJrFwZeAKzedHSdffz4nvwnssr7D8m6U3qVSHj1+KgVwUT02Ind6wGItVf0Utrh
 iMeWbSr6VQGpg==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48C8siWU737034; Thu, 12 Sep 2024 11:54:44 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v4 0/3] memirq infra changes
Date: Thu, 12 Sep 2024 11:54:35 +0300
Message-ID: <20240912085438.737015-1-illevi@habana.ai>
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

From: Ilia Levi <ilia.levi@intel.com>

This patch set contains Memory Based Interrupts (memirq) infrastructure
changes to make it reusable for use cases other than VF 
(specifically MSI-X). 

The main changes are separation from VF and a new mode where hardware
engines report interrupt source and status to the offset of instance 0
(for MSI-X support).

v2: Rebase
v3: Rebase, refactor according to review comments (Michal)
v4: Rebase, address review comments (Michal)

Ilia Levi (3):
  drm/xe: move memirq out of VF
  drm/xe: memirq infra changes for MSI-X
  drm/xe: memirq handler changes

 drivers/gpu/drm/xe/Kconfig.debug     |  12 ++
 drivers/gpu/drm/xe/xe_device.c       |   8 +-
 drivers/gpu/drm/xe/xe_device.h       |  13 +++
 drivers/gpu/drm/xe/xe_device_types.h |   6 +-
 drivers/gpu/drm/xe/xe_guc.c          |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c    |  19 +++-
 drivers/gpu/drm/xe/xe_irq.c          |  40 ++++---
 drivers/gpu/drm/xe/xe_lrc.c          |   8 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 157 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_memirq.h       |   6 +-
 drivers/gpu/drm/xe/xe_memirq_types.h |   4 +-
 11 files changed, 182 insertions(+), 93 deletions(-)

-- 
2.43.2

