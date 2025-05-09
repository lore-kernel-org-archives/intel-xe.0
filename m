Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ECFC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE98D10EAC2;
	Fri,  9 May 2025 16:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UACe/9PG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9CA10EAC2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746807122; x=1778343122;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8oA+t3v/daRKLeV26zgCOb0O0jnOB5bT9UtYgmqZgZI=;
 b=UACe/9PGdSQhqUBdIaTmZwDIpwlge1/kYWj7dLoC7WQTjuiTImIPWq/E
 DhHCB9OB2xxQDnXzOCVPjiZNlS4ivc4jzmIKxQhybz4teTLzJ5bQPh5vy
 6V83C9d6PeWUuRNvOmWLRfoYziAZP5K9Y0HYH1ak6jRH6pA2HHWd5x1ef
 sKVWpxYfT1Ply+VppRU+9Ze3zogR1PCkBZTnmQhX6hj8lsd8LNJs9DZSn
 hMnlMWI1yTfhtgIZq1zHrtXdn+qlid8DdDsjwITgI8FUiQFY1mBS5lkoL
 y6YlzI2WaK8BsUxKc344lOwdAcgBGnyMB+5w7FLP7LQBkIxwBVgd/QQSz g==;
X-CSE-ConnectionGUID: 8LYbjbQFQZ+PQafik8+pGw==
X-CSE-MsgGUID: /zGfbQF+Tg2l6rSnEwaKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59987208"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="59987208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:12:02 -0700
X-CSE-ConnectionGUID: 6Rx1K39rSbuhNYJehR0FTA==
X-CSE-MsgGUID: GlHpLDDlRam368pgBj1Nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137151434"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:12:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH v5 0/3] Support active context utilization
Date: Fri,  9 May 2025 09:12:00 -0700
Message-ID: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
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

v4:
- Review comments
- CI bug fixes

v5
- Review comments
- Checkpatch fix
- Squash last 2 patches and retain 32 bit timestamp for TDR
- Update code comment to match commit msg

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
  drm/xe: Save the gt pointer in lrc and drop the tile
  drm/xe: Add WA BB to capture active context utilization

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   5 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 191 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   7 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h             |   8 +-
 13 files changed, 214 insertions(+), 26 deletions(-)

-- 
2.43.0

