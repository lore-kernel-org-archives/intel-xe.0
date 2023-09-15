Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D4EE6457
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5843110E630;
	Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EFC10E628;
 Fri, 15 Sep 2023 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784217; x=1726320217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+7zSsjfS6/p7jMmnEfqA/O3+hMh3Brao0bn1kjnJRHY=;
 b=KbTBeXrE9M1CZ8m6afaQDQ898buO/mF2E7/t78266ZCrdPR3orSiNNea
 GAHHd8TWVACo5gQ+BEPcOPV6M4rgaK7NRQtaUfYbscRaaoP27yZW2EVCg
 wvGXzYpOdjqp6vTofGMFLxIXLvGRgfbEUl4fa9qtMahYWCefKHizKWtZg
 xtTnUD2n1X+Enc35dTKWnzNJXoS25zioXWJO6lTLbonPXDSclgqKF/gUQ
 fY5D7ALr1RvjKFX5UA3x3g3N/AMe52WuwGjCDszQqJYN9Egq8jS5SmD2V
 OkIJn304y73BMiMCCNju1ZOc9ZkfQax7seq9h6tl6N+1SH0v7SpKOLAuT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292131"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292131"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515410"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515410"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:32 -0700
Message-Id: <20230915132346.1845909-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 00/14] Adapt copy commands for Xe2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A few copy commands changed for Xe2, mainly adding or moving the bits
used for MOCS. This adapts the places we are manually adding the
commands in the batch buffer, the gpu_cmds and the intel_blt libraries.

Missing here is the conversion of lib/intel_batchbuffer.c. I had
understood that intel_batchbuffer would end up using the new intel_blt.
So, it may just be that we have some patches being cooked for that. Or
I understood it wrong. Anyway, it doesn't seem good that we have
basically 3 ways to do the same thing.

Also it seems that this is the first time we are updating intel_blt for
a platform with a breaking change. I used 2 different approaches in how
to adapt the struct: one for xy-block-copy/xy-fast-copy and another for
ctrl-surf-copy. The reason is that for the former there was just a minor
change and the latter basically rewrites all the dwords. Going forward I
think we should keep applying small deltas to at most 1 or 2 breaking
changes, otherwise it makes it harder to read.

This is not tested in real HW yet, hopefully I didn't break some older
platforms.

Lucas De Marchi (14):
  lib/rendercopy: Use common mocs function
  lib/gpu_cmds: Remove prefix from gen7_fill_binding_table()
  lib/gpu_cmds: Reorder if/else ladder according to IP version
  lib/gpu_cmds: Fork a gen9_fill_surface_state()
  lib/gpu_cmds: Reduce scope of xehp_fill_surface_state()
  lib: Fork gen9_media.h
  lib/intel_mocs: Stop encoding mocs
  lib/intel_mocs: Add Xe2 mocs indexes
  lib/igt_draw: Add Xe2 mocs to XY_FAST_COLOR_BLT
  lib/intel_mocs: Remove unused lefotver defines
  lib/igt_fb: Add Xe2 mocs to XY_FAST_COLOR_BLT
  lib/intel_blt: Support Xe2 in xy-block-copy command
  lib/intel_blt: Support xe2 in xy-fast-copy command
  lib/intel_blt: Support xe2 in ctrl-surf-copy command

 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/gen8_media.h                         |  14 -
 lib/gen9_media.h                         | 144 ++++++++++
 lib/gen9_render.h                        |   3 +-
 lib/gpu_cmds.c                           | 100 +++++--
 lib/gpu_cmds.h                           |   7 +-
 lib/igt_draw.c                           |   8 +-
 lib/igt_fb.c                             |  10 +-
 lib/intel_blt.c                          | 325 +++++++++++++++++------
 lib/intel_compute.c                      |   1 +
 lib/intel_mocs.c                         |  23 +-
 lib/intel_mocs.h                         |   4 +-
 lib/intel_reg.h                          |   4 +-
 lib/media_fill.c                         |   1 +
 lib/rendercopy_gen9.c                    |  41 +--
 lib/xehp_media.h                         |   3 +-
 tests/intel/gem_ccs.c                    |   6 +-
 tests/intel/gem_lmem_swapping.c          |   4 +-
 tests/intel/xe_ccs.c                     |   6 +-
 19 files changed, 518 insertions(+), 187 deletions(-)
 create mode 100644 lib/gen9_media.h

-- 
2.40.1

