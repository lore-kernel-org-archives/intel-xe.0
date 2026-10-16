Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2F9CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D71E112629;
	Fri, 16 Oct 2026 07:26:09 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1E112629;
 Fri, 16 Oct 2026 07:26:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Isolate_permane?=
 =?utf-8?q?ntly_wedged_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 07:26:08 -0000
Message-ID: <179213556841.33768.4011332726976202068@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016071832.222574-1-arvind.yadav@intel.com>
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
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

Series: drm/xe: Isolate permanently wedged devices
URL   : https://patchwork.freedesktop.org/series/176267/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8bd802f76eb2bc2f4150b31fd9f71c8ec5d5b1a5
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Fri Oct 16 12:48:28 2026 +0530

    drm/xe: Block BO VM access when device I/O is unavailable
    
    DO NOT REVIEW
    
    xe_bo_vm_access() may acquire a runtime PM reference and access a BO
    during PCI error recovery, after a permanent wedge or during device
    unplug.
    
    Use xe_device_io_get() to protect against unplug, PCI error recovery and
    permanent wedging. Keep the device I/O gate held until the runtime
    PM reference has been released.
    
    Return -EIO for a permanent wedge, -ECANCELED during PCI error recovery
    and -ENODEV after device unplug.
    
    v2:
     - Replace the runtime-PM scoped guard with explicit get/put calls
       to avoid mixing scope-based and goto-based cleanup. (Sashiko)
     - Replace the private VRAM SRCU lock with the common device I/O gate.
     - Preserve -EIO for BO access after a permanent wedge.
    
    v3:
     - Combine unplug and blocked-device protection through the common DRM
       device SRCU helper.
     - Return -ENODEV after unplug and -ECANCELED during PCI recovery, while
       preserving -EIO for a permanent wedge.
    
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 25ac2be14e483405af697f32d04950fe737db1a9 drm-intel
ec1852ea8999 drm/xe/irq: Always free requested IRQs on uninstall
f4b4fbecd679 drm/drv: Export drm_dev_srcu_synchronize()
2f5b3b0c9445 drm/xe: Separate AER reset state from device wedging
0faad7c8b42e drm/xe: Protect device I/O with DRM device SRCU
-:252: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#252: FILE: drivers/gpu/drm/xe/xe_guc_tlb_inval.c:92:
+			CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
+						    XE_FW_GT);

total: 0 errors, 0 warnings, 1 checks, 219 lines checked
6d41bc4090f4 drm/xe: Keep software waits outside the device I/O gate
02082f91e61f drm/xe: Drop queued page faults when device I/O is blocked
c34892eecc4a drm/xe: Stop VM work when device I/O is blocked
498054a320c8 drm/xe/ggtt: Skip GGTT updates on a wedged device
6c3f6a02c651 drm/xe: Skip VM close hardware access when device I/O is blocked
0789643f63b9 drm/xe: Send wedged notification from a worker
9d61ef534bc4 drm/xe: Reuse one dummy page per BO after wedge
89731e987648 drm/xe: Invalidate existing VRAM mappings on wedge
8391ab6ff322 drm/xe/irq: Protect IRQ state during wedge isolation
2aaa5e628310 drm/xe: Isolate a wedged device before notifying userspace
477ea635e5c7 drm/xe/ttm: Reject VRAM allocations on wedged devices
402bcb02d93d drm/xe/guc: Skip timeout recovery on a wedged device
d4e7b9b6db83 drm/xe: Skip PM notifier preparation when device I/O is blocked
8bd802f76eb2 drm/xe: Block BO VM access when device I/O is unavailable


