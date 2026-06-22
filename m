Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2065CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7451689CE3;
	Mon, 22 Jun 2026 10:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlKIzCat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A534B89C0A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782124516; x=1813660516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rytPF1g3M0US5uYGCrvawgEHQJQNIau2zorAYW1Mb3Y=;
 b=nlKIzCatZK+/n297W7X6pNkbbTsoQOYAkopJ7ZoLZiY3z790g9Yv+B95
 NGB2vSHJbcKQTGsX/EZNzTKpp7cqnXe5VQi5AUe7dgos56fHXfY+ydeqy
 ByKDjweneoKZccvoUlCda96+eYwEU9rx5kG2koRTppsET9kUAqIpnU//l
 7xoGETZ1lGICNCZRkOUcAiUgCGFz2hdYcA3cxT7W/4NgNGkMIbEApzuZS
 PoyIKzZnO3Xo1XAieRPalF8zAh1iVSqUXQFukVvEr2TLzCD4az7NfLZWB
 q2nQUCJI2KWGD08NsIFIn3G/Ii9NmjWZMnQZeQB4ql82LUUQUGzbH1qhT w==;
X-CSE-ConnectionGUID: 3vybF8ylSPyqMM5jBTpNBw==
X-CSE-MsgGUID: faz+jswDQryc427jZANm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365429"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70365429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:15 -0700
X-CSE-ConnectionGUID: Bq70CDYHRve8qRvg7+h/8A==
X-CSE-MsgGUID: AETP3enzSnKLF9TWttYOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248046764"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:13 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 0/4] drm/xe/xe_migrate: Fix memory corruption with
 unaligned dst in MEM_COPY
Date: Mon, 22 Jun 2026 12:34:45 +0200
Message-ID: <20260622103449.3335928-1-jan.maslak@intel.com>
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

Christoph Manszewski (4):
  drm/xe/xe_migrate: Align MEM_COPY pitch with destination address
  drm/xe/xe_migrate: Fix page tracking in access_memory
  drm/xe/xe_migrate: Optimize unaligned access_memory copies
  drm/xe/tests: Add xe_migrate_access_memory subtest

 drivers/gpu/drm/xe/tests/xe_migrate.c | 278 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c       | 173 ++++++++++++++--
 2 files changed, 432 insertions(+), 19 deletions(-)

-- 
2.43.0

