Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02920E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 14:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CF310E26E;
	Wed, 18 Dec 2024 14:20:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635C010E012;
 Wed, 18 Dec 2024 14:20:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mmap=3A_Add_mmap_s?=
 =?utf-8?q?upport_for_PCI_memory_barrier_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 14:20:02 -0000
Message-ID: <173453160240.69589.12049606371441552491@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218125628.2270030-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241218125628.2270030-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev8)
URL   : https://patchwork.freedesktop.org/series/139769/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2aaf58aa0043fce6f3a1037edefa060915550a7b
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Dec 18 18:26:28 2024 +0530

    drm/xe/mmap: Add mmap support for PCI memory barrier
    
    In order to avoid having userspace to use MI_MEM_FENCE,
    we are adding a mechanism for userspace to generate a
    PCI memory barrier with low overhead (avoiding IOCTL call
    as well as writing to VRAM will adds some overhead).
    
    This is implemented by memory-mapping a page as uncached
    that is backed by MMIO on the dGPU and thus allowing userspace
    to do memory write to the page without invoking an IOCTL.
    We are selecting the MMIO so that it is not accessible from
    the PCI bus so that the MMIO writes themselves are ignored,
    but the PCI memory barrier will still take action as the MMIO
    filtering will happen after the memory barrier effect.
    
    When we detect special defined offset in mmap(), We are mapping
    4K page which contains the last of page of doorbell MMIO range
    to userspace for same purpose.
    
    For user to query special offset we are adding special flag in
    mmap_offset ioctl which needs to be passed as follows,
    struct drm_xe_gem_mmap_offset mmo = {
            .handle = 0, /* this must be 0 */
            .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
    };
    igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
    map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
    
    Note: Test coverage for this is added by IGT
          https://patchwork.freedesktop.org/series/140368/  here.
          UMD implementing test, once PR is ready will attach with
          this patch.
    
    V6(MAuld)
      - Move physical mmap to fault handler
      - Modify kernel-doc and attach UMD PR when ready
    V5(MAuld)
      - Return invalid early in case of non 4K PAGE_SIZE
      - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
    V4(MAuld)
      - Add kernel-doc for uapi change
      - Restrict page size to 4K
    V3(MAuld)
      - Remove offset defination from UAPI to be able to change later
      - Edit commit message for special flag addition
    V2(MAuld)
      - Add fault handler with dummy page to handle unplug device
      - Add Build check for special offset to be below normal start page
      - Test d3hot, mapping seems to be valid in d3hot as well
      - Add more info to commit message
    
    Test-with: 20241118113606.1490397-1-tejas.upadhyay@intel.com
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 78526dfb8799485890dae3877fea308e9501879c drm-intel
2aaf58aa0043 drm/xe/mmap: Add mmap support for PCI memory barrier


