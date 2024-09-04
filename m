Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2AACD4F21
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 18:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4510E832;
	Wed,  4 Sep 2024 18:28:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2F610E831;
 Wed,  4 Sep 2024 18:28:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_extobj_dma-resv_slot_?=
 =?utf-8?q?usage_in_XE=27s_exec_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 18:28:43 -0000
Message-ID: <172547452305.934549.17667097762368244538@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904170500.3303081-1-matthew.brost@intel.com>
In-Reply-To: <20240904170500.3303081-1-matthew.brost@intel.com>
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

Series: Fix extobj dma-resv slot usage in XE's exec IOCTL
URL   : https://patchwork.freedesktop.org/series/138221/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe00cee82493529f7324b26da78e34983d3057b8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Sep 4 10:05:00 2024 -0700

    drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
    
    Fix external BO's dma-resv usage in exec IOCTL with an opt into bookkeep
    slot. This leaves syncing to user space rather than the KMD blindly
    enforcing write semantics on every external BO.
    
    Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
    Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
    Cc: Boris Brezillon <boris.brezillon@collabora.com>
    Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2673
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch c72d3ffc0308b71024de6f80c3596668991c67ea drm-intel
42aaa39d05d4 drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
fe00cee82493 drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP


