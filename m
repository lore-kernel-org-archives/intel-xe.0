Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E2C3DA47
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB4C10E9D8;
	Thu, 11 Jul 2024 09:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RH2k1nvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725AD10E9D4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689608; x=1752225608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=axQtM99bdj4rH+JHo1XtnUPFaGU/D3sBPah/L6Wz8zU=;
 b=RH2k1nvuwMDuHlDA6cs6suQMh3eQt9fIdeBFAFzzg1jzs+RLNEwymApL
 2NC0tTGfRwXczMAx5rJ8eDxgnk4kPpXSn0mKfv5YNNnlM3HgCcNbWWNVj
 HyblD5Yn7SgXttYnWODfBMClfRc+ysg863R40lxnYWOC22p0cEFBMyaLE
 96AYUe2VI1K/jc1UIHedvINzBJ9jHFb5v7ny4D3EqILRlU4kpm72nk0+g
 HhbuvdgffW+USxYs5kwpxRTzZhzcPWa1Yc29Zc6pOgG1GE8sTHV12UotS
 IUl10t3+R9ZDUS1zk7HMTVjL835Vt7l6y5pDsymVPOi+BUOHL7a68S4aA w==;
X-CSE-ConnectionGUID: zVUETqZiS3qg+LcUFZdQnQ==
X-CSE-MsgGUID: 71elQ4gPSCKKk3fGDWk9wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12495916"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12495916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:08 -0700
X-CSE-ConnectionGUID: eTVyd1ZcT4WmCje2nZy3Iw==
X-CSE-MsgGUID: phtQjubvRRiTSteWW6dd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48470860"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:20:07 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 09:19:56 +0000
Message-ID: <cover.1720731201.git.akshata.jahagirdar@intel.com>
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
Message-ID: <20240711091956.OXJjPBxO_hvXkI5neLqbUGb2gimxduwFzFmTObHFGpI@z>

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

