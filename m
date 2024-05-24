Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5EC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 07:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5D110E5CD;
	Fri, 24 May 2024 07:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUsIV6PJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C805410E073
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716535194; x=1748071194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=005y/X4IXAiO6wT0b4AbkIGCeO2ruHhRSUpJ46yv2sM=;
 b=XUsIV6PJJiGj3v6L/RxMlw4gr8nSQ5x/fUwYxDcRXSThjWtW1LBlHF7p
 bXlL50/0owGEAefjW+hUvpC/5Y+B+PzPAKDjuUuvDxzM+rtDMKV6mwr6W
 Cmq+hzPXxZexpGheUr3XAX8V8Tv6LkVNTKt2Rn+zvVwGMrV8/R2PcjHdm
 zSmFuwBONSVScxAlTKkmtZEIddSSr25VM5MdcECLmtba2oyYvU9l6aQoK
 YES0Ina23ix+s8kDQRwnLRXpSgmeomHGjtWN+iiJosPcwCbOyc0epCJv5
 JqrrOsV2JOVskGwqhk5FtWf8vSoEw8nws6OompJzFn3yi6Mt7vs/3azTW g==;
X-CSE-ConnectionGUID: OBNB+Ed7T+iHCm0A80Nnaw==
X-CSE-MsgGUID: Q+iNKnCDQyWdoMYqJUi98A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13130601"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13130601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:53 -0700
X-CSE-ConnectionGUID: 2pEkXUlgSSeBAWx7LtIRpQ==
X-CSE-MsgGUID: e14NHd8wQ8KFT0QgIdIziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="64751288"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/5] drm/xe: Allow migrate vm gpu submissions from reclaim
 context
Date: Fri, 24 May 2024 09:19:35 +0200
Message-ID: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
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

