Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C033C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF1510E439;
	Wed, 17 Jul 2024 21:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI+BY8fi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31FE10E439
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721250616; x=1752786616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=osWMjLuF5tWVIckMkpxrcX5tQ10VC1uG6QO6gh330dc=;
 b=cI+BY8fi7Lz6CdLENyTBqf0DF+TsUrNdyuPOzOkb61IczbCGAWbX6Nu/
 5UJ0vrUPtEKiPVVhklpm/SvMzZ+riSZD9JJ6gtasfWvyCaLvgItBJ2QbC
 xsWdHhABac+yleCZCv+zDd4yAAvwI1GhD+ESGP/PhsKGWB4kAePbF8zm2
 w//S2ItENkOC1oyiHtvI6V0vkoik/F5eeR1kLAcEaCKvlrvSkWAol5uo6
 CNgLf5QrspV4bzobqtEbOZ7FkkrXkZynoDyS6Hno3wKLXD8L934O3EC3T
 5xQXB+sl0dzIouJ9XGEXe92aizYBKP5f1lcFqwsh/D1NJs1FiCz9dfLYT w==;
X-CSE-ConnectionGUID: MNH0W4CORMCYhWoC8WKX+g==
X-CSE-MsgGUID: ZCV7ZWCzSsaENoB8AeHSCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596190"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12596190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:15 -0700
X-CSE-ConnectionGUID: 65D51sCwQraU0k+e5kaxng==
X-CSE-MsgGUID: xPx38OI3QH6rcXgJ4UMdgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50252626"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:14 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v7 0/7] Implement Compression Support on BMG
Date: Wed, 17 Jul 2024 21:10:01 +0000
Message-Id: <cover.1721250309.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Xe2+ has unified compression (exactly one compression mode/format),
where compression is now controlled via PAT at PTE level.
This simplifies KMD operations, as it can now decompress freely
without concern for the buffer's original compression format—unlike DG2,
which had multiple compression formats and thus required copying the
raw CCS state during VRAM eviction. In addition mixed VRAM and system
memory buffers were not supported with compression enabled.

On Xe2 dGPU compression is still only supported with VRAM, however we
can now support compression with VRAM and system memory buffers,
with GPU access being seamless underneath. So long as when doing
VRAM -> system memory the KMD uses compressed -> uncompressed,
to decompress it. This also allows CPU access to such buffers,
assuming that userspace first decompress the corresponding
pages being accessed.
If the pages are already in system memory then KMD would have already
decompressed them. When restoring such buffers with sysmem -> VRAM
the KMD can't easily know which pages were originally compressed,
so we always use uncompressed -> uncompressed here.
With this it also means we can drop all the raw CCS handling on such
platforms (including needing to allocate extra CCS storage).

In order to support this we now need to have two different identity
mappings for compressed and uncompressed VRAM.
In this patch, we set up the additional identity map for the VRAM with
compressed pat_index. We then select the appropriate mapping during
migration/clear. During eviction (vram->sysmem), we use the mapping
from compressed -> uncompressed. During restore (sysmem->vram), we need
the mapping from uncompressed -> uncompressed.
Therefore, we need to have two different mappings for compressed and
uncompressed vram. We set up an additional identity map for the vram
with compressed pat_index.
We then select the appropriate mapping during migration/clear.

Akshata Jahagirdar (7):
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/migrate: Add helper function to program identity map
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c      |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c | 399 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c       | 185 +++++++-----
 3 files changed, 524 insertions(+), 66 deletions(-)

-- 
2.34.1

