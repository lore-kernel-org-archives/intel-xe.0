Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA143C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D894C10FB2A;
	Mon, 27 May 2024 14:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2z756la";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9CE10FB04
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716818368; x=1748354368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=47XnlZn74PN4srU/b/V164OYoC9HuJW/STnDwWU8GTw=;
 b=H2z756laJCueC3Yo+kGsM/XV7EdB4Z3WR/dWpqIpsydydeg+Y1tOwb1l
 ybhxb0jGs4vslrsCtxaAEOk1g2wTnmVa1IVBJ7W3SNxpUHBRtbQzWqLNK
 ZjX9G4wSVkL15j50McHk+nstyLM434uj28mVJxt1mb0ITLbDlqjP34Leq
 Ug+vnCtHdOrJ2F8EfuiAFJdUxuS9Bl4InmD1LEU4B+1R1nYDZ3zMJmByo
 fu6s7ISMik9WKSBhXKfV7jXO7UDAUGWGeC9fXH5OezFvIOWA1cvI2FZTf
 PBm6RGCS+Itfg9YIKu+kfYaCJ4gx1COUSdtTXANuiifgfn5UtN/tN2U3v Q==;
X-CSE-ConnectionGUID: jhUFn8CzTR2vu72+x3cVjw==
X-CSE-MsgGUID: h+AerXWkQomgFEDAjcU9Ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16090286"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16090286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:59:27 -0700
X-CSE-ConnectionGUID: 59H7Ku6tR1aoMC2qBnblJA==
X-CSE-MsgGUID: uHzrIIFjTUuLIzuM8AQ9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34858878"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.209])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:59:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 0/5] drm/xe: Allow migrate vm gpu submissions from reclaim
 context
Date: Mon, 27 May 2024 15:59:07 +0200
Message-ID: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
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
v3:
- Rebase on drm-tip.
v4:
- Add an assert (Matthew Brost)

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
 drivers/gpu/drm/xe/xe_sched_job.c        | 167 +++++++++++++----------
 drivers/gpu/drm/xe/xe_sched_job.h        |   5 +
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  20 ++-
 drivers/gpu/drm/xe/xe_trace.h            |   9 +-
 13 files changed, 237 insertions(+), 132 deletions(-)

-- 
2.44.0

