Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44380C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF77810E730;
	Wed, 24 Jul 2024 15:41:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C716210E730;
 Wed, 24 Jul 2024 15:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Move_VM_dma-res?=
 =?utf-8?q?v_lock_from_xe=5Fexec=5Fqueue=5Fcreate_to_=5F=5Fxe=5Fexec=5Fqueue?=
 =?utf-8?q?=5Finit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 15:40:57 -0000
Message-ID: <172183565781.362853.13121771733087914196@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724152831.1848325-1-matthew.brost@intel.com>
In-Reply-To: <20240724152831.1848325-1-matthew.brost@intel.com>
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

Series: drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
URL   : https://patchwork.freedesktop.org/series/136439/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9569f1c0892eced31f2f2b32b4c91a84641b3d91
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 24 08:28:31 2024 -0700

    drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
    
    The critical section which requires the VM dma-resv is the call
    xe_lrc_create in __xe_exec_queue_init. Move this lock to
    __xe_exec_queue_init holding it just around xe_lrc_create. Not only is
    good practice, this also fixes a locking double of the VM dma-resv in
    the error paths of __xe_exec_queue_init as xe_lrc_put tries to acquire
    this too resulting in a deadlock.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthw Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d3f0e5757ac089a2e31619da4452dfb3359803a0 drm-intel
9569f1c0892e drm/xe: Move VM dma-resv lock from xe_exec_queue_create to __xe_exec_queue_init
-:74: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthw Brost <matthew.brost@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 51 lines checked


