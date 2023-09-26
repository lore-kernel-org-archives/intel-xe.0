Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E783FE7D27A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEA10E0C8;
	Tue, 26 Sep 2023 10:38:59 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9324610E0C8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:38:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695724698; bh=bhj8mlxGMJ4TQ58fDJBFSFmDzS99enS4GGqhqnNnKP4=;
 h=From:To:Subject:Date:From;
 b=Y7eesxtxwyBiEfiaSu3BDTT0Ww8T68kaW4sT0NXOektCjVmvKPOJoHy8Ud80wj88Y
 feQLp58idm4sGWt0/L+uAolXjcNHXfj0Ash/LfejSH9tPgvZE9T5DApIXViy1p9AfI
 bh6fevXPUWeFMcH/dXWErYLOPTCCY4A4ziGrxa0pGuH3J+r4StTHjazIWq6Swid6Uo
 l+QzuXYVQtrdTOvRS/24q+7+IOF0iP/Kxi+rwKcGaoq68Z5quBm/5MHQ94Wx/iVQhD
 w0QeZIx52QZMLBaK+2gnJPbowpu6xgzyOZTpnrYm6p95jU4NOKCuhwOEl55bnOJV0J
 r+m2aGFrJ2AtA==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38QAcmdD1200229
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:38:48 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:38:42 +0300
Message-Id: <20230926103848.1200206-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] MMIO extension support for multi-tile
 devices
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

 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 ++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 19 ++++++
 drivers/gpu/drm/xe/xe_mmio.c          | 85 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_mmio.h          |  8 +--
 drivers/gpu/drm/xe/xe_pci.c           |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 +
 6 files changed, 91 insertions(+), 44 deletions(-)

-- 
2.34.1

