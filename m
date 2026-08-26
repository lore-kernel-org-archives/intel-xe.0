Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B9CC61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC63C10E28B;
	Wed, 26 Aug 2026 09:39:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0117D10E28B;
 Wed, 26 Aug 2026 09:39:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_drm/xe/guc=3A_Fix_wake=5Fup_race_in_handle=5Fsched=5Fd?=
 =?utf-8?q?one?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Legowski" <jakub.legowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 09:39:12 -0000
Message-ID: <178773715200.85340.4320806157741820014@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826093325.3233742-1-jakub.legowski@intel.com>
In-Reply-To: <20260826093325.3233742-1-jakub.legowski@intel.com>
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

Series: series starting with [v1,1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
URL   : https://patchwork.freedesktop.org/series/172773/
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
commit 62b26ec7f1309fc8751726781f5a9df2b87e5c2f
Author: Jakub Legowski <jakub.legowski@intel.com>
Date:   Wed Aug 26 11:33:25 2026 +0200

    drm/xe/guc: Fix wake_up race in handle_sched_done
    
    Move wake_up_all() after clear_exec_queue_pending_disable()
    
    When a SCHED_DONE G2H arrives for a banned exec queue,
    handle_sched_done() calls wake_up_all() before
    clear_exec_queue_pending_disable(). This creates a race with the
    wait_event_timeout() in guc_exec_queue_timedout_job() that waits
    for pending_disable to be cleared:
    
        smp_rmb();
        ret = wait_event_timeout(guc->ct.wq,
                     ...
                     ...);
    
    This was observed as:
    [drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job timeout: seqno=4294967169, lrc_seqno=4294967169, guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001
    
    Noving the wake_up_all() (along with its smp_wmb())
    after all paths that clear pending_disable, ensuring that waiters
    always observe the updated state when woken.
    
    Same as for runnable_state == 1 in the beginning of
    handle_sched_done().
    
    Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
+ /mt/dim checkpatch 65c21c0124ae9521c7719c330d56bb9d33b2efc3 drm-intel
62b26ec7f130 drm/xe/guc: Fix wake_up race in handle_sched_done
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
[drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job timeout: seqno=4294967169, lrc_seqno=4294967169, guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


