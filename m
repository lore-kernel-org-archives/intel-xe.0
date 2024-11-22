Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9973AE65D22
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 04:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679AC10EABE;
	Fri, 22 Nov 2024 04:13:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1818610EAC0;
 Fri, 22 Nov 2024 04:13:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_devcoredump?=
 =?utf-8?q?_locking_and_reason_string_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 04:13:46 -0000
Message-ID: <173224882611.1542974.17231946268674037587@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241122025357.1398385-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add devcoredump locking and reason string (rev3)
URL   : https://patchwork.freedesktop.org/series/141628/
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
commit bf02b61757b8756796fbb28c9a184677be89b7e7
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Nov 21 18:53:57 2024 -0800

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
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch bb17c42521f57b592e9ad49daca1f9f9045d3199 drm-intel
b67615bc7436 drm/xe: Add a reason string to the devcoredump
bf02b61757b8 drm/xe: Add mutex locking to devcoredump


