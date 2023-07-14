Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87FC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 00:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D075110E0BF;
	Fri, 14 Jul 2023 00:04:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E80C10E0BF;
 Fri, 14 Jul 2023 00:04:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4BAE9A47E9;
 Fri, 14 Jul 2023 00:04:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Fri, 14 Jul 2023 00:04:35 -0000
Message-ID: <168929307530.13874.10482838058487209013@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230714000222.12396-1-brian.welty@intel.com>
In-Reply-To: <20230714000222.12396-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_BUG=5FON_during_bind_with_prefetch_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix BUG_ON during bind with prefetch (rev2)
URL   : https://patchwork.freedesktop.org/series/120646/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 361f9b04e337c8a68eb5ab47fba20bc6a7dfdd90
Author: Brian Welty <brian.welty@intel.com>
Date:   Thu Jul 13 17:02:22 2023 -0700

    drm/xe: Fix BUG_ON during bind with prefetch
    
    It was missed that print_op needs to include DRM_GPUVA_OP_PREFETCH.
    
    Else we hit the impossible BUG_ON:
    [  886.371040] ------------[ cut here ]------------
    [  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
    [  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
    [  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m
    [  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
    ...
    [  886.371517] Call Trace:
    [  886.371525]  <TASK>
    [  886.371531]  ? __die_body+0x1a/0x60
    [  886.371546]  ? die+0x38/0x60
    [  886.371557]  ? do_trap+0x10a/0x120
    [  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
    
    v2: add debug print for PREFETCH in print_op
    
    Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 17d3e3fbeb4ee15f7b89cedff2d1f2662dffbf97 drm-intel
361f9b04e drm/xe: Fix BUG_ON during bind with prefetch
-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd39e49e2ad38', maybe rebased or not pulled?
#24: 
Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


