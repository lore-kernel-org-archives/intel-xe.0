Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD29C3271E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 05:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E8210E948;
	Thu, 11 Jul 2024 05:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzbIS++s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA9210E946
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720677315; x=1752213315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xWOzzb/dvuPpsmmZV8RDyTKoDLYOkEP1bfwa6QNtkV8=;
 b=jzbIS++s+iV3dk6fj9wIKdlwhcmT4AcnLJZtMBqYf17JGgRb3wilWL6G
 7lFTYCwtnDnRi5nzNvyVOtWhpKg7qLFEPYQ3Idw5E23TVeFmM5adzyrxE
 Oz40yzyxy3mvzMZs5HHlChh4Q/sqDljawRTb7OWEsC5KjQvy748DsfNCm
 Y49/XjsJJKlbmpOEbIs7MhuYQq1sfwsqSIQ87PevjwJPPKb9tFNa/o20g
 h8yvYt9Hk/rQYG649qWu6mLB8EmzMvoHTM9+3+QFi7KA1Mq2Gdv45xsgW
 P/UPF2CDv547pCebNia9N70Qr2AEFip8rl/H0ejiEPR4UYpy/CbwK1LgC Q==;
X-CSE-ConnectionGUID: Afy1kPWfSaiJslqDvtcArQ==
X-CSE-MsgGUID: 3vu8EmuVSOijBSyL+/8vVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35468622"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="35468622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 22:55:15 -0700
X-CSE-ConnectionGUID: tlwG7K+8S9C6onI8SCSMXQ==
X-CSE-MsgGUID: 0UFURMFTTUmaBUnGGo1N/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53627673"
Received: from dut1110bmgfrd.igk.intel.com ([10.211.177.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 22:55:12 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/6] Implement compression support on BMG
Date: Thu, 11 Jul 2024 05:54:59 +0000
Message-ID: <cover.1720515376.git.akshata.jahagirdar@intel.com>
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
Message-ID: <20240711055459.fFyzOLbAA39Yh7EwZpAC4aLdAGTFfJPlqQFDUTubJ60@z>

On Xe2 the compression has moved to a unified universal model
(exactly one compression mode/format), where compression is now
controlled via PAT on per-page basis. This now means KMD can
decompress freely. This was problematic on DG2 since we had
multiple compression formats, and the compression format used
on a particular buffer was unknown to the KMD, so instead the
raw CCS state needed to be copied around when evicting VRAM.
In addition mixed VRAM and system memory buffers were not
supported with compression enabled.

On Xe2 dGPU compression is still only supported with VRAM,
however we can now support compression with VRAM and system
memory buffers, with GPU access being seamless underneath.
So long as when doing VRAM -> sysmem the KMD does the move
using compressed -> uncompressed, to decompress it.
CPU access to such buffers is also possible, under the premise
that userspace first decompress the corresponding pages being
accessed. If the pages are already in system memory then KMD would
have already decompressed them. When restoring such buffers with
sysmem -> VRAM the KMD can't easily know which pages were originally
compressed, so we always use uncompressed -> uncompressed here.
With this it also means we can drop all the raw CCS handling
on such platforms (including needing to allocate extra CCS storage).

In order to support this we now need to have two different identity
mappings for compressed and uncompressed VRAM.
The additional identity map is the VRAM with compressed pat_index.
We then select the appropriate mapping during migration/clear.

Akshata Jahagirdar (6):
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 drivers/gpu/drm/xe/xe_device.h             |   5 +
 drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
 6 files changed, 449 insertions(+), 18 deletions(-)

-- 
2.34.1

