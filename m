Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90675CD3427
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDA010E245;
	Sat,  2 May 2026 00:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mm+vGw5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED3910E245
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683220; x=1809219220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ulmqkm6E2qYTMsTF6EzIpImRfdPEIqFbOLTf2MwQN/E=;
 b=Mm+vGw5XqBye1/Qn2FJ5waSstYF21h6Mx++QAr6rJI3M0x7em/2Itr68
 4FbgbQYmgwF59T4uTRswjlxrmUCYXmD/YCqJfEDy5caitZprZGhwJQ7d/
 PTP72Aam0syksQsTDrkaiE+btkj+WRrlQM/eime4X9UvoAFcY6iPSu9gd
 2Vx+Oqb3w5OgaKO8p8XgEpvJRnSizEqWZtGPIstt/oJKjnmqOprvQ6XUg
 RnUPIg7uxkXcXrmrvaZLIkfYKGnjPVjnRIV8oizebI7YuYgZYrBJCx4ED
 PLfCqSK2DvSCzzDPOzRxMZkXlPcSNcjcp3JIbcybsi0jZyZXsqpOFXhAG w==;
X-CSE-ConnectionGUID: jj0Os751R+Ok8JDZd1C3gQ==
X-CSE-MsgGUID: 8fQuLSt3QjGbKuM1K1fvvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841554"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
X-CSE-ConnectionGUID: QZEY6jxpStKBgugyVwH7bg==
X-CSE-MsgGUID: KGzlTvJnQ8aEFuULoNM+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510934"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 0/9] Support run ticks for multi-queue use case
Date: Fri,  1 May 2026 17:53:33 -0700
Message-ID: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

In single queue use cases, the CTX TIMESTAMP can be used to track
context run ticks. In multi-queue scenarios the CTX_TIMESTAMP represents
run ticks of all the queues. To determine individual queue run ticks, we
need to use QUEUE TIMESTAMP.

The series adds support to read out QUEUE TIMESTAMP for multi-queue use
cases.

v2: Review comments incorporated

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Matthew Brost (1):
  drm/xe: Add timestamp_ms to LRC snapshot

Umesh Nerlige Ramappa (8):
  drm/xe/lrc: Use 64 bit ctx timestamp in the LRC snapshot
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
 drivers/gpu/drm/xe/xe_exec_queue.c       |  23 ++-
 drivers/gpu/drm/xe/xe_lrc.c              | 192 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |  10 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  11 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  14 ++
 drivers/gpu/drm/xe/xe_ring_ops.c         |   8 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 ++++
 9 files changed, 259 insertions(+), 33 deletions(-)

-- 
2.43.0

