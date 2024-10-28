Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88AD3E2A1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 18:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B4610E377;
	Mon, 28 Oct 2024 18:34:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BA010E242;
 Mon, 28 Oct 2024 18:34:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Fix_ina?=
 =?utf-8?q?ppropriate_error_printing_in_xe=5Fmigrate=5Fsanity=5Ftest=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang Hai" <wanghai38@huawei.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 18:34:12 -0000
Message-ID: <173014045239.1355839.13765419694638229144@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025091310.15380-1-wanghai38@huawei.com>
In-Reply-To: <20241025091310.15380-1-wanghai38@huawei.com>
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

Series: drm/xe/migrate: Fix inappropriate error printing in xe_migrate_sanity_test()
URL   : https://patchwork.freedesktop.org/series/140593/
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
commit 232c55cfc8f696cf8e48c91c25cfd74168eaf45f
Author: Wang Hai <wanghai38@huawei.com>
Date:   Fri Oct 25 17:13:10 2024 +0800

    drm/xe/migrate: Fix inappropriate error printing in xe_migrate_sanity_test()
    
    When creating pin map for tiny fails, the PTR_ERR(pt) is printed instead
    of PTR_ERR(tiny), which makes it impossible to accurately get the true
    cause of the error.
    
    Print PTR_ERR(tiny) after creating pin map for tiny fails.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Wang Hai <wanghai38@huawei.com>
+ /mt/dim checkpatch f21e568eed1e2d11e338b440ac2dd1c33fb9e7b1 drm-intel
232c55cfc8f6 drm/xe/migrate: Fix inappropriate error printing in xe_migrate_sanity_test()


