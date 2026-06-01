Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E7CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 15:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A51113429;
	Mon,  1 Jun 2026 15:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CucCcqlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4946113428
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780327272; x=1811863272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3rDOn68SyKq1j+1UNeAtaCmB26HoHPg61wZheEHv/7g=;
 b=CucCcqlMMr7M8j/GdyOgqQRF4qEpUwqJ6/Ve2pyrdRsM4lHcUUl/rXjR
 Xm9eGeh41xiSmQ3uKkAHucIJn2bhypUVBfcIB8bKvB5HydmYi+RB0GtlG
 uv2Lv8Wfwr9eCGtAlQY0ROSA/BjuJWty4XMjd7xWAzY9GIr96LuHyeMqr
 hEkGFvBuWlJL2xWne1evV9dN9XMrYHqc/sgxrdx/OVE4aM5Ce5X19NvFu
 XwUiHEuMyo/Xfmy8tCWneMkBB0DT+ZAvCDc6nAqkjSaLP9noLrihmCXAR
 F43WDU/thWvNdP+uAgpnxQcodl0CbIxZ1UF5ZXznatvMN6NbMdfG/biU/ Q==;
X-CSE-ConnectionGUID: RlpErZ5wQNOIdJl+MV5Ruw==
X-CSE-MsgGUID: TG+aseprSmKFPTw77++4bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81117900"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="81117900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 08:21:12 -0700
X-CSE-ConnectionGUID: Q27CtGCHTimwmNHZCYNDFw==
X-CSE-MsgGUID: sDY7psVrQwCK4zp6ymexWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="243425828"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 08:21:11 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/2] drm/xe/xe_migrate: Fix memory corruption with unaligned
 dst in MEM_COPY
Date: Mon,  1 Jun 2026 17:20:54 +0200
Message-ID: <20260601152056.2413514-1-jan.maslak@intel.com>
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

The probable cause appears to be a hardware requirement that the destination
address must be aligned to the pitch when using MATRIX_COPY mode.

This was observed on BMG during xe_migrate_access_memory() calls where
the destination offset within a page was not aligned to the computed
pitch value.

Patch 1 fixes the issue by incorporating the destination address into
the pitch calculation, and implements a 3-phase copy strategy (linear
align, matrix bulk, linear remainder) to maximize throughput while
maintaining alignment.

Patch 2 adds a KUnit live test that exercises xe_migrate_access_memory()
with various unaligned destination offsets to prevent regressions.

Tested on BMG (Battlemage).

Christoph Manszewski (2):
  drm/xe/xe_migrate: Ensure that dst address is aligned with pitch
  drm/xe/tests: Add xe_migrate_access_memory subtest

 drivers/gpu/drm/xe/tests/xe_migrate.c | 278 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c       | 165 +++++++++++++--
 2 files changed, 428 insertions(+), 15 deletions(-)

-- 
2.43.0

