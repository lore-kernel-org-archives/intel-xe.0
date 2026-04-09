Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81D2F364BC
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8EF10E052;
	Thu,  9 Apr 2026 20:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcYA0mel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D5910E12D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767041; x=1807303041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QckqA07oUEW0adjRbHzJ0bmfIgQm6BKIUfB9WWHLzXY=;
 b=NcYA0melpqMYHwyRrFf26xSyHxj/33itQ4WYyyXr5PTcMHALD8ARHRAm
 h8cl6XApAkv14PQoUgmIQKpLtcFZ7NgRUEJZBVOCFG9I8cqoENZNmjzz0
 pWVwDOfHELm+dVT2iC1nA4MlPzJ7XPfa9cwzBqvjWDOGTI+UKTPwfJ2IG
 pk1TRxkVpahO1iZotfvvpsvaQh83qOQ2XiMJi+rBFQE126NdxSVD5sMAW
 V/P65FcZI1QJ7WbE5BY+acDU6abzBbD2r1uFl9qpPtTG9SxL6Dgh2H4wl
 e7XDA/PYoPeC9VZzH5UDeO3u47cttZ/uRtesfWnHvMSX948k1MTlmuXn6 w==;
X-CSE-ConnectionGUID: Q+MDOHEpS4SaWWv+9wurMA==
X-CSE-MsgGUID: f6DRugnKRXmbxviVKJ/5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692620"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692620"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: coama5TjTZCC979OsgMRhQ==
X-CSE-MsgGUID: cOQqEfc+TSqfNMiR7kY42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881113"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 0/5] Support run ticks for multi-queue use case
Date: Thu,  9 Apr 2026 13:37:15 -0700
Message-ID: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (5):
  drm/xe/multi_queue: Store primary queue and position info in LRC
  drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
  drm/xe/multi_queue: Capture queue run times for active queues
  drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for
    multi-queue
  drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   8 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 166 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.h              |   6 +
 drivers/gpu/drm/xe/xe_lrc_types.h        |  13 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |   6 +
 drivers/gpu/drm/xe/xe_ring_ops.c         |   8 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 ++++
 9 files changed, 218 insertions(+), 23 deletions(-)

-- 
2.43.0

