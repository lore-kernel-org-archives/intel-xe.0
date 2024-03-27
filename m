Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0275FC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 09:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FC010F984;
	Wed, 27 Mar 2024 09:19:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6A210F984;
 Wed, 27 Mar 2024 09:19:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Rework_rebindin?=
 =?utf-8?q?g_in_preparation_for_same-vm_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 09:19:33 -0000
Message-ID: <171153117377.1055670.1683133048652037646@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Rework rebinding in preparation for same-vm eviction
URL   : https://patchwork.freedesktop.org/series/131682/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 99dbd9d678c16fbb0ceaf927079f58d1486383f4
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 27 10:11:36 2024 +0100

    drm/xe: Move vma rebinding to the drm_exec locking loop
    
    Rebinding might allocate page-table bos, causing evictions.
    To support blocking locking during these evictions,
    perform the rebinding in the drm_exec locking loop.
    
    Also Reserve fence slots where actually needed rather than trying to
    predict how many fence slots will be needed over a complete
    wound-wait transaction.
    
    v2:
    - Remove a leftover call to xe_vm_rebind() (Matt Brost)
    - Add a helper function xe_vm_validate_rebind() (Matt Brost)
    v3:
    - Add comments and squash with previous patch (Matt Brost)
    
    Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
    Fixes: 29f424eb8702 ("drm/xe/exec: move fence reservation")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f9c56f1a03b5c35488671e4ffe61e28b12ffe163 drm-intel
d8b6f24d2387 drm/xe: Use ring ops TLB invalidation for rebinds
8da4403d295c drm/xe: Rework rebinding
d5a2bd9a4e08 drm/xe: Make TLB invalidation fences unordered
99dbd9d678c1 drm/xe: Move vma rebinding to the drm_exec locking loop


