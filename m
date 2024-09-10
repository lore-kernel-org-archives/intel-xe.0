Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73464EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713810E7DD;
	Tue, 10 Sep 2024 13:30:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDA10E7DD;
 Tue, 10 Sep 2024 13:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe/client=3A_fix_deadlock_in_show=5Fmeminfo=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 13:30:14 -0000
Message-ID: <172597501432.980837.13061215051894665418@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910131145.136984-5-matthew.auld@intel.com>
In-Reply-To: <20240910131145.136984-5-matthew.auld@intel.com>
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

Series: series starting with [1/4] drm/xe/client: fix deadlock in show_meminfo()
URL   : https://patchwork.freedesktop.org/series/138468/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d5eda73f19b8d482552e989201ed7b64b99ebce
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Sep 10 14:11:49 2024 +0100

    drm/xe/bo: add some annotations in bo_put()
    
    If the put() triggers bo destroy then there is at least one potential
    sleeping lock. Also annotate bos_lock and ggtt lock.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
16086fcf714e drm/xe/client: fix deadlock in show_meminfo()
de82065bab5d drm/xe/client: add missing bo locking in show_meminfo()
3f91c42432b7 drm/xe/client: use mem_type from the current resource
4d5eda73f19b drm/xe/bo: add some annotations in bo_put()


