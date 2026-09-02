Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B07C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C910E4C2;
	Wed,  2 Sep 2026 17:02:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6910E4C2;
 Wed,  2 Sep 2026 17:02:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_page_offlining?=
 =?utf-8?q?_support_=28rev24=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 17:02:42 -0000
Message-ID: <178836856271.112572.2580744435410108940@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

Series: Add memory page offlining support (rev24)
URL   : https://patchwork.freedesktop.org/series/161473/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ee8bd1bfff88c1a26b8f98014bbd82c47ecb2375
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Sep 2 20:23:58 2026 +0530

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
    
    v6(Himal):
    - Add warning to rebind driver post test run
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
    
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 1ddb465787c65331f609fbe02998ce1643b041c7 drm-intel
dff3e0e16c13 drm/xe: Link VRAM object with gpu buddy
cd41da48d7b0 drm/xe: Link LRC BO and its execution queue with safe lifetime rules
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Introduce an execution queue back-pointer (`q`) within `struct xe_bo`, primarily

-:45: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#45: 
Co-authored-by: Copilot

-:45: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Copilot'
#45: 
Co-authored-by: Copilot

total: 1 errors, 2 warnings, 0 checks, 100 lines checked
6cefc976e143 drm/xe: Export xe_ttm_bo_purge()
f6c1071d5cee drm/xe: Handle NULL resource and allow purging of VRAM pages
182cce6f4c1f drm/xe/bo: Make xe_bo_is_user() public
a8d067c4d6e0 drm/xe: Guard teardown paths against purged BOs
8f351bbcecbf drm/xe/vram: Extract buddy allocation and free helpers
5bd9540dc81e drm/xe/vram: Add page offline data structures and lifecycle
8be2e05c08eb drm/xe/vram: Add VRAM page offline fault handler
-:49: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#49: 
Co-authored-by: Copilot

-:49: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Copilot'
#49: 
Co-authored-by: Copilot

total: 1 errors, 1 warnings, 0 checks, 362 lines checked
7aad507c44de drm/xe/configfs: Add disable_vram_page_offline attribute
45d735196c5d drm/xe/ras: Cache disable_vram_page_offline policy at init
5beddc6e63e3 drm/xe/vram: Check disable_vram_page_offline policy in fault handler
d19a8863a078 drm/xe: Expose bad VRAM pages via debugfs
2379b91471c9 drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN
ee8bd1bfff88 drm/xe: Add fault-inject based VRAM page offline injection


