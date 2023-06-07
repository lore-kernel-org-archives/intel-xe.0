Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB1C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 17:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCA110E209;
	Wed,  7 Jun 2023 17:47:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7C210E209
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686160063; x=1717696063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nYufdh4apTA0yHomFKSDGK+yEbGCDN/9S0utHwPdJRw=;
 b=cXhnvc8ae6ZfknMeQdOX0KnZKcbOYjtVUlmwuoSEEguUUCA2ON6+VpkQ
 2xl+6h5eLEt7sxjmkOl2utoe5DgsKATApwccKQawELmBNwEy0poG2jf1x
 uhv0idSEtb+aGJe80QgsUy9/rpd4c2UsUTA7VjP6vlDiOt/TtHiAvvq2K
 DSBsBlWEZDoMw/kitVz5oFErRxOxB9xosaNIONE2SJeTfG0rvPiivS1M8
 Ix4wxatbMH2HjnJy67BAOu+o/wkmFyZOYEcljusff6hhQflDq/Zp9oU+B
 Yjd21/eyHDVH/lwNIam+Ufgc0bUHhxmUpbz+xutSS9Tt3B7W7wilBacCI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337421316"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337421316"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687057816"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687057816"
Received: from aaalabdu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.118])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 19:47:27 +0200
Message-Id: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Implement rcs/ccs missing invalidations and
 flushes
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

Mesa is seeing unexpected content in some tests.
Fixing those require a TLB invalidation at batch start and a
render cache flush at batch end.

KMD also requires the latter to make sure any GPU side caches are
flushed before handing memory over for reuse. This is implemented
in patch 2.

The former is likely due to scratch PTEs remaining in the TLB after a
prefetch or similar. We could discuss whether user-space should be
responsible for a TLB invalidation after a VM_BIND operation, but
patch 1 implements a TLB flush at batch start for non-LR vms with scratch
pages. For LR vms with scratch pages the TLB flush is incoporated
in the bind fence.

The TLB invalidation can be optimized / coalesced later.

Thomas Hellström (2):
  drm/xe: Invalidate TLB also on bind if in scratch page mode
  drm/xe: Emit a render cache flush after each rcs/ccs batch

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++
 drivers/gpu/drm/xe/xe_pt.c                | 17 +++++++-
 drivers/gpu/drm/xe/xe_ring_ops.c          | 50 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 4 files changed, 67 insertions(+), 5 deletions(-)

-- 
2.39.2

