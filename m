Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1180DC021AA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 00:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D507110E098;
	Thu, 20 Feb 2025 00:01:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFB910E098;
 Thu, 20 Feb 2025 00:01:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pxp=3A_Don=27t_kil?=
 =?utf-8?q?l_queues_while_holding_PXP_locks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 00:01:00 -0000
Message-ID: <174000966065.15808.9299850354721426307@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219235236.2597612-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250219235236.2597612-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/pxp: Don't kill queues while holding PXP locks
URL   : https://patchwork.freedesktop.org/series/145134/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e871d50a629dd2e1536e0cfb331ea79a46627dde
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Feb 19 15:52:36 2025 -0800

    drm/xe/pxp: Don't kill queues while holding PXP locks
    
    xe_exec_queue_kill can sleep, so we can't call it from under a spinlock.
    We can instead move the queues to a separate list and then kill them all
    after we release the spinlock.
    
    Furthermore, xe_exec_queue_kill can take the VM lock so we can't call it
    while holding the PXP mutex because the mutex is taken under VM lock at
    queue creation time. Note that while it is safe to call the kill without
    holding the mutex, we must call it after the PXP state has been updated,
    otherwise an app might be able to create a queue between the
    invalidation and the state update, which would break the state machine.
    
    Since being in the list is used to track whether RPM cleanup is needed,
    we can no longer defer that to queue_destroy, so we perform it
    immediately instead.
    
    v2: also avoid calling kill() under pxp->mutex.
    
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e19eb43c82480789a93ce0c452e22bbd851b93c6 drm-intel
e871d50a629d drm/xe/pxp: Don't kill queues while holding PXP locks
-:23: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#23: 
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")

total: 0 errors, 1 warnings, 0 checks, 149 lines checked


