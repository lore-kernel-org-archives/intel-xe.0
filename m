Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED152C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 17:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E13610E6AE;
	Wed, 28 May 2025 17:20:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9D10E65E;
 Wed, 28 May 2025 17:20:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Rework_eviction?=
 =?utf-8?q?_rejection_of_bound_external_bos_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 17:20:53 -0000
Message-ID: <174845285371.28899.7165565139660774092@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528164105.234718-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250528164105.234718-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Rework eviction rejection of bound external bos (rev3)
URL   : https://patchwork.freedesktop.org/series/149505/
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
commit 4070f379e37af2c9cdb79f28f410047117f819d2
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed May 28 18:41:05 2025 +0200

    drm/xe: Rework eviction rejection of bound external bos
    
    For preempt_fence mode VM's we're rejecting eviction of
    shared bos during VM_BIND. However, since we do this in the
    move() callback, we're getting an eviction failure warning from
    TTM. The TTM callback intended for these things is
    eviction_valuable().
    
    However, the latter doesn't pass in the struct ttm_operation_ctx
    needed to determine whether the caller needs this.
    
    Instead, attach the needed information to the vm under the
    vm->resv, until we've been able to update TTM to provide the
    needed information. And add sufficient lockdep checks to prevent
    misuse and races.
    
    v2:
    - Fix a copy-paste error in xe_vm_clear_validating()
    v3:
    - Fix kerneldoc errors.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to current VM")
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bce15b90200d1d7d4b5ff1a6cac0b43d8bf45319 drm-intel
4070f379e37a drm/xe: Rework eviction rejection of bound external bos


