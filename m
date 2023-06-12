Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D3C88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F7710E0C7;
	Mon, 12 Jun 2023 17:17:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8978910E0C7;
 Mon, 12 Jun 2023 17:17:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8604DAADED;
 Mon, 12 Jun 2023 17:17:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 12 Jun 2023 17:17:08 -0000
Message-ID: <168659022854.26643.11254660354830964731@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230612171225.88689-1-matthew.auld@intel.com>
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=5Fdevice=5Fmem=5Faccess_fixes_and_related_bits?=
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

Series: xe_device_mem_access fixes and related bits
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
commit 7e9e80f23cc17aeea83239561efcf4a905678565
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Jun 12 18:12:25 2023 +0100

    drm/xe: add lockdep annotation for xe_device_mem_access_get()
    
    The atomics here might hide potential issues, so add a dummy lock with
    the idea that xe_pm_runtime_resume() is eventually going to be called
    when we are holding it. This only need to happen once and then lockdep
    can validate all callers and their locks.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch f041ab3bfcd9d0643b5cadb8916f67e8e234356c drm-intel
cfd55827f drm/xe: fix xe_device_mem_access_get() races
-:55: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#55: 
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258

-:74: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "xe_pm_read_callback_task"
#74: FILE: drivers/gpu/drm/xe/xe_device.c:416:
+	if (xe_pm_read_callback_task(xe) != NULL)

-:225: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#225: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1109:
+	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)

total: 0 errors, 1 warnings, 2 checks, 287 lines checked
40cd95300 drm/xe/vm: tidy up xe_runtime_pm usage
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Link: with a URL to the report
#13: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
6b0636e45 drm/xe/debugfs: grab mem_access around forcewake
-:11: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Closes:', use 'Link:' instead
#11: 
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/279

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
bdc743007 drm/xe/mmio: grab mem_access in xe_mmio_ioctl
ca90c955e drm/xe: ensure correct access_put ordering
1d39a990c drm/xe/pci: wrap probe with mem_access
2b309e1ba drm/xe/display: use mem_access underneath
aca604862 drm/xe/mmio: enforce xe_device_assert_mem_access
c887f2b2e drm/xe: drop xe_device_mem_access_get() from guc_ct_send
969df2764 drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
d72aab679 drm/xe: drop xe_device_mem_access_get() from invalidation_vma
7e9e80f23 drm/xe: add lockdep annotation for xe_device_mem_access_get()


