Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D3C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35A410E9D0;
	Thu, 11 Jul 2024 09:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuHFLBB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70BD10E9D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689535; x=1752225535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=axQtM99bdj4rH+JHo1XtnUPFaGU/D3sBPah/L6Wz8zU=;
 b=HuHFLBB7t10HOJuzW+aWpW8t87+QT2XX+8lX+Bi+Jy11j25ne3FxXNp8
 WM2kxuD/JUGsPHUGNN3o+/7dc8CLacWMFhvlEsBuOf8p3ZFXXpW89JSzu
 h27Mrpn9AxSPdQ61Q8+Cd+xS01J5coTmnmjLD8Y2nFdA3N2k/hOXGVpi8
 DIgzcN5TCUz1Ucv+CiMHolfGbO+gkYUGelHpXUi9C+pGu593RQRJ+Hx2w
 NYO884Uq63x3cFAYiSV+my+q2gRb2Lb7ScJe7fMAaMzyauu8s/5wyg9tF
 rUlk6gcHZdyzP4/iHq18FjamiK8jZwQnLRRfy7DvsCQ7OuyNQYhGghuvH g==;
X-CSE-ConnectionGUID: +zE6cm+BQ+aLIdZrTlP/tQ==
X-CSE-MsgGUID: 3Lv6LPG/RT2Jjd4yEdYkfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17671889"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17671889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:26 -0700
X-CSE-ConnectionGUID: pwLpovfWRNK3/DPCmB38lw==
X-CSE-MsgGUID: Xeeo/2NMTaOo1Qz2o8TEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79210086"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:24 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 09:18:13 +0000
Message-Id: <cover.1720731201.git.akshata.jahagirdar@intel.com>
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
migration/clear.During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
Therefore, we need to have two different mappings for compressed and uncompressed
vram. We set up an additional identity map for the vram with compressed
pat_index. We then select the appropriate mapping during migration/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 389 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 450 insertions(+), 18 deletions(-)

-- 
2.34.1

