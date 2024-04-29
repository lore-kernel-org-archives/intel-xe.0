Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BDC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 16:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15810E93D;
	Mon, 29 Apr 2024 16:34:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09910E93D;
 Mon, 29 Apr 2024 16:34:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fggtt=3A_No_ne?=
 =?utf-8?q?ed_to_use_xe=5Fpm=5Fruntime=5Fget=5Fnoresume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Apr 2024 16:34:49 -0000
Message-ID: <171440848931.1757642.3937921272645262926@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429162915.1831945-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240429162915.1831945-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/xe_ggtt: No need to use xe_pm_runtime_get_noresume
URL   : https://patchwork.freedesktop.org/series/133031/
State : success

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
commit c41d51bb1c5a41573232326508bb534351601e43
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Apr 29 09:29:15 2024 -0700

    drm/xe/xe_ggtt: No need to use xe_pm_runtime_get_noresume
    
    Switching from xe_device_mem_access_get/put to xe_pm_runtime_get/put
    results in the following WARNING in xe_oa:
    
    [11614.356168] xe 0000:00:02.0: Missing outer runtime PM protection
    [11614.356187] WARNING: CPU: 1 PID: 13075 at drivers/gpu/drm/xe/xe_pm.c:549 xe_pm_runtime_get_noresume+0x60/0x80 [xe]
    ...
    [11614.356377] Call Trace:
    [11614.356379]  <TASK>
    [11614.356381]  ? __warn+0x7e/0x180
    [11614.356387]  ? xe_pm_runtime_get_noresume+0x60/0x80 [xe]
    [11614.356507]  xe_ggtt_remove_node+0x22/0x80 [xe]
    [11614.356546]  xe_ttm_bo_destroy+0xea/0xf0 [xe]
    [11614.356579]  xe_oa_stream_destroy+0xf7/0x120 [xe]
    [11614.356627]  xe_oa_release+0x35/0xc0 [xe]
    [11614.356673]  __fput+0xa1/0x2d0
    [11614.356679]  __x64_sys_close+0x37/0x80
    [11614.356697]  do_syscall_64+0x6d/0x140
    [11614.356700]  entry_SYSCALL_64_after_hwframe+0x71/0x79
    [11614.356702] RIP: 0033:0x7f2b37314f67
    
    There seems to be no reason to use xe_pm_runtime_get_noresume in xe_ggtt
    functions. Just use xe_pm_runtime_get.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch acf512bb5ff4d2e8ed5ef67444b6c1f92a222d77 drm-intel
c41d51bb1c5a drm/xe/xe_ggtt: No need to use xe_pm_runtime_get_noresume


