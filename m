Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A7BE8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671D10E33F;
	Wed,  4 Oct 2023 03:10:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8F10E320;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I3Vs8Vh94XJdX3Ji8AFgQvVU3GLYmDTwCBhOcl3rsgw=;
 b=fbkw6EOy5zcmJM1sBAKLNZW+6ATb+QTh/p9wTCCE+5mRmcR0gpxha1Dy
 dwseEIqfxBrsEfAeeV0bnFHz23MKIU4dymn52hUOAMnEX4qkp5+F3WNIS
 8IaJUYsTpIEkML9/s079LlldNcyDUquHjfYOoeLAqVORyFB2rrYs81d5F
 Ozr+JENoleiN3MOZGhKK1K5upjs3uPgymvKkLnzgPT7GIEw5KMsUNNT6z
 /N1N1NES6jtSneUB+D4j8Y4HyVmF7fV8nv/fENwOIhzeDArU1AAU0fbOS
 uE9bG0EituKHS3dNDcyavrD+SLRjReMUl2srhjAf30h4P6a22fBFDQ6Fm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308392"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308392"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760353"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760353"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:10 -0700
Message-Id: <20231004031023.3444455-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 00/13] Adapt copy commands for Xe2
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

v2: Provide fixes according to the feedback in v1

Lucas De Marchi (13):
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
  lib/intel_blt: Support Xe2 in xy-block-copy command
  lib/intel_blt: Support xe2 in xy-fast-copy command
  lib/intel_blt: Support xe2 in ctrl-surf-copy command

 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/gen8_media.h                         |  14 -
 lib/gen9_media.h                         | 144 +++++++++
 lib/gen9_render.h                        |   3 +-
 lib/gpu_cmds.c                           | 100 +++++--
 lib/gpu_cmds.h                           |   7 +-
 lib/igt_draw.c                           |   8 +-
 lib/igt_fb.c                             |   2 +-
 lib/intel_blt.c                          | 357 +++++++++++++++++------
 lib/intel_blt.h                          |  10 +-
 lib/intel_compute.c                      |   1 +
 lib/intel_mocs.c                         |  23 +-
 lib/intel_mocs.h                         |   4 +-
 lib/intel_reg.h                          |   4 +-
 lib/media_fill.c                         |   1 +
 lib/rendercopy_gen9.c                    |  41 +--
 lib/xehp_media.h                         |   3 +-
 tests/intel/gem_ccs.c                    |   8 +-
 tests/intel/gem_lmem_swapping.c          |   4 +-
 tests/intel/xe_ccs.c                     |   6 +-
 20 files changed, 538 insertions(+), 203 deletions(-)
 create mode 100644 lib/gen9_media.h

-- 
2.40.1

