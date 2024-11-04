Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54ED1BDC0
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B878C10E482;
	Mon,  4 Nov 2024 16:13:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9834A10E49C;
 Mon,  4 Nov 2024 16:13:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Fix_potentia?=
 =?utf-8?q?l_GGTT_allocation_leak?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 16:13:54 -0000
Message-ID: <173073683461.1392002.11048404138050850356@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104144901.1903-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241104144901.1903-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Fix potential GGTT allocation leak
URL   : https://patchwork.freedesktop.org/series/140881/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 05894c0087b680f7554cefcd8ece626ca1d9361a
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Nov 4 15:49:01 2024 +0100

    drm/xe/pf: Fix potential GGTT allocation leak
    
    In unlikely event that we fail during sending the new VF GGTT
    configuration to the GuC, we will free only the GGTT node data
    struct but will miss to release the actual GGTT allocation.
    
    This will later lead to list corruption, GGTT space leak and
    finally risking crash when unloading the driver:
    
     [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-EIO)
     [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT
    
     [ ] list_add corruption. next->prev should be prev (ffff88813cfcd628), but was 0000000000000000. (next=ffff88813cfe2028).
     [ ] RIP: 0010:__list_add_valid_or_report+0x6b/0xb0
     [ ] Call Trace:
     [ ]  drm_mm_insert_node_in_range+0x2c0/0x4e0
     [ ]  xe_ggtt_node_insert+0x46/0x70 [xe]
     [ ]  pf_provision_vf_ggtt+0x7f5/0xa70 [xe]
     [ ]  xe_gt_sriov_pf_config_set_ggtt+0x5e/0x770 [xe]
     [ ]  ggtt_set+0x4b/0x70 [xe]
     [ ]  simple_attr_write_xsigned.constprop.0.isra.0+0xb0/0x110
    
     [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-ENOSPC)
     [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT
    
     [ ] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP NOPTI
     [ ] RIP: 0010:drm_mm_remove_node+0x1b7/0x390
     [ ] Call Trace:
     [ ]  <TASK>
     [ ]  ? die_addr+0x2e/0x80
     [ ]  ? exc_general_protection+0x1a1/0x3e0
     [ ]  ? asm_exc_general_protection+0x22/0x30
     [ ]  ? drm_mm_remove_node+0x1b7/0x390
     [ ]  ggtt_node_remove+0xa5/0xf0 [xe]
     [ ]  xe_ggtt_node_remove+0x35/0x70 [xe]
     [ ]  xe_ttm_bo_destroy+0x123/0x220 [xe]
     [ ]  intel_user_framebuffer_destroy+0x44/0x70 [xe]
     [ ]  intel_plane_destroy_state+0x3b/0xc0 [xe]
     [ ]  drm_atomic_state_default_clear+0x1cd/0x2f0
     [ ]  intel_atomic_state_clear+0x9/0x20 [xe]
     [ ]  __drm_atomic_state_free+0x1d/0xb0
    
    Fix that by using pf_release_ggtt() on the error path, which now
    works regardless if the node has GGTT allocation or not.
    
    Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 0a6cc4357ae4d824f909468ca1deed28ae5ac96f drm-intel
05894c0087b6 drm/xe/pf: Fix potential GGTT allocation leak
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
 [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-EIO)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


