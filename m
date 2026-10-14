Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3959CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A312210FF2A;
	Wed, 14 Oct 2026 13:46:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAAF10FE19
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791985605; x=1823521605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CXtY1I0l65jZKjGBRbgcAHD3uQkTnIXefnK8o0bUafc=;
 b=nKkHSjHYLC7jh1Mc9Z6BTgLKd4Ere1fHpBDphtI5Fe0q20t7ViE8MVRN
 gBTFRWjGZXGGzl2kyRorbuS5GOL5JBrOxdZzeevVS5Rv94qBg1UQXd70w
 7sx6TW5zFJTLiaTQxF94RIaputkS+a2nl3qY+L3EFE94kSJ4W3VVRJtV6
 Q57w1a617mAygEnw4SXONinGufkoqvLhRnfFOvKotexfSk4wqleW7kTPE
 HZN7gG8d82XfEi3PZn7c9/RRCih0x70+aen4DZmE9pB1BA6pqq4sivIEv
 wMP5ShL9wwCMD2YbiufUfrlwGND2EBXYGMZ35iQ5LkGpLsnjzkS0nthoB Q==;
X-CSE-ConnectionGUID: kx6bPW4MQp2Jcx5ZUv3Qdg==
X-CSE-MsgGUID: KDp9zs8wSLygF/Qew0caQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="617452"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="617452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:45 -0700
X-CSE-ConnectionGUID: R7t9Qbp0SWWfnrcmvLSYwg==
X-CSE-MsgGUID: GyknrK8xTPaK/5ij9jcdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1539982"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:43 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v4 0/4] drm/xe/xe_migrate: Fix memory corruption with
 unaligned dst in MEM_COPY
Date: Wed, 14 Oct 2026 15:46:30 +0200
Message-ID: <20261014134634.582314-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
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

MEM_COPY_CMD in MATRIX_COPY mode produces incorrect results when the
destination address is not aligned to the pitch. This manifests as
memory corruption during xe_migrate_access_memory() reads from VRAM.

The probable cause appears to be a hardware requirement that the
destination address must be aligned to the pitch when using MATRIX_COPY
mode.

This was observed on BMG during xe_migrate_access_memory() calls where
the destination offset within a page was not aligned to the computed
pitch value.

Patch 1 fixes an independent page tracking bug in
xe_migrate_access_memory().

Patch 2 adds the minimal workaround by selecting a pitch that is aligned
to both the copy length and the destination address.

Patch 3 adds a follow-up optimization to reduce the number of linear
copy jobs for unaligned destinations.

Patch 4 adds a KUnit live test that exercises xe_migrate_access_memory()
with various unaligned destination offsets to prevent regressions.

Tested on BMG (Battlemage).

v2:
 - Split the original xe_migrate change into a minimal workaround,
   a standalone page tracking fix, and a follow-up optimization
   per Matthew Auld's review feedback
v3:
 - Used a helper function and added an additional comment in patch 3
   per Matthew Auld's review feedback
v4:
 - Rebased onto current drm-xe-next
 - Moved the page tracking fix before the pitch workaround, so the
   series stays correct at every commit
 - Patch 2: free the batch buffer when returning -EOPNOTSUPP instead
   of leaking it
 - Patch 3: use a single max_bytes limit to shorten an over-long line
 - Patch 4: validate the BO into VRAM and wait for it to be idle
   after locking it, before accessing it

Christoph Manszewski (2):
  drm/xe/xe_migrate: Fix page tracking in access_memory
  drm/xe/xe_migrate: Align MEM_COPY pitch with destination address

Jan Maslak (2):
  drm/xe/xe_migrate: Optimize unaligned access_memory copies
  drm/xe/tests: Add xe_migrate_access_memory subtest

 drivers/gpu/drm/xe/tests/xe_migrate.c | 302 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c       | 176 +++++++++++++--
 2 files changed, 459 insertions(+), 19 deletions(-)


base-commit: f7f8e453bef8ea29ae3615e5308eb2d4c250545d
-- 
2.43.0

