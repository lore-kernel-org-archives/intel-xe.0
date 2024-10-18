Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80223D2FFEC
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 10:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F61910E8E6;
	Fri, 18 Oct 2024 10:48:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429810E8E6;
 Fri, 18 Oct 2024 10:48:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mmap=3A_Add_mmap_s?=
 =?utf-8?q?upport_for_PCI_memory_barrier_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 10:48:29 -0000
Message-ID: <172924850927.1281754.7712703178422424857@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018104639.855216-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241018104639.855216-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev2)
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
commit 0c6143f106f9a392ca0030f00ae8c474062719fb
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Oct 18 16:16:39 2024 +0530

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
    
    Note: Test coverage for this is added by IGT
          https://patchwork.freedesktop.org/patch/618931/  here.
    
    V2(MAuld)
      - Add fault handler with dummy page to handle unplug device
      - Add Build check for special offset to be below normal start page
      - Test d3hot, mapping seems to be valid in d3hot as well
      - Add more info to commit message
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch c1837d4e9af4e9df3109960341105c035b441667 drm-intel
0c6143f106f9 drm/xe/mmap: Add mmap support for PCI memory barrier


