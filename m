Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E54CC3ABC0
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 22:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE6A10E5A1;
	Mon,  5 May 2025 22:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtH7ROLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8ED10E59F
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746485931; x=1778021931;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XAYd487KUVmDTkqOfBHCHJmnXJ5IPv40cK0h2tAOJoY=;
 b=EtH7ROLTy+LHqov4sg/mvKIgou6iB/JN53WnvgN8hE+yYkGtjwWdoTML
 46vTQNWxG758oLQOehwQ9SFEeGeQIJIoCsWKseT0UdExYQmvLl1aLa1Bj
 EGlVp3QkZCPaSDgRUT21Wc+MklcoIOadN2JnxONVLpE0S5aWKbJ3sACRZ
 yJOrwES4ltyyfoYYJAbblOnGfEuIYQ7jP4voBHW3QUsKSYnbAyxRo/4zN
 /AHjlJIdVX4k1ZERoYUhl4qZgQJDTrXHgq/LlE+BFyOygvGN7rhoQWJfw
 vXCrYU3KIhfM7vJZLiUNjjPtu2lJJOp10Vm4S1zWD4obWw0UnRzTmXw6n g==;
X-CSE-ConnectionGUID: 3hquC6SDRumeFF+yUaFqgg==
X-CSE-MsgGUID: yeKNS2PARrGGG336I+9A1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35740152"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="35740152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:50 -0700
X-CSE-ConnectionGUID: FKxE0fggSuKSERKcWmoxvg==
X-CSE-MsgGUID: lX+95wwhSS6sqS+lPU0liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="166467813"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH v3 0/4] Support active context utilization
Date: Mon,  5 May 2025 15:58:52 -0700
Message-ID: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
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

Add support for active context utilization using WA BB.

v2: (Matt)
- Fix breakage in TDR due to this feature.
- Other review comments

v3:
- Include review comments from Matt and Lucas
- Bug fixes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
  drm/xe: Save the gt pointer in lrc and drop the tile
  drm/xe: Check 64-bit CTX timestamp for TDR when available
  drm/xe: Add WA BB to capture active context utilization

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   5 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  16 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 223 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.h                   |  12 +-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   9 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  15 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h             |   8 +-
 10 files changed, 258 insertions(+), 38 deletions(-)

-- 
2.43.0

