Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD25C35FE7
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 05:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398810E52B;
	Wed, 18 Sep 2024 05:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="XXvc1VYR";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174CE10E52E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 05:39:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726637992; bh=kuVxS6CaTkFt1i3FpGhNeoA8fV+Ukf2Yorea+j3hW0w=;
 h=From:To:Cc:Subject:Date:From;
 b=XXvc1VYRIRKrEcvQrcxr54ij1n5ZN3gJvNhi1L2+QyfQEzf+vj23P6ADkFIbAoCHF
 fgDQRT/E3c3z0m34VoPvv0faDWdc4DvKZB+dPhgwIUFDQ3sgBtBO1ENCOSUQ3qUkYT
 AydEvc2JzPygeQhNupeqns8FGQPgRXlgk1giioKdympxIAeExou3gvnnVKYWRs29OL
 ODPFLW3qP5esfpsTjWAteCL2YGow3XfQruL0EVQEUZcFZfuOBeQDPq3mpQxP/tpwic
 +4C757ystwN48LbwigafmOw8SpYSXu44bz6ZPP2OzR9vHhhHo+mvNs/DmzOZ4lhMKf
 K1305LwmQfwvA==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48I5di4E1331834; Wed, 18 Sep 2024 08:39:44 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v6 0/5] memirq infra changes
Date: Wed, 18 Sep 2024 08:39:37 +0300
Message-ID: <20240918053942.1331811-1-illevi@habana.ai>
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
v5: Rebase, fix more review comments (Michal)
v6: Rebase, move debug usage to first patch, fix commit messages (Michal)

Ilia Levi (5):
  drm/xe: Introduce dedicated config for memirq debug
  drm/xe: Introduce xe_device_uses_memirq()
  drm/xe: move memirq out of VF
  drm/xe: memirq infra changes for MSI-X
  drm/xe: memirq handler changes

 drivers/gpu/drm/xe/Kconfig.debug     |  12 ++
 drivers/gpu/drm/xe/xe_device.c       |   8 +-
 drivers/gpu/drm/xe/xe_device.h       |  12 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 +-
 drivers/gpu/drm/xe/xe_guc.c          |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c    |  28 +++-
 drivers/gpu/drm/xe/xe_irq.c          |   8 +-
 drivers/gpu/drm/xe/xe_lrc.c          |   8 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 190 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_memirq.h       |   6 +-
 drivers/gpu/drm/xe/xe_memirq_types.h |   4 +-
 11 files changed, 205 insertions(+), 79 deletions(-)

-- 
2.43.2

