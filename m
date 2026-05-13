Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE14CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 10:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5A510E4F2;
	Wed, 13 May 2026 10:38:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05D10E4F2;
 Wed, 13 May 2026 10:38:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_LR_mode_TLB_coh?=
 =?utf-8?q?erence_for_userptr=2C_rebind=2C_and_exec_ordering?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 10:38:52 -0000
Message-ID: <177866873270.67158.10555889386381218068@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513101659.3470307-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260513101659.3470307-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe: LR mode TLB coherence for userptr, rebind, and exec ordering
URL   : https://patchwork.freedesktop.org/series/166501/
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
commit 5e03214c9163019b6e15459ec4fa2ea1cb998a62
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Wed May 13 15:46:59 2026 +0530

    drm/xe: LR mode TLB coherence for userptr, rebind, and exec ordering
    
    LR mode currently relies on context-switch based TLB coherence while
    per-batch invalidation is disabled. This is unsafe when hardware
    auto-tail update advances execution, allowing newly fetched work
    to run before the expected implicit coherence point at context
    -switch or re-enable.
    
    1.On the LR path, add a dependency on q->lr.pfence so newly
    submitted exec jobs wait for outstanding preempt/rebind work
    to fully complete. This avoids out-of-order execution where
    a new batch could run with stale TLB/PTE state.
    
    2.For LR rebinds in non-fault mode, force explicit invalidation
    instead of relying on implicit context re-enable behavior.
    This avoids stale TLB entries surviving across rebind.
    
    3.Include LR mode in the initial userptr invalidation condition so
    LR queues always perform the required TLB invalidation. This avoids
    cases where LR execution continues with stale userptr translations
    after a mapping change.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
+ /mt/dim checkpatch 896e027423be1efc1b1a690bc56bafe6cf49c213 drm-intel
5e03214c9163 drm/xe: LR mode TLB coherence for userptr, rebind, and exec ordering
-:27: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#27: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 75 lines checked


