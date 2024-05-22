Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C77C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 11:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E9B10E192;
	Wed, 22 May 2024 11:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHCzjK3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8D610E192
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716376693; x=1747912693;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Am+mz04pAFMPweZu7L/eS0jtscfVgWCHQyYZ205zpIk=;
 b=OHCzjK3IGNAwBG87bZLH3djvIaBik/6ltKCA2qR9qG/Fm8KPOd8HxLas
 dYc7f2AGb2CEon9WIMhDdQOKyWFXMpfksZ45zHh9WRLeJO+iiahFlcjmr
 WqbrnbU50crhWlGc3GsIbxX2Fq+gN11DWHDjv02vm6qkyr7Xyl6YK/vSu
 e0wz2kEZZdw2OGOIxHvEaOvqMo4lBQoOJvxAuodZkuArWdsBHEIx79wio
 jaUdyGbtovdHWePdjLaI5JTObj9cwBpxZTW52w/qop9kkMXRuHrt5D2G+
 RaawboqyDT5eKQlyy3PRKHn89rOuS02FxfIICUixXMjYKH9Japts84PWQ w==;
X-CSE-ConnectionGUID: sDUDDxarRmCqMG2WpcNenA==
X-CSE-MsgGUID: Hukk43MLQm2FTnvGgb+EPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="35128282"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="35128282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 04:18:12 -0700
X-CSE-ConnectionGUID: dV1EeqS7RtCw3a1WTYyQ/Q==
X-CSE-MsgGUID: BfezZKaaTlOFVReMyaJovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="64097067"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.224])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 04:18:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/4] drm/xe: Allow migrate vm gpu submissions from reclaim
 context
Date: Wed, 22 May 2024 13:17:47 +0200
Message-ID: <20240522111751.80380-1-thomas.hellstrom@linux.intel.com>
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

However since we do dma_fence allocations under the
struct xe_migrate::job_mutex, we're facing a lockdep violation.
This patchset deals with moving the job + fence allocation out of
the job_mutex by splitting up the fence allocation- and
initialization.

Thomas Hellström (4):
  drm/xe: Split lrc seqno fence creation up
  drm/xe: Don't initialize fences at xe_sched_job_create()
  drm/xe: Remove xe_lrc_create_seqno_fence()
  drm/xe: Move job creation out of the struct xe_migrate::job_mutex

 drivers/gpu/drm/xe/xe_exec_queue.c       |   5 -
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  10 --
 drivers/gpu/drm/xe/xe_hw_fence.c         |  59 +++++++--
 drivers/gpu/drm/xe/xe_hw_fence.h         |   7 +-
 drivers/gpu/drm/xe/xe_lrc.c              |  39 +++++-
 drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c          |  17 ++-
 drivers/gpu/drm/xe/xe_ring_ops.c         |  12 +-
 drivers/gpu/drm/xe/xe_sched_job.c        | 152 +++++++++++++----------
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  18 ++-
 drivers/gpu/drm/xe/xe_trace.h            |   2 +-
 11 files changed, 206 insertions(+), 119 deletions(-)

-- 
2.44.0

