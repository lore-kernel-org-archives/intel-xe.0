Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16739C25B7D
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 15:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D9E10E756;
	Thu, 23 May 2024 15:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3V+NglN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694BF10E756
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716478172; x=1748014172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NMfWodBX0u/VHGLGeQMfWi5E0nCr22lKLuGxOtrV4e8=;
 b=G3V+NglN1A/ckhBYPtdo6JBwM5+v730jPpL4TFNKxYgDpaBgJsHHGUMn
 HKxi8sFdSeIgXSE2rw1P84JYb3NFDZ6b7U6Nrbe0alwUGhYrKnzo3Kng6
 bLql2cdK0Swvms7tRCqWs5dTKPi7jJbs7W7TOIB8lEWeu+jhdTeJnvNKq
 cS1Vc0PJPzQ2nK8bNeMqtsWKercc6If9qM+5psKuBb5WoPSOoXQ0NP5l7
 CDC/qMyYNDxe/6kQFZmm246hJ0k/kjoP3NWCbLUxWNd3HnbLmiBoK4S7Y
 SVAujQYa9TJ0Lw0MUcwqvJb3l3TT0Y9SyKIQBIZguhpr6c1FB4Nva7zSU A==;
X-CSE-ConnectionGUID: SaoG7Bz0RD6T9Ea5Q4PlKw==
X-CSE-MsgGUID: wi85zxm+RqK45BdE4MoYwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11663777"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="11663777"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:29:30 -0700
X-CSE-ConnectionGUID: slPgHrClQAq373x5YhfcbQ==
X-CSE-MsgGUID: DEIK9kyhT2ugJ/P0aWxTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33774198"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:29:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/5] drm/xe: Allow migrate vm gpu submissions from reclaim
 context
Date: Thu, 23 May 2024 17:29:06 +0200
Message-ID: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On lunar lake, we need to be able to copy CCS compression metadata from
reclaim context when using a shrinker.
ince we do dma_fence allocations under the
struct xe_migrate::job_mutex, we're facing a lockdep violation.
This patchset deals with moving the job + fence allocation out of
the job_mutex by splitting up the fence allocation- and
initialization.

v2:
- Add a patch from Matthew Brost to fix up the use of
  composite fence seqno.
- A couple of bugfixes as detailed in patch 3.

Matthew Brost (1):
  drm/xe: Decouple job seqno and lrc seqno

Thomas Hellström (4):
  drm/xe: Split lrc seqno fence creation up
  drm/xe: Don't initialize fences at xe_sched_job_create()
  drm/xe: Remove xe_lrc_create_seqno_fence()
  drm/xe: Move job creation out of the struct xe_migrate::job_mutex

 drivers/gpu/drm/xe/xe_exec_queue.c       |   5 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  10 --
 drivers/gpu/drm/xe/xe_guc_submit.c       |   5 +-
 drivers/gpu/drm/xe/xe_hw_fence.c         |  59 ++++++--
 drivers/gpu/drm/xe/xe_hw_fence.h         |   7 +-
 drivers/gpu/drm/xe/xe_lrc.c              |  39 +++++-
 drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  17 ++-
 drivers/gpu/drm/xe/xe_ring_ops.c         |  22 +--
 drivers/gpu/drm/xe/xe_sched_job.c        | 165 +++++++++++++----------
 drivers/gpu/drm/xe/xe_sched_job.h        |   5 +
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  20 ++-
 drivers/gpu/drm/xe/xe_trace.h            |   9 +-
 13 files changed, 235 insertions(+), 132 deletions(-)

-- 
2.44.0

