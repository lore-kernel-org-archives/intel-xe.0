Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE460CF9C5F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 17:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC30B10E862;
	Fri, 20 Sep 2024 17:58:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C692C10E862;
 Fri, 20 Sep 2024 17:58:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_fix_UAF_around_?=
 =?utf-8?q?queue_destruction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 17:58:25 -0000
Message-ID: <172685510580.1051853.12423383374249473053@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920172559.208358-2-matthew.auld@intel.com>
In-Reply-To: <20240920172559.208358-2-matthew.auld@intel.com>
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

Series: drm/xe: fix UAF around queue destruction
URL   : https://patchwork.freedesktop.org/series/138931/
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
commit e829d87aff84b61259137ef67fafef25dd2d41e2
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Sep 20 18:26:00 2024 +0100

    drm/xe: fix UAF around queue destruction
    
    We currently do stuff like queuing the final destruction step on a
    random system wq, which will outlive the driver instance. With bad
    timing we can teardown the driver with one or more work workqueue still
    being alive leading to various UAF splats. Add a fini step to ensure
    user queues are properly torn down. At this point GuC should already be
    nuked so queue itself should no longer be referenced from hw pov.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2317
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
e829d87aff84 drm/xe: fix UAF around queue destruction


