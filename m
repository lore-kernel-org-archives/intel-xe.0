Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA71ACA5531
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 10:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325910E496;
	Wed, 13 Sep 2023 10:07:14 +0000 (UTC)
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 10:07:12 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB2810E00A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 10:07:12 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1694598989; bh=ayOdbkHDrEWp/GWeuB/zX5HtQYok4//FeV0UyZ5VKik=;
 h=From:To:Subject:Date:From;
 b=Muvmvl+K4Uk0iZhI7Ef5zdV2O5s7/b0ETVOVn9koU1dbPD2ry41N9FG3EBUK0UUHl
 CjFNDrmYy/5JB6ECmN+IRUmnMeTpppqPRw3LElJuNk+SN2u11bLGntJXKsOTDqsxZV
 g3gRdvPSDiqV2vcuHHI6BloRUPyBzm4tuOwtBZN9/cZBioXz2XAY1MCK/7cRXKqLAc
 HbW4J6FdA4Nm7U/HaBVIquPAZvitufh7/wLDuCNrsBFCHLUPrHUjkHgG8oVGBhDxe3
 UlUlGxwyVIHbR/OujfTka4xbbH/7WO5xGbipQTBoB4EcwS8/YA4oN3izixs9u6crXt
 uLqoJZ5EvPPCg==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38D9w0Qw1661142
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 12:58:01 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:57:54 +0300
Message-Id: <20230913095800.1661119-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] MMIO extension support for multi-tile devices
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

By design, the Xe driver supports the same contiguous MMIO address space
for all Intel GPU devices - 16MB (hard-coded) per tile.
However, in future devices, there will be an additional contiguous multi-
tile (up to 256M per tile) MMIO extension space ON TOP of it, and hence
the necessity for the MMIO extension support.
The 1st patch in this patchset updates 'struct xe_reg' to support 28-bit
address representation in order to access larger MMIO spaces.
While the other patches essentially divide the mapped MMIO BAR into the
MMIO space and the additional, per-tile, MMIO extension space.

Koby Elbaz (6):
  drm/xe: add 28-bit address support in struct xe_reg
  drm/xe: add read/write support for MMIO extension space
  drm/xe: add a flag to bypass multi-tile config from MTCFG reg
  drm/xe: add MMIO extension support flags
  drm/xe: map MMIO BAR according to the num of tiles in device desc
  drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension

 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 19 +++++++
 drivers/gpu/drm/xe/xe_mmio.c          | 79 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_mmio.h          |  8 +--
 drivers/gpu/drm/xe/xe_pci.c           |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 +
 6 files changed, 85 insertions(+), 44 deletions(-)

-- 
2.34.1

