Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490DF606A692
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437C10E83E;
	Sat, 21 Nov 2026 02:09:04 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64E10E83E;
 Sat, 21 Nov 2026 02:09:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Cleanup_OA_stream_on_PCI_?=
 =?utf-8?q?unbind/remove_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Nov 2026 02:09:03 -0000
Message-ID: <179522694362.62890.12843914812727389233@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

Series: Cleanup OA stream on PCI unbind/remove (rev9)
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
commit 3f5167268a93a281177f7127c4f5cf92d149f26d
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Fri Nov 20 18:01:53 2026 -0800

    drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset
    
    An OA stream fd can outlive the device: after a PCI slot reset or after
    unbind. The poll hrtimer and userspace calls on the fd could then access
    MMIO and other device-bound objects that were released on remove,
    causing a NULL pointer dereference, and xe_oa_release() would tear down
    against freed objects.
    
    Destroy a stream the same way whether its fd is closed or the device
    goes away: xe_oa_destroy_locked() marks the stream dead, disables it,
    restores the HW state and releases everything but the OA buffer and the
    stream struct, whether or not the HW still responds. xe_oa_fini() calls
    xe_oa_quiesce() to destroy the streams of a removed device, and
    xe_oa_release() skips the destroy of such a dead stream. Only the
    stream struct, with stream_lock and poll_wq valid, and the pinned OA
    buffer stay allocated until the fd is closed or the process owning the
    fd exits. The quiesce drops the DMA mapping of the OA buffer, which
    stays pinned past xe_bo_pinned_fini(). On a wedged device, pending OA
    batches aren't waited for, nothing in the ring runs anymore.
    
    The quiesce needs no runtime PM reference of its own: xe_oa_fini() runs
    after xe_pm_fini(), which keeps the device resumed with runtime suspend
    forbidden. xe_oa_release() doesn't take one for a stream destroyed by
    the quiesce either, so that it doesn't wake a removed device.
    
    Once dead, OA interfaces return -ENODEV, poll reports EPOLLERR |
    EPOLLHUP, and xe_oa_release() frees the stream struct and the OA
    buffer, and drops the drm device reference.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 drm-intel
7f757f9fd218 drm/xe/oa: Ignore a HW tail pointer outside the OA buffer
2c62ba0341cf drm/xe/oa: Use the drm device address_space for the OA stream fd
9e1a939db3f3 drm/xe: Reject vm_ops->access on BO mappings of an unplugged device
95b025d8a675 drm/xe/oa: Wait for in-flight OA batches before stream HW teardown
-:27: WARNING:BAD_SIGN_OFF: Use a single space after Reviewed-by:
#27: 
Reviewed-by:  Shekhar Chauhan <shekhar.chauhan@intel.com>

total: 0 errors, 1 warnings, 0 checks, 83 lines checked
60b23827be54 drm/xe/oa: Fence OA ioctls and mmap against device unplug and wedging
ef2848db1626 drm/xe/oa: Free the OA buffer and the stream after the stream destroy
3f5167268a93 drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset


