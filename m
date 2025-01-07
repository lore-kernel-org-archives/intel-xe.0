Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E9EE77188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 00:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447AD89B01;
	Tue,  7 Jan 2025 00:18:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E419389B01;
 Tue,  7 Jan 2025 00:18:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_unused_?=
 =?utf-8?q?=22mmio=5Fext=22_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 00:18:46 -0000
Message-ID: <173620912693.523290.3320333255912670445@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
In-Reply-To: <20250106234312.2986065-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Remove unused "mmio_ext" code
URL   : https://patchwork.freedesktop.org/series/143166/
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
commit 236546b923855163c09edb84165adce79da012da
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Jan 6 15:43:13 2025 -0800

    drm/xe: Remove unused "mmio_ext" code
    
    The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
    platform.  Going forward, this also isn't the design we want to use for
    any future platforms/features either, so we should just go ahead and
    remove the dead code to avoid confusion.
    
    mmio_ext was originally added in an attempt to hack around the early
    (mis)design of the Xe driver, which used xe_gt as the target for all
    register MMIO access, even those completely unrelated to the GT subunit
    of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
    Create dedicated xe_mmio structure") and its follow-up patches, that
    misdesign has been corrected and access to register MMIO regions
    specific to hardware units is now done through xe_mmio structures which
    encapsulate an iomap, region size, and some other metadata.
    
    Although all of the registers used by the driver today happen to fall
    within one specific PCI BAR region, and thus re-use a single device-wide
    iomap, there's no requirement that this stay true for future platforms
    or features.  I.e., if a future platform adds a new 'foo' hardware unit
    that exists at a different area in the BAR, or even in a completely
    different BAR, then that would be handled by doing a separate iomap of
    that unit's register region and wrapping it in its own 'struct xe_mmio
    foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
    within the xe_device, xe_tile, xe_gt, etc., according to where the new
    hardware unit falls within the current hardware hierarchy.
    
    This effectively reverts the following commits, although parts of these
    commits had already vanished or changed with the earlier xe_mmio
    refactor work:
    
     - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
       xe_reg")
     - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
       from MTCFG reg")
     - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
     - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
       tiles in device desc")
     - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
       MMIO extension")
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Koby Elbaz <kelbaz@habana.ai>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch a322fb77281fc52ebad7363980fc633a76bc6421 drm-intel
236546b92385 drm/xe: Remove unused "mmio_ext" code


