Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAFBC3DA4B
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77010E2DB;
	Tue, 16 Jul 2024 01:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrWkPmRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FECE10E2AB
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721091682; x=1752627682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=td1AEp+b97oL3EybVl0awdnUz9RvtOWMDxmPOIbxcVE=;
 b=OrWkPmRiEWmHfhMeRuy7pOpuG0d72YymH/DdLZb+GzPM5N6kd7lqhMcx
 OElmvV89ABrVXKv3k5peY3P173P0oL3i7sOZ01nIF1EEjYczNbAxpY7Kg
 Lsj7jfk7LHBdCCaVme2zNDpKi8NEqC+5jkqDsloaAuERLmBx2BaZxj8F8
 rT3cNELRjWE5RGgPxeiWArm3OAM1bYJ2B8geCmPMRehCyEW50DgKtCN6K
 fB1i4gRMXMyjbICk1Vu4faHlwac3YSpkx1XY2eNFdlQ9ALtmXJSimwiiD
 DYsCTFeZxQp3NywWgY54GbHEHfgjSdtc+rlGhO/T/zxwbsHuDieE64cjV w==;
X-CSE-ConnectionGUID: l9sOIZ0UTQOd3qYDZtpW9w==
X-CSE-MsgGUID: Kp8RNMdvSz2ONvnVu2Z66A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18618344"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18618344"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:21 -0700
X-CSE-ConnectionGUID: 0IWqcL0hRTmoUKEhFH+mHg==
X-CSE-MsgGUID: Q9Pzkgo4T9KEIgJwO3bBgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874244"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:20 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v4 0/7] Implement compression support on BMG
Date: Tue, 16 Jul 2024 01:01:04 +0000
Message-Id: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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
  drm/xe/xe2: Introduce identity map for compressed pat for vram
  drm/xe/migrate: Parameterize ccs and bo data clear in
    xe_migrate_clear()
  drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
  drm/xe/migrate: Add kunit to test clear functionality
  drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
  drm/xe/migrate: Add kunit to test migration functionality for BMG
  drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx

 drivers/gpu/drm/xe/tests/xe_bo.c      |   9 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 398 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.c            |  10 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 162 +++++++----
 drivers/gpu/drm/xe/xe_migrate.h       |   4 +-
 5 files changed, 514 insertions(+), 69 deletions(-)

-- 
2.34.1

