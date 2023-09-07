Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F600EC872C
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0931F10E0C5;
	Thu,  7 Sep 2023 14:08:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF2A110E0C5;
 Thu,  7 Sep 2023 14:08:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E362CA73C7;
 Thu,  7 Sep 2023 14:08:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Sep 2023 14:08:33 -0000
Message-ID: <169409571392.17900.15469767770323682179@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906153916.5665-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Convert_to_drm=5Fexec_=28rev5=29?=
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

Series: drm/xe: Convert to drm_exec (rev5)
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
commit cc745493377a8c3badb74cbfd7688a77ea15da9d
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
+ /mt/dim checkpatch bae46e59a7f667734376ddb0d2451967dfb264f1 drm-intel
166082f4b drm/xe/bo: Simplify xe_bo_lock()
565a9ebe6 drm/xe/vm: Simplify and document xe_vm_lock()
4d85e650d drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
68500498d drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec helper
d8af02115 drm/xe: Convert pagefaulting code to use drm_exec
cc7454933 drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_exec


