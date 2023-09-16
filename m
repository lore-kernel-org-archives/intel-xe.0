Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01343CD37B1
	for <intel-xe@archiver.kernel.org>; Sat, 16 Sep 2023 03:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C8B10E0BB;
	Sat, 16 Sep 2023 03:11:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C0CB710E0B5;
 Sat, 16 Sep 2023 03:11:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8F7F3AADFD;
 Sat, 16 Sep 2023 03:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 16 Sep 2023 03:11:04 -0000
Message-ID: <169483386458.10847.2917879074698326856@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915233445.2241554-1-matthew.brost@intel.com>
In-Reply-To: <20230915233445.2241554-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?move_XE=5FEXEC=5FQUEUE=5FSET=5FPROPERTY=5FCOMPUTE=5FMODE_=28rev?=
 =?utf-8?q?2=29?=
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

Series: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE (rev2)
URL   : https://patchwork.freedesktop.org/series/123620/
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
commit 31f744495f7a53e4853deed604200056856a1ed9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Sep 15 16:34:45 2023 -0700

    drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
    
    Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecated in a
    previous patch, drop from uAPI. The property is just simply inherented
    from the VM.
    
    v2:
     - Update commit message (Niranjana)
    
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d drm-intel
fc2611278 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
61cb2d973 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
975a241de drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
31f744495 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI


