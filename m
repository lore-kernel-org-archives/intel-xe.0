Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF0CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD8B10E474;
	Fri,  5 Jun 2026 11:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0MnGrvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C8B10E474
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780658846; x=1812194846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lh46A8urZ4qenZnj6fFgvEKFTYFOucDQaR7mCevRQow=;
 b=n0MnGrvhh7qasz9eFIdSaqKjjbuVbj96LuscHW5cz2Ga6WGLMDxd8gUj
 K/fHTk2nUxkvla6/pNTp0I95BTx7U3E/cJXI2u4nFHR1cUHkyvr0uYBie
 u2qyrOgqOEK+xHru1IIF36tNlkrvg/b6Yw87HRF3E3zMG3Knkcap3UjrS
 N8kS+iu/2Qz8I+v/Gr3W48C/bfp5DdRUL++ooqM46XMYiIVJTRruecdGR
 k16ZDL39oePOVxPqArgeQhgObWf+sqnEfobV93azFQHZ5SuEO5QqGpJDs
 8zNewnAdYtTJtB8eGfJfK1o/3J6ZRYfiBvSPo9PZmZW8koQ2dUXDfuRK9 A==;
X-CSE-ConnectionGUID: b+/VwXWCR8aETgWIP1pQEg==
X-CSE-MsgGUID: Io90B4DTRrClvkRjSYOFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69025033"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="69025033"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:26 -0700
X-CSE-ConnectionGUID: 8yA91BXER2mHQ068e4T5DQ==
X-CSE-MsgGUID: U2naFfjmSQyr0u70WIVFKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249748589"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:27:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC PATCH 0/3] Use a dma_resv wound-wait transaction API for drm_exec
Date: Fri,  5 Jun 2026 13:26:57 +0200
Message-ID: <20260605112700.181040-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

The forward outlook of drm_exec is to be a genuine drm_exec helper
rather than a generic wound-wait transaction helper. Earlier attempts
to introduce exhaustive eviction within TTM using drm_exec have
been forced to extend drm_exec with modes that aren't of interest fo
a drm_exec helper, like eviction mode locking, snapshots, trylocks etc.

This series introduces dma_resv_txn, a subsystem-agnostic wound-wait
transaction layer for any objects that embed or reference a dma_resv.
Participant types register an ops vtable supplying callbacks to reach the
dma_resv and drop the object reference; the transaction layer handles all
lock ordering, wound-wait arbitration, and retry control.

drm_exec is then rebuilt as a thin wrapper on top, retaining its existing
API without changes to existing callers. The dma_resv code suggested
here also follows the previous drm_exec implementation closely with
the same design choices.

Possible use-cases may be ttm_object refcounting for eviction,
Additional eviction modes as described above, a dma_buf_map() functionality
passing a ww transaction locking context (drm_exec would've been a layering
violation), embedding resvs in GPU vm objects etc.

A live kunit benchmark for the drm_exec locking path is included.

It should be mentioned that this could be placed on an even lower level
(kernel/locking), but that would probably require potential other users
first and also a proper non-allocating trylock functionality.

Also tried an approach where object structures were allocated individually
using a kmem_cache and put on a linked list. However, the benchmark
showed a substantial performance hit compared to the pre-allocated
array approach that was originally used indrm_exec.

Thomas Hellström (3):
  dma-buf: Add generic dma_resv wound-wait transaction API
  drm/exec: Rebuild drm_exec on top of dma_resv_txn
  drm/xe/tests: Add drm_exec locking benchmark kunit test

 drivers/dma-buf/Makefile                     |   2 +-
 drivers/dma-buf/dma-resv-txn.c               | 300 +++++++++++++++++++
 drivers/gpu/drm/drm_exec.c                   | 203 ++-----------
 drivers/gpu/drm/xe/tests/Makefile            |   3 +-
 drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c | 130 ++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |   2 +
 drivers/gpu/drm/xe/xe_bo.c                   |   3 +
 include/drm/drm_exec.h                       | 161 +++-------
 include/linux/dma-resv-txn.h                 | 223 ++++++++++++++
 9 files changed, 731 insertions(+), 296 deletions(-)
 create mode 100644 drivers/dma-buf/dma-resv-txn.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_drm_exec_kunit.c
 create mode 100644 include/linux/dma-resv-txn.h

-- 
2.54.0

