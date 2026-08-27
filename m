Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC59EC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732310EF92;
	Thu, 27 Aug 2026 10:24:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84A10E3E0;
 Thu, 27 Aug 2026 10:24:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Isolate_wedged_?=
 =?utf-8?q?devices_from_hardware_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 10:24:26 -0000
Message-ID: <178782626638.90736.17661005862747233901@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827101801.1247654-1-arvind.yadav@intel.com>
In-Reply-To: <20260827101801.1247654-1-arvind.yadav@intel.com>
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

Series: drm/xe: Isolate wedged devices from hardware access
URL   : https://patchwork.freedesktop.org/series/172860/
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
commit 5a0183e63c0b14db04163704afb9f0e570bf1f85
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Thu Aug 27 15:48:01 2026 +0530

    drm/xe: Block BO VM access when device I/O is unavailable
    
    xe_bo_vm_access() may acquire a runtime PM reference and access a BO
    during PCI error recovery, after a permanent wedge or during device
    unplug.
    
    Return -EIO when device I/O is blocked. Use drm_dev_enter() to protect
    against concurrent unplug and keep that protection until the runtime PM
    reference has been released.
    
    Use the same SRCU domain as CPU faults so wedge isolation waits for a BO
    access that started before the wedge.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Assisted-by: Claude:claude-opus-4-8
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 098021382451783ea6448fa7f0e2a4cbc395c3d2 drm-intel
3b34b8b642f5 drm/xe/irq: Always free requested IRQs on uninstall
3d0f4dbc0bdf drm/xe: Separate AER reset state from device wedging
-:258: CHECK:LINE_SPACING: Please don't use multiple blank lines
#258: FILE: drivers/gpu/drm/xe/xe_pci_error.c:22:
 
+

total: 0 errors, 0 warnings, 1 checks, 222 lines checked
cfe1aa2c75bf drm/xe: Drop queued page faults when device I/O is blocked
4fdcb68eeca7 drm/xe: Stop VM work when device I/O is blocked
00c84ece2622 drm/xe: Send wedged notification from a worker
56a5540151d3 drm/xe: Reuse one dummy page per BO after wedge
4fd081486713 drm/xe: Invalidate existing VRAM mappings on wedge
d965c4b40905 drm/xe/irq: Serialize IRQ suspend and resume
99b8f4e39b1e drm/xe: Isolate a wedged device before notifying userspace
94d76c78f0b6 drm/xe/ttm: Reject VRAM allocations on wedged devices
df1cbd60098f drm/xe/guc: Skip timeout recovery on a wedged device
5ca0fd411f87 drm/xe: Skip PM notifier preparation for wedged devices
5a0183e63c0b drm/xe: Block BO VM access when device I/O is unavailable


