Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51385C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 03:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F87210E4B8;
	Mon,  9 Jun 2025 03:56:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578E10E407;
 Mon,  9 Jun 2025 03:56:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_Add_a_helper?=
 =?utf-8?q?_xe=5Fvm=5Frange=5Ftilemask=5Ftlb=5Finvalidation=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 03:56:23 -0000
Message-ID: <174944138360.58753.16549415376233308485@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation() (rev2)
URL   : https://patchwork.freedesktop.org/series/149615/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28e3ad799b5b4cbc890678bd6e24c2b0f852073d
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Jun 9 09:46:16 2025 +0530

    drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()
    
    Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
    invalidation for a specified address range across GTs indicated by a
    tilemask.
    
    v2 (Matthew Brost)
    - Move WARN_ON_ONCE to svm caller
    - Remove xe_gt_tlb_invalidation_vma
    - s/XE_WARN_ON/WARN_ON_ONCE
    
    v3
    - Rebase
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 571650b3db8b18c85c89797056e3bc0f16df4aac drm-intel
28e3ad799b5b drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()


