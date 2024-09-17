Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA99C36016
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 11:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D73310E283;
	Tue, 17 Sep 2024 11:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="lny35bSU";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F010E0D0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:00 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726572233; bh=BSvGuAk5tcpHwmbT24tB69FntC6fuCqspPDGL3xc0m4=;
 h=From:To:Cc:Subject:Date:From;
 b=lny35bSUNYPw+DfWVPBRt7HSruPfz6sQ6E6EpNg/D1I3Poyvzr6lwf0szn6wEYnbd
 CeKQl/5fyJKiw2klOq1BhbWckwVqV2tt+0wAB39oYPUDtaCXaq60Q3CYxE2izsb0vD
 icRm68b3FQo6NRg4e1V/dqf5a8wt0AKw1nel98nR0inrBkAcg+HlDYmPbjiXu3QQT2
 lBi6thy99W29nMEhbfhPYQuidv5VIuY6bo7qjzVFpMs6fXSW+8txyN/ifD6JMhclw3
 jwZ+Hd2Ru1CG22NHJUW6RE7/HJhkiAoMfP+sciCSoraTMR/+IisOUIHfXBb7meuJMQ
 OHf1gkQ0jcR6A==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48HBNmuK1242354; Tue, 17 Sep 2024 14:23:48 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v5 0/5] memirq infra changes
Date: Tue, 17 Sep 2024 14:23:02 +0300
Message-ID: <20240917112307.1242329-1-illevi@habana.ai>
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

