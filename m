Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F064C54755
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD1B10E05E;
	Wed, 28 Aug 2024 09:18:56 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90B10E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 09:18:54 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 47S9If8v1840107; Wed, 28 Aug 2024 12:18:42 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v2 0/5] memirq infra changes
Date: Wed, 28 Aug 2024 12:18:36 +0300
Message-ID: <20240828091841.1840086-1-ilia.levi@intel.com>
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

This patch set contains Memory Based Interrupts (memirq) infrastructure
changes to make it reusable for use cases other than VF 
(specifically MSI-X). 

The main changes are separation from VF and a new mode
("reports to engine instance 0") for MSI-X support.

v2: Rebase

Ilia Levi (5):
  drm/xe: move memirq out of vf
  drm/xe: memirq infra changes for msix
  drm/xe: add memirq offsets for engine instance 0 to hw engine
    properties
  drm/xe: memirq handler changes
  drm/xe: separate memirq reset/postinstall from vf

 drivers/gpu/drm/xe/xe_device.c          |   4 +-
 drivers/gpu/drm/xe/xe_device.h          |   6 ++
 drivers/gpu/drm/xe/xe_device_types.h    |   6 +-
 drivers/gpu/drm/xe/xe_guc.c             |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  28 ++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_irq.c             |  38 +++----
 drivers/gpu/drm/xe/xe_lrc.c             |   6 +-
 drivers/gpu/drm/xe/xe_memirq.c          | 126 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_memirq.h          |   8 +-
 drivers/gpu/drm/xe/xe_memirq_types.h    |   6 +-
 11 files changed, 149 insertions(+), 83 deletions(-)

-- 
2.43.2

