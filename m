Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657F1CCFA15
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 09:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C66A10E183;
	Thu, 26 Sep 2024 09:14:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB3C10E18D;
 Thu, 26 Sep 2024 09:14:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/vm=3A_move_xa=5Falloc_to_prevent_UAF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 09:14:33 -0000
Message-ID: <172734207395.1105563.14694957013008834173@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925071426.144015-3-matthew.auld@intel.com>
In-Reply-To: <20240925071426.144015-3-matthew.auld@intel.com>
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

Series: series starting with [v2,1/2] drm/xe/vm: move xa_alloc to prevent UAF
URL   : https://patchwork.freedesktop.org/series/139079/
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
commit 891a608472b5c82e63d0c37bfb334b4439093340
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Sep 25 08:14:28 2024 +0100

    drm/xe/queue: move xa_alloc to prevent UAF
    
    Evil user can guess the next id of the queue before the ioctl completes
    and then call queue destroy ioctl to trigger UAF since create ioctl is
    still referencing the same queue. Move the xa_alloc all the way to the end
    to prevent this.
    
    v2:
     - Rebase
    
    Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da drm-intel
e6d25a32aebf drm/xe/vm: move xa_alloc to prevent UAF
891a608472b5 drm/xe/queue: move xa_alloc to prevent UAF


