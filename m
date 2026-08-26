Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A46C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BAC10E2C6;
	Wed, 26 Aug 2026 14:37:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67EA10E2C6;
 Wed, 26 Aug 2026 14:37:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev21=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Aug 2026 14:37:51 -0000
Message-ID: <178775507174.85743.18434083921448311140@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev21)
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
commit d39a1795d95fb2ac44d9990e28f73a9d2675d15e
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Aug 26 19:21:49 2026 +0530

    drm/xe: Add fault-inject based VRAM page offline injection
    
    Add a fault-inject based debugfs interface for testing VRAM page
    offlining. This replaces the previous standalone debugfs approach
    with the standard kernel fault-inject infrastructure.
    
    Two debugfs entries are created under the xe debugfs root for
    CRI platforms:
    - inject_mempage_offline/: Standard fault-inject knobs (probability,
      times, interval, etc.) created by fault_create_debugfs_attr().
      Without CONFIG_FAULT_INJECTION_DEBUG_FS, the stub returns
      ERR_PTR(-ENODEV) and no knobs are created, making the trigger
      effectively a no-op.
    - inject_mempage_offline_trigger: Write a PFN value to inject a
      specific page, or write "0" to auto-pick the last unallocated
      VRAM page
    
    The trigger accepts:
    - "0"      : auto-pick last unallocated page
    - "0xPFN"  : inject fault at a specific PFN address
    
    Usage:
      echo 100 > inject_mempage_offline/probability
      echo 1 > inject_mempage_offline/times
      echo 0 > inject_mempage_offline_trigger
    
      probability: likelihood of should_fail() returning true (0-100)
      times: number of times injection is allowed (-1 for unlimited)
    
    v5(Sashiko):
    - exclude SRIOV and remove dpa_base addition, already absolute dpa
    v4(Himal):
    - Use xe_fault_mempage_offline() instead of IS_ENABLED() +
      direct should_fail(). CONFIG_FAULT_INJECTION_DEBUG_FS is now
      an implicit requirement for the trigger to function.
    v3(Himal):
    - Use FAULT_ACTION
    v2(sashiko):
    - use cond_resched()
    - validate input first and fix addr < 0 case
    - validate vr, move block, found var as local to scope_guard
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 4a47d4b5bf957bd7e34d8d3ab7096c42161892c6 drm-intel
a3fbfca74c00 drm/xe: Link VRAM object with gpu buddy
de302ba0f44c drm/xe: Link LRC BO and its execution Queue
aaeec1674025 drm/xe: Extend BO purge to handle vram pages as well
a45957fb1d8b drm/xe/bo: Make xe_bo_is_user() public
4c21381f3095 drm/xe: Guard teardown paths against purged BOs
b6265a805ca8 drm/xe/vram: Extract buddy alloc and free helpers
90aeab6891c1 drm/xe/vram: Add page offline data structures and lifecycle
088e92e2342d drm/xe/vram: Add VRAM page offline fault handler
caf644fea7cb drm/xe/configfs: Add bad_page_reservation attribute
f96f12f37dbe drm/xe/ras: Cache bad_page_reservation policy at init
a32253310cfb drm/xe/vram: Check bad_page_reservation policy in fault handler
1215ea99cb79 drm/xe: Expose bad VRAM pages via debugfs
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr (includes tile offset)

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
f863dd60b2ae drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
d39a1795d95f drm/xe: Add fault-inject based VRAM page offline injection


