Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22D3C25B4F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 10:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD910F45E;
	Tue,  7 May 2024 10:08:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8028E10F45E;
 Tue,  7 May 2024 10:08:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_UBSAN_shift?=
 =?utf-8?q?-out-of-bounds_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 May 2024 10:08:26 -0000
Message-ID: <171507650652.1961299.7674316435997355208@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
In-Reply-To: <20240507080456.613786-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix UBSAN shift-out-of-bounds failure
URL   : https://patchwork.freedesktop.org/series/133270/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 752a45c6358819165f2f871d2c649ea77ac2a107
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue May 7 08:04:56 2024 +0000

    drm/xe: Fix UBSAN shift-out-of-bounds failure
    
    Here is the failure stack:
    [   12.988209] ------------[ cut here ]------------
    [   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
    [   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
    [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
    [   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
    [   12.988239] Call Trace:
    [   12.988240]  <TASK>
    [   12.988242]  dump_stack_lvl+0xd7/0xf0
    [   12.988248]  dump_stack+0x10/0x20
    [   12.988250]  ubsan_epilogue+0x9/0x40
    [   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
    [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
    [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
    [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
    [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
    [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
    
    It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
    And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
    For the num_fences, it should be 1 at least.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 980de4c8f9c4fc65bd51d355372e06dc576c3ea7 drm-intel
752a45c63588 drm/xe: Fix UBSAN shift-out-of-bounds failure
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


