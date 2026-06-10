Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B49CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 16:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92310E4C5;
	Wed, 10 Jun 2026 16:14:44 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02D810E4C5;
 Wed, 10 Jun 2026 16:14:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_fix_job_timeout_recovery_for_unstarted_jobs_and_k?=
 =?utf-8?q?ernel_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 16:14:43 -0000
Message-ID: <178110808384.65607.4430156377783923478@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610152548.404575-3-rodrigo.vivi@intel.com>
In-Reply-To: <20260610152548.404575-3-rodrigo.vivi@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/xe: fix job timeout recovery for unstarted jobs and kernel queues
URL   : https://patchwork.freedesktop.org/series/168267/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f3caf06b3b06b99650c7c7cecd4dbb922ae2141
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Jun 10 11:25:50 2026 -0400

    drm/xe/lrc: fix spurious warning when reading context timestamp
    
    Fixes the following warning that fires during timeout handling for a
    context running on the USM-reserved copy engine:
    
      xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization
      WARNING: at engine_id_to_hwe+0x88/0xc0 [xe]
        xe_lrc_context_timestamp+0x61/0xb0 [xe]
        guc_exec_queue_timedout_job+0x713/0x1020 [xe]
    
    class:instance 3:8 is XE_ENGINE_CLASS_COPY on the highest BCS instance,
    which xe_hw_engine.c reserves for USM (gt->usm.reserved_bcs_instance) and
    on which the migrate engine runs kernel contexts. When such a context's
    utilization is read - e.g. from the TDR path - engine_id_to_hwe()
    rejected it because xe_hw_engine_is_reserved() is true, firing WARN_ONCE
    and returning NULL, which made the timestamp read silently fall back to
    stale data.
    
    The reserved-engine guard was added defensively with the original WA BB
    utilization support and simply overlooked that the migrate engine is a
    valid, present engine whose CTX_TIMESTAMP can legitimately be read.
    
    Allow the USM-reserved copy engine specifically (xe_gt_is_usm_hwe()),
    while still rejecting the other reserved cases (GSCCS / XE_ENGINE_CLASS_
    OTHER and ccs_mode-disabled compute engines), which would indeed be
    unexpected on this path. The dynamic engine resolution via the ENGINE_ID
    stashed in the PPHWSP by the WA BB is kept intact, so utilization for
    load-balanced/virtual exec queues still resolves the engine the context
    is actually running on.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Assisted-by: GitHub-Copilot:claude-sonnet-4.6
    Assisted-by: GitHub-Copilot:claude-opus-4.8
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch fc59f76558703febba8056be87d1c97d14f7485e drm-intel
6d3e7496fef5 drm/xe: fix job timeout recovery for unstarted jobs and kernel queues
3f3caf06b3b0 drm/xe/lrc: fix spurious warning when reading context timestamp
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
  xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization

total: 0 errors, 1 warnings, 0 checks, 20 lines checked


