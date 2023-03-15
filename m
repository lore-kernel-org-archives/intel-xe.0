Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA0FC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F7910E94B;
	Wed, 15 Mar 2023 15:55:30 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7410E8C6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895727; x=1710431727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R5imLtSsWYoMKCD3PBqBA7AFoJ0VGHCWLcRmZxoyC04=;
 b=fRSrJ6ry9O2cpO0/QE1sTM1vrPotgONQXzVF4o/Ws9+TU3AwiIW1uaCL
 JvcQrn65ucE40wU4Tjpsofcryre5q69Gi81p/VRyBG/+9fa2LNvMH4qOs
 Xkx8TG1yWT61jpTTNMjCY1Hvcp7HF0qrg3JqkjYxRETpwcVOTDwRXCdBz
 u5QcnDuHZy3tAZMXbUtw988xgpuK5IXxmvvEmsSiZXtQ7CcOa09IwsM/p
 bxA2fRthqt5Abg1ebFjkdM5u/zXOelqehWDDzD2cvYn51udke4MfV9+d/
 B+QtT3pAtZPFbPKytMnen1UQ8vVG6uC4sEBdGr1BRQu2r7yNrsvRRnKSO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321582985"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321582985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711973589"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711973589"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 16:55:00 +0100
Message-Id: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/7] Cpu page-table updates and fixes
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There were flaws in the engine idle computation used to determine whether
we could use CPU page-table updates. Fix those

It also turns out fixing those triggers CPU-page-table updates in the
migrate test, which didn't really support that, so also fix the migrate test
to handle that and to run the test twice, once with CPU- and once with
GPU page-table updates, and to also provide some timings for
non-synced updates. (The timings avoid the GPU submission latency
to better reflect the case where we are able to pipeline GPU
page-table updates).

Provide some coverage for the fence seqno 32-bit wrapping
case by setting the initial fence seqno to a small negative number.

Finally use the new xe_engine_is_idle() function to fix the memory
ping-ponging issue that can be triggered by the xe_noexec_ping_pong igt
currently on review.

v2:
- Use __dma_fence_is_later() to compare fence seqnos.
- Add Patch drm/xe/vm: Defer vm rebind until next exec if nothing to execute

Thomas Hellström (7):
  drm/xe: Use a define to set initial seqno for fences
  drm/xe/migrate: Update cpu page-table updates
  drm/xe/tests: Support CPU page-table updates in the migrate test
  drm/xe: Introduce xe_engine_is_idle()
  drm/xe: Use a small negative initial seqno
  drm/xe/tests: Test both CPU- and GPU page-table updates with the
    migrate test
  drm/xe/vm: Defer vm rebind until next exec if nothing to execute

 drivers/gpu/drm/xe/tests/xe_migrate.c | 35 +++++++++++++++--
 drivers/gpu/drm/xe/tests/xe_test.h    |  1 +
 drivers/gpu/drm/xe/xe_engine.c        | 28 +++++++++++++-
 drivers/gpu/drm/xe/xe_engine.h        |  2 +
 drivers/gpu/drm/xe/xe_exec.c          |  1 +
 drivers/gpu/drm/xe/xe_hw_fence.c      |  4 +-
 drivers/gpu/drm/xe/xe_hw_fence.h      |  3 ++
 drivers/gpu/drm/xe/xe_lrc.c           |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c       | 55 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_vm.c            | 18 +++++++++
 drivers/gpu/drm/xe/xe_vm.h            | 17 +++++++++
 drivers/gpu/drm/xe/xe_vm_types.h      |  5 +++
 12 files changed, 137 insertions(+), 35 deletions(-)

-- 
2.39.2

