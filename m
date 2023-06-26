Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AEEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 12:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F7110E1FA;
	Mon, 26 Jun 2023 12:56:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD5F510E1FA;
 Mon, 26 Jun 2023 12:56:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CAA46A00CC;
 Mon, 26 Jun 2023 12:56:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 26 Jun 2023 12:56:17 -0000
Message-ID: <168778417782.5705.17718054060217485802@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626105037.43780-15-matthew.auld@intel.com>
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=5Fdevice=5Fmem=5Faccess_fixes_and_related_bits_=28rev2=29?=
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

Series: xe_device_mem_access fixes and related bits (rev2)
URL   : https://patchwork.freedesktop.org/series/119213/
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
commit 22347f98439cbf4587420d3a78ff8fabada3697b
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jun 26 11:50:51 2023 +0100

    drm/xe: add lockdep annotation for xe_device_mem_access_get()
    
    The atomics here might hide potential issues, so add a dummy lock with
    the idea that xe_pm_runtime_resume() is eventually going to be called
    when we are holding it. This only needs to happen once and then lockdep
    can validate all callers and their locks.
    
    v2: (Thomas Hellström)
     - Prefer static lockdep_map instead of full blown mutex.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d3fc5af59c7c17ad1a0272c49dbff84534d9d606 drm-intel
12dc13a5b drm/xe: fix xe_device_mem_access_get() races
-:56: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#56: 
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258

-:76: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "xe_pm_read_callback_task"
#76: FILE: drivers/gpu/drm/xe/xe_device.c:416:
+	if (xe_pm_read_callback_task(xe) != NULL)

-:227: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#227: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1109:
+	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)

total: 0 errors, 1 warnings, 2 checks, 287 lines checked
c18ae7d89 drm/xe/vm: tidy up xe_runtime_pm usage
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#13: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
f0e75364c drm/xe/debugfs: grab mem_access around forcewake
-:11: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#11: 
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/279

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
c497e9cf4 drm/xe/guc_pc: add missing mem_access for freq_rpe_show
b541505e3 drm/xe/mmio: grab mem_access in xe_mmio_ioctl
8e7037b5f drm/xe: ensure correct access_put ordering
859db692d drm/xe/pci: wrap probe with mem_access
3ef81c5bf drm/xe/display: use mem_access underneath
7b8d9716c drm/xe/mmio: enforce xe_device_assert_mem_access
08dfd8e55 drm/xe: drop xe_device_mem_access_get() from guc_ct_send
2c6140152 drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
7ee89f580 drm/xe: drop xe_device_mem_access_get() from invalidation_vma
22347f984 drm/xe: add lockdep annotation for xe_device_mem_access_get()


