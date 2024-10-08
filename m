Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00458CEF14D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 10:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BC510E0E2;
	Tue,  8 Oct 2024 10:53:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543B10E0E2;
 Tue,  8 Oct 2024 10:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_fix_unbalanced_rpm_put=28=29_with_fence=5Ffini=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 10:53:46 -0000
Message-ID: <172838482641.1203063.16392503391184979292@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008104723.98300-3-matthew.auld@intel.com>
In-Reply-To: <20241008104723.98300-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe: fix unbalanced rpm put() with fence_fini()
URL   : https://patchwork.freedesktop.org/series/139688/
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
commit f4db71746d60dd1aaeefc56bdd05dec9df4e0716
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Oct 8 11:47:25 2024 +0100

    drm/xe: fix unbalanced rpm put() with declare_wedged()
    
    Technically the or_reset() means we call the action on failure, however
    that would lead to unbalanced rpm put(). Move the get() earlier to fix
    this. It should be extremely unlikely to ever trigger this in practice.
    
    Fixes: 452bca0edbd0 ("drm/xe: Don't suspend device upon wedge")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 131a5dd267541faa13894b97d44af39b257fc887 drm-intel
b17ca1bd2b42 drm/xe: fix unbalanced rpm put() with fence_fini()
f4db71746d60 drm/xe: fix unbalanced rpm put() with declare_wedged()


