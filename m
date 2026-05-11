Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5C2CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41C810E74F;
	Mon, 11 May 2026 12:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilaejyhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B0810E742
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502757; x=1810038757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d39xphKnUG5ePDj9xum/B3o2K1TivE0kwXuK8rwJmGA=;
 b=ilaejyhcq6N1m/iErWtuYbpu1aoKBw7EoDiozWqrUX9aEC5P9ol2wlhh
 myj200h426XGep896SSXwbYicW8bkaiDzRbE3KvSkxqGlDeUBaibtuFmS
 8RzRXjQWFmz90ZPOYpGhek4hH0luJYFFGQE+jhAm6AEoKZutUpnSNn5SK
 AztrtjLP36cHNfQ2pE4RJY6eQAIlKQUSMNtEtKVX3LlvwG6Fvn6xPU5wl
 a0qkNG8yfMx1PrGhupjBhn74rOER1R1KvhwxdXKG/1xapzQVHwo8cSyAR
 Aup3YujyYWyHLMAkMrTE0UkXwGjrVuEo1A6UxioM2PVJ1e5YisxbYIpBu A==;
X-CSE-ConnectionGUID: JTmDWbgtTv69yl0n3ywAYQ==
X-CSE-MsgGUID: /6pCnclYQeiL0NKXMPB4+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83000043"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83000043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:36 -0700
X-CSE-ConnectionGUID: b5soNqDpSkCwn/LMZ1Wr8Q==
X-CSE-MsgGUID: v85gzVBdRiaOTUKv3ANDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275571614"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:32:35 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 0/3] Refactor functions implementing the blt batch buffer
Date: Mon, 11 May 2026 18:07:47 +0530
Message-ID: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
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

Functions implementing batch buffer for blitter instructions MEM_SET,
MEM_COPY, XY_FAST_COPY and XY_FAST_COLOR use a fixed instruction length
hardcoded inside the function.
In future platforms the length of these instructions will be increased.
Replace those fixed instruction length with a function which returns the
length of the instruction based on the platform.
For now those functions still return the fixed length but will be
extended while adding support for future platforms.
This series is a prep work for supporting the upcoming platforms.

v2:
- Removed the macros defining the instruction length so that no one in
  future directly makes use of it (Matt)
- Rebased on recent drm-tip

Balasubramani Vivekanandan (3):
  drm/xe: Refactor emit_clear_main_copy
  drm/xe: Refactor emit_clear_link_copy
  drm/xe: Refactor emit_xy_fast_copy and emit_mem_copy functions

 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 57 +++++++++++++++----
 3 files changed, 47 insertions(+), 16 deletions(-)

-- 
2.43.0

