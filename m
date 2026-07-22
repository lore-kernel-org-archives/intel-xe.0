Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BA5C4452B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 01:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523B510EBF5;
	Wed, 22 Jul 2026 01:02:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AB410EBF4;
 Wed, 22 Jul 2026 01:02:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_H?=
 =?utf-8?q?andle_lost_message_during_VF_migration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 01:02:03 -0000
Message-ID: <178468212308.213858.3573251953736929891@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260722005617.2912343-4-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Handle lost message during VF migration (rev2)
URL   : https://patchwork.freedesktop.org/series/165324/
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
commit 2fd65acdd84abb6aaf35ead619967e8af1eea9de
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Jul 21 17:56:17 2026 -0700

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
+ /mt/dim checkpatch 5726f9c4bde0290e5e60e636b9632bb03a57498c drm-intel
0769bfc666d1 drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and queue registration paths
-:12: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#12: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
2fd65acdd84a drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF post-migration recovery
-:29: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#29: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 93 lines checked


