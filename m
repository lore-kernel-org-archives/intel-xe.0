Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE8C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC810EECC;
	Wed,  9 Sep 2026 06:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXud3XnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35C810E113
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788934752; x=1820470752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7uDa3Cn026QzzGlZ5Wsruul7XdNPJQwwa555FaYVWK0=;
 b=kXud3XnBSX+SGR7lzdl1SN2P4KHbdCsnUupFEgncgqS/g3Jwd1jsVdAY
 DJ236/mjCwQ86vVFLfaJzX8k0B1qJYavZUnfjkKfKDikyF9jnQESNgWbE
 rRa3hkrAnBMdIo+U4T7jB0+IwL3jyM71SEoobP+0zVWPogXJ4vlkkq4fv
 h05z5gcEncmsO+7gxjqMcAukIgLhn9//LnxBHbMi/v5OADjA9gEypd+Tx
 nfPItj2v57GmUcQKmBzjH/Pgw+1/Frj6M4TYFEAVSz8f2qzUSAf2xb5c4
 1MGfBPm88WWp7xHIi0L+GkdW5qnH1Z//32rvzI34n/Z5n4a/IO16kuWoJ Q==;
X-CSE-ConnectionGUID: lIBPNUpdQTO3Bns/s/9Gig==
X-CSE-MsgGUID: a/EavrGbR0mM0Buy0QHiyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89220580"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89220580"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:10 -0700
X-CSE-ConnectionGUID: 509pdIbbSASWFGKgLP7+WQ==
X-CSE-MsgGUID: QQIyc36tT1C7mTuP19u42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270733908"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:04 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v3 0/4] drm/xe/xe_migrate: Fix memory corruption with
 unaligned dst in MEM_COPY
Date: Wed,  9 Sep 2026 08:18:41 +0200
Message-ID: <20260909061845.4048047-1-jan.maslak@intel.com>
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

Patch 1 adds the minimal workaround by selecting a pitch that is aligned
to both the copy length and the destination address.

Patch 2 fixes an independent page tracking bug in
xe_migrate_access_memory().

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

Christoph Manszewski (2):
  drm/xe/xe_migrate: Align MEM_COPY pitch with destination address
  drm/xe/xe_migrate: Fix page tracking in access_memory

Jan Maslak (2):
  drm/xe/xe_migrate: Optimize unaligned access_memory copies
  drm/xe/tests: Add xe_migrate_access_memory subtest

 drivers/gpu/drm/xe/tests/xe_migrate.c | 278 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c       | 176 ++++++++++++++--
 2 files changed, 435 insertions(+), 19 deletions(-)

-- 
2.43.0

