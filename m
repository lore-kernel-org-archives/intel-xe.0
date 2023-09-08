Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B87BEC875F
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 00:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6810E0CF;
	Fri,  8 Sep 2023 00:32:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7652E10E0CF;
 Fri,  8 Sep 2023 00:32:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 79D17A3ECB;
 Fri,  8 Sep 2023 00:32:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 08 Sep 2023 00:32:41 -0000
Message-ID: <169413316149.14897.1961034958316720344@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Convert_to_drm=5Fexec_=28rev6=29?=
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

Series: drm/xe: Convert to drm_exec (rev6)
URL   : https://patchwork.freedesktop.org/series/123100/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3d3d64a76c2157f53bf51cd4f73e735e01cd5a91
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Sep 6 17:39:16 2023 +0200

    drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec
    
    The VM_BIND functionality and vma destruction was locking
    potentially multiple dma_resv objects using the
    ttm_eu_reserve_buffers() function. Rework those to use the drm_exec
    helper, taking care that any calls to xe_bo_validate() ends up
    inside an unsealed locking transaction.
    
    v4:
    - Remove an unbalanced xe_bo_put() (igt and Matthew Brost)
    v5:
    - Rebase conflict
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 758f01ec2a6774fda1e8f8075d31f42b81783caf drm-intel
0190aec99 drm/xe/bo: Simplify xe_bo_lock()
fd8e99d04 drm/xe/vm: Simplify and document xe_vm_lock()
0bfcfe6b4 drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
c72712538 drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
2d663d0b5 drm/xe: Convert pagefaulting code to use drm_exec
3d3d64a76 drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec


