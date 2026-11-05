Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B76E606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 01:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2836710E8B8;
	Thu,  5 Nov 2026 01:21:00 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0711F10E8B8;
 Thu,  5 Nov 2026 01:20:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleanup_OA_stream_on_PCI_?=
 =?utf-8?q?unbind/remove_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 01:20:59 -0000
Message-ID: <179384165902.121787.8842347403547242913@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Cleanup OA stream on PCI unbind/remove (rev4)
URL   : https://patchwork.freedesktop.org/series/177300/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e8b652fd29b8f723c5dd26e83d94053e5f468a92
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Wed Nov 4 16:16:07 2026 -0800

    drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
    
    An OA stream fd can outlive the device: after a PCI slot reset or after
    unbind. The poll hrtimer and userspace calls on the fd could then access
    MMIO and other device-bound objects that were released on remove,
    causing a NULL pointer dereference, and xe_oa_release() would tear down
    against freed objects.
    
    Call xe_oa_quiesce() from xe_oa_fini() to cleanup the stream resources.
    Only the stream struct stays allocated, with stream_lock and poll_wq
    valid, until the fd is closed or the process owning the fd exits.
    
    Once dead, OA interfaces return -ENODEV, poll reports EPOLLERR |
    EPOLLHUP, and xe_oa_release() frees the stream struct and drops the drm
    device reference.
    
    Note:
    
    - xe_oa_fini() is a devm action and runs after drm_dev_unplug() in
      xe_device_remove(). drm_dev_unplug() has zapped the OA buffer mmaps by
      then and refaults get a dummy page, so the OA buffer can be freed. Each
      vma holds a reference on the BO, which keeps the BO object alive until
      munmap. xe_oa_mmap() runs in a drm_dev_enter() section, which
      drm_dev_unplug() waits for, so no new mmap can reference the OA buffer
      once it is freed. stream_lock can't be used for that, since mmap runs
      under mmap_lock and read holds stream_lock across user copies.
    
    - With an mmap still around, the OA buffer is no longer pinned when
      xe_bo_pinned_fini() DMA-unmaps the remaining kernel BOs, and
      xe_bo_pci_dev_remove_all() ran while it was still pinned. Drop its DMA
      mapping in quiesce while it is still pinned, so it doesn't outlive the
      device.
    
    - Unbind does not reset the GT or the device, so cleanup HW state as
      well in this case, unless the device is wedged. Don't restore the
      context state of a stream on an exec queue, the exec queue goes away
      with the device. Kill the exec queue before waiting for pending OA
      batches, so that the ones that haven't run yet are canceled.
    
    - drm_ioctl() only checks for unplug on entry, so an OA ioctl that
      started before drm_dev_unplug() could still open a stream, or access
      oa->xe and the metrics idr, around xe_oa_fini(). Run the OA ioctls in
      a drm_dev_enter() section, so drm_dev_unplug() waits for them.
    
    - A stream can be released after drm_dev_unplug(), but before
      xe_oa_fini() quiesces it. Release the stream in a drm_dev_enter()
      section, so that drm_dev_unplug() waits for a release in progress, and
      quiesce the stream on release once the device is unplugged.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 3379b0f74f31bfc3746b692822a7700aeeebe15d drm-intel
3741019fa558 drm/xe/oa: Use the drm device address_space for the OA stream fd
a4ccb6128ca5 drm/xe/oa: Split OA stream destroy into HW teardown and resource release
b602723d2f88 drm/xe/oa: Take the runtime PM reference in xe_oa_destroy_locked()
6c9acbfa8f9e drm/xe/oa: Skip OA HW teardown on a wedged device
-:58: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 36 lines checked
74a4f4e5b9f2 drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
-:84: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 61 lines checked
fcb7baaaaaf6 drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
e8b652fd29b8 drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset


