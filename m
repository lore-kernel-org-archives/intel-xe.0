Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C71C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 21:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CE310E9CE;
	Mon, 15 Apr 2024 21:19:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43F10E9CE;
 Mon, 15 Apr 2024 21:19:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_device_atomics_wit?=
 =?utf-8?q?h_a_VM_bind_flag_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 21:19:35 -0000
Message-ID: <171321597589.1424088.15427482116295770303@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415145214.25641-1-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
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

Series: Enable device atomics with a VM bind flag (rev3)
URL   : https://patchwork.freedesktop.org/series/132290/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 935c780ad95901ee8cd41e65ebb76c1cb699784f
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Apr 15 16:52:14 2024 +0200

    drm/xe/uapi: Add a query flag for has_device_atomics_on_smem
    
    Add a query flag for xe->info.has_device_atomics_on_smem
    as this is platform dependent. This flag can be use to inform
    whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
    applied for a given platform.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 7bc330055f5c2924b42e389887691fea3f401a45 drm-intel
75dce276e434 drm/xe: Introduce has_atomic_enable_pte_bit device info
fa49284d194b drm/xe: Consolidate setting PTE_AE into one place
2d4b69c1bba6 drm/xe: Add function to check if BO has single placement
404eee1a4366 drm/xe: Move vm bind bo validation to a helper function
336e76e1e0a9 drm/xe: Introduce has_device_atomics_on_smem device info
c6a4ba7464ac drm/xe/uapi: Introduce VMA bind flag for device atomics
935c780ad959 drm/xe/uapi: Add a query flag for has_device_atomics_on_smem


