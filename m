Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01224FAD3F0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 02:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70010E2E8;
	Thu, 23 Apr 2026 02:55:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451010E2E8;
 Thu, 23 Apr 2026 02:55:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_H?=
 =?utf-8?q?andle_lost_message_during_VF_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 02:55:53 -0000
Message-ID: <177691295314.61.5558705079084409273@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Handle lost message during VF migration
URL   : https://patchwork.freedesktop.org/series/165324/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f5b81dfb3843e8d8b68b9625b950b5d53d094571
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed Apr 22 19:49:56 2026 -0700

    drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF post-migration recovery
    
    Multi-queue groups use CGP_SYNC H2G messages to notify GuC of queue
    additions and priority changes. If a CGP_SYNC was in-flight when a VF
    migration was detected, the response will never arrive and sync_pending
    will be stuck set, causing a timeout on the next attempt.
    
    Introduce a needs_cgp_sync flag in xe_guc_exec_queue (mirroring the
    existing needs_resume / needs_suspend / needs_cleanup pattern) to track
    this case:
    
    - In guc_exec_queue_revert_pending_state_change(), if sync_pending is
      set on a multi-queue exec_queue, clear it (preventing a timeout on
      recovery) and set needs_cgp_sync, unless the queue is about to be
      re-registered (which will issue its own CGP_SYNC).
    
    - In guc_exec_queue_replay_pending_state_change(), if needs_cgp_sync is
      set, push a STATIC_MSG_CGP_SYNC to the scheduler head so the CGP_SYNC
      is replayed after unpause.
    
    Wire up the new CGP_SYNC_MSG opcode and STATIC_MSG_CGP_SYNC static
    message slot, along with __guc_exec_queue_process_msg_cgp_sync() to
    handle the message in the scheduler workqueue.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 9917a06970fd6775b7b4259be6cca21cb4e2b165 drm-intel
5fd1f8d92131 drm/xe/multi_queue: Remove redundant assignment in guc_exec_queue_run_job
-:10: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#10: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:10: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#10: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 11 lines checked
d75124646be5 drm/xe/multi_queue: Refactor CGP_SYNC send path
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 97 lines checked
d8a7d92ea369 drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and queue registration paths
-:12: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#12: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#12: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 16 lines checked
f5b81dfb3843 drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF post-migration recovery
-:29: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#29: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:29: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#29: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 93 lines checked


