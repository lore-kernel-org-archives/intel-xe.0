Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55DCC54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 10:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B610EE74;
	Thu, 30 Jul 2026 10:18:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452CD10EE74;
 Thu, 30 Jul 2026 10:18:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 10:18:14 -0000
Message-ID: <178540669427.4530.18165291900506065051@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
In-Reply-To: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev16)
URL   : https://patchwork.freedesktop.org/series/161473/
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
commit 5f79b71c6d86e69074cdae08b0011e0d16fc477e
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jul 30 15:41:31 2026 +0530

    drm/xe: Add fault-inject based VRAM page offline injection
    
    Add a fault-inject based debugfs interface for testing VRAM page
    offlining. This replaces the previous standalone debugfs approach
    with the standard kernel fault-inject infrastructure.
    
    Two debugfs entries are created under the xe debugfs root for
    CRI platforms:
    - inject_mempage_offline/: Standard fault-inject knobs (probability,
      times, interval, etc.) — only available with
      CONFIG_FAULT_INJECTION_DEBUG_FS
    - inject_mempage_offline_trigger: Write a PFN value to inject a
      specific page, or write "0" to auto-pick the last unallocated
      VRAM page
    
    The trigger accepts:
    - "0"      : auto-pick last unallocated page
    - "0xPFN"  : inject fault at a specific PFN address
    
    On kernels with CONFIG_FAULT_INJECTION_DEBUG_FS, injection is gated
    by should_fail() (probability/times must be configured first).
    On kernels without it, the trigger always injects directly.
    
    The injection reports the page as faulted via
    xe_ttm_vram_handle_addr_fault(), exercising the full page offlining
    path.
    
    Usage (with CONFIG_FAULT_INJECTION_DEBUG_FS):
      echo 100 > inject_mempage_offline/probability
      echo 1 > inject_mempage_offline/times
      echo 0 > inject_mempage_offline_trigger
    
    Usage (without CONFIG_FAULT_INJECTION_DEBUG_FS):
      echo 0 > inject_mempage_offline_trigger
    
    v2(sashiko):
    - use cond_resched()
    - validate input first and fix addr < 0 case
    - validate vr, move block, found var as local to scope_guard
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 5e24f68d311764bf343f9def49b752b509dfd5fd drm-intel
76cf3604040c drm/xe: Link VRAM object with gpu buddy
805f3444d0c6 drm/gpu: Add gpu_buddy_allocated_addr_to_block helper
f3a511f775fa drm/xe: Link LRC BO and its execution Queue
d378b1954c92 drm/xe: Extend BO purge to handle vram pages as well
f2692dfed6ae drm/xe: Handle physical memory address error
62dc6ec4e57c drm/xe/configfs: Add vram bad page reservation policy
7c55e51de9f3 drm/xe/cri: Add sysfs interface for bad gpu vram pages
e6d021690468 drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
-:180: ERROR:CODE_INDENT: code indent should use tabs where possible
#180: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:562:
+                atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &q->ban_reason);$

-:180: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#180: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:562:
+                atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &q->ban_reason);$

-:181: ERROR:CODE_INDENT: code indent should use tabs where possible
#181: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:563:
+                smp_wmb(); /* Force bit change to finish before state change triggers */$

-:181: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#181: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:563:
+                smp_wmb(); /* Force bit change to finish before state change triggers */$

-:182: ERROR:CODE_INDENT: code indent should use tabs where possible
#182: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:564:
+                q_to_put = q;$

-:182: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#182: FILE: drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:564:
+                q_to_put = q;$

total: 3 errors, 3 warnings, 0 checks, 136 lines checked
5f79b71c6d86 drm/xe: Add fault-inject based VRAM page offline injection


