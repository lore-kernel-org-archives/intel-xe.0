Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE3DC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 13:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD510E768;
	Thu,  8 Feb 2024 13:31:59 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BACD10E768;
 Thu,  8 Feb 2024 13:31:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vm=3A_Avoid_reserv?=
 =?utf-8?q?ing_zero_fences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 13:31:58 -0000
Message-ID: <170739911844.1106275.8006841971740385425@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/vm: Avoid reserving zero fences
URL   : https://patchwork.freedesktop.org/series/129668/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c03e3d1134e78460c4898d18ea682c00559cabb2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 8 14:21:15 2024 +0100

    drm/xe/vm: Avoid reserving zero fences
    
    The function xe_vm_prepare_vma was blindly accepting zero as the
    number of fences and forwarded that to drm_exec_prepare_obj.
    
    However, that leads to an out-of-bounds shift in the
    dma_resv_reserve_fences() and while one could argue that the
    dma_resv code should be robust against that, avoid attempting
    to reserve zero fences.
    
    Relevant stack trace:
    
    [773.183188] ------------[ cut here ]------------
    [773.183199] UBSAN: shift-out-of-bounds in ../include/linux/log2.h:57:13
    [773.183241] shift exponent 64 is too large for 64-bit type 'long unsigned int'
    [773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G     U             6.8.0-rc3-xe #1
    [773.183256] Hardware name: ASUS System Product Name/PRIME Z690-P D4, BIOS 2014 10/14/2022
    [773.183257] Call Trace:
    [773.183258]  <TASK>
    [773.183260]  dump_stack_lvl+0xaf/0xd0
    [773.183266]  dump_stack+0x10/0x20
    [773.183283]  ubsan_epilogue+0x9/0x40
    [773.183286]  __ubsan_handle_shift_out_of_bounds+0x10f/0x170
    [773.183293]  dma_resv_reserve_fences.cold+0x2b/0x48
    [773.183295]  ? ww_mutex_lock+0x3c/0x110
    [773.183301]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
    [773.183313]  xe_vm_prepare_vma+0x33/0x70 [xe]
    [773.183375]  xe_vma_destroy_unlocked+0x55/0xa0 [xe]
    [773.183427]  xe_vm_close_and_put+0x526/0x940 [xe]
    
    Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use drm_exec")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch aed7e9419a8e3775ed46af4cff2de11d7e76c960 drm-intel
c03e3d113 drm/xe/vm: Avoid reserving zero fences
-:37: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2714d5093620', maybe rebased or not pulled?
#37: 
Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use drm_exec")

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


