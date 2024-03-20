Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8136BC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 11:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E7810ED50;
	Wed, 20 Mar 2024 11:59:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03E110ED50;
 Wed, 20 Mar 2024 11:59:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/bb=3A_assert_width_in_xe=5Fbb=5Fcreate=5Fjob=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 11:59:01 -0000
Message-ID: <171093594165.921419.7660616536155166622@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320112730.219854-3-matthew.auld@intel.com>
In-Reply-To: <20240320112730.219854-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe/bb: assert width in xe_bb_create_job()
URL   : https://patchwork.freedesktop.org/series/131369/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1bec87597b99d356dfd5e85851d02a122501c392
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Mar 20 11:27:32 2024 +0000

    drm/xe/bb: assert width in xe_bb_create_migration_job()
    
    The q->width should always be exactly one here for migration queue/vm.
    The width will anyway be overridden later since we need to emit two
    jumps for special migration jobs. Enforce that here to ensure caller is
    not doing something strange. While here also convert to the helper to
    determine if the queue is migration based.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch b87a8b85562fc94e2314b61279ffa80b6c294cfa drm-intel
28331b140f2d drm/xe/bb: assert width in xe_bb_create_job()
1bec87597b99 drm/xe/bb: assert width in xe_bb_create_migration_job()


