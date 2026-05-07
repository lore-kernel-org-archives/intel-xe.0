Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37849CD37AA
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061A10F207;
	Thu,  7 May 2026 16:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCc9npCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5EC10F207
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170825; x=1809706825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLm/ykDme7ZY0pg4EpZvD7aRrq0BQDZngMvGSLt4ORU=;
 b=JCc9npCgdeV3vBT8pQVVKIerVSKduDd/JEnICjknVsRb3M7fEZ8Jo3hT
 gXuM4eaSyuMKD+WxoLOK4mIs98pSncF8Za5LB9XnT1n1wNuB+lUu7d/9C
 /Do8Eg4q66epmPAPUdbLkpMnMCEwxYardUNK2cuKGT8JgjA8fjim6Q8+S
 3XnK1ohAjGeLvRIdL1VD8nF+bV3uICkyUxMXAgGqM8WcXzBuypyZym3br
 O/c6n+003iwS9MD52hT/Pepzhr+v7qnzG1Db1F42qq8Do0liTbBFVbhzO
 vkHXOt+vkg1RDYmqVDXxeD1t8oGq8zGR6q3Ueno/qLCX0ygfElyLd3Iew Q==;
X-CSE-ConnectionGUID: vMgwN2CnRoCRCFGQIhVoJw==
X-CSE-MsgGUID: 4obTpBhRQN6q6lFg6iV6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063598"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063598"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: 8oFH4AOKSyOL6ZbWpI4mbw==
X-CSE-MsgGUID: bOCq1VFQSz6gO0KqimDU3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876559"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 00/11] Support run ticks for multi-queue use case
Date: Thu,  7 May 2026 09:20:17 -0700
Message-ID: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

In single queue use cases, the CTX TIMESTAMP can be used to track
context run ticks. In multi-queue scenarios the CTX_TIMESTAMP represents
run ticks of all the queues. To determine individual queue run ticks, we
need to use QUEUE TIMESTAMP.

The series adds support to read out QUEUE TIMESTAMP for multi-queue use
cases.

v2: Include review comments from Matt, Stuart, Niranjana
v3: Include review comments from Niranjana
v4: Include review comments from Niranjana
v5: Include review comments from Niranjana and checkpatch fix

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Matthew Brost (1):
  drm/xe: Add timestamp_ms to LRC snapshot

Umesh Nerlige Ramappa (10):
  drm/xe/lrc: Use 64 bit ctx timestamp in the LRC snapshot
  drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic
  drm/xe/multi_queue: Refactor check for multi queue support for engine
    class
  drm/xe/multi_queue: Store primary LRC and position info in LRC
  drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
  drm/xe/lrc: Refactor out engine id to hwe conversion
  drm/xe/multi_queue: Capture queue run times for active queues
  drm/xe/multi_queue: Add trace event for the multi queue timestamp
  drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for
    multi-queue
  drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  14 +-
 drivers/gpu/drm/xe/xe_gt.h               |  15 ++
 drivers/gpu/drm/xe/xe_lrc.c              | 236 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              |  10 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  11 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  14 ++
 drivers/gpu/drm/xe/xe_ring_ops.c         |   8 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++
 10 files changed, 285 insertions(+), 57 deletions(-)

-- 
2.51.0

