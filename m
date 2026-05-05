Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA16FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666EB10E4C1;
	Tue,  5 May 2026 23:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtR8AJvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34810E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024657; x=1809560657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PK46u13vopVLozsomqxdmwq+bJmssCWmHFegkold/JE=;
 b=AtR8AJvmbF+XCX1FsJcfbCp8rM3jQbmURy89VBRc/ln2qMVqYMVbbE3t
 /paIJ6nWBm8CIbPHzq4R3LWk+a3Ybkk/H4X4PkxOKOjprVDl3ucbx/sWi
 2wwh73zg1RN/hkjNeaabpF5q/W3/VY/+2lJY13vKnfw2Nv3WUVQ4wmVKt
 5AtAZIYtGBPpwFbdZ7NTEZ3Ue6I28aLJJI36FS5/gM8IAT1wFF1StN1Iu
 7cU6SFHrTmGOU8mjC60K3IYP5Cxpa2+Z8GOIbrVte7m1mJ7X6Hv3dUyus
 M1T1klNmgXopgE43BGTWqo7/pB/PN8vRJ6N65P9ohjowJfxtYQ5uKUWGy g==;
X-CSE-ConnectionGUID: 7LOntBcKT/OGVIdRhZn7EQ==
X-CSE-MsgGUID: jPicNToAT6292cu33dagpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771091"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: bLnokt2WTUGG5kHrT6YD2Q==
X-CSE-MsgGUID: 0Acia7LITkCJynPgu/nj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569028"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 00/11] Support run ticks for multi-queue use case
Date: Tue,  5 May 2026 16:44:09 -0700
Message-ID: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c       |  12 +-
 drivers/gpu/drm/xe/xe_gt.c               |  14 ++
 drivers/gpu/drm/xe/xe_gt.h               |   3 +
 drivers/gpu/drm/xe/xe_lrc.c              | 222 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              |  10 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  11 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  14 ++
 drivers/gpu/drm/xe/xe_ring_ops.c         |   8 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h        |  29 +++
 11 files changed, 273 insertions(+), 57 deletions(-)

-- 
2.51.0

