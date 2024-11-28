Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E96D70DF5
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C58510E252;
	Thu, 28 Nov 2024 21:46:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B610E252;
 Thu, 28 Nov 2024 21:46:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_devcoredump?=
 =?utf-8?q?_locking_and_reason_string?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 21:46:54 -0000
Message-ID: <173283041480.43182.13788171039286552329@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241128210824.3302147-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add devcoredump locking and reason string
URL   : https://patchwork.freedesktop.org/series/141899/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e5758c8a603a9369bf5f8cb9fea0114ddec07027
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Nov 28 13:08:24 2024 -0800

    drm/xe: Add mutex locking to devcoredump
    
    There are now multiple places that can trigger a coredump. Some of
    which can happen in parallel. There is already a check against
    capturing multiple dumps sequentially, but without locking it doesn't
    guarantee to work against concurrent dumps. And if two dumps do happen
    in parallel, they can end up doing Bad Things such as one call stack
    freeing the data the other call stack is still processing. Which leads
    to a crashed kernel.
    
    Further, it is possible for the DRM timeout to expire and trigger a
    free of the capture while a user is still reading that capture out
    through sysfs. Again leading to dodgy pointer problems.
    
    So, add a mutext lock around the capture, read and free functions to
    prevent inteference.
    
    v2: Swap tiny scope spin_lock for larger scope mutex and fix
    kernel-doc comment (review feedback from Matthew Brost)
    v3: Move mutex locks to exclude worker thread and add reclaim
    annotation (review feedback from Matthew Brost)
    v4: Fix typo.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 709349e154b56980b3957b3f72af3f67cfdd7aee drm-intel
21370626f783 drm/xe: Add a reason string to the devcoredump
b3a9fb2eda5e drm/xe: Move the coredump registration to the worker thread
e5758c8a603a drm/xe: Add mutex locking to devcoredump


