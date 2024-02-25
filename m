Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC48C48BF6
	for <intel-xe@archiver.kernel.org>; Sun, 25 Feb 2024 00:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A810E126;
	Sun, 25 Feb 2024 00:20:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0610E128;
 Sun, 25 Feb 2024 00:20:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_build_error?=
 =?utf-8?q?_in_xe=5Fggtt=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 25 Feb 2024 00:20:03 -0000
Message-ID: <170882040359.281993.14750445589397746326@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240225001448.81513-1-matthew.brost@intel.com>
In-Reply-To: <20240225001448.81513-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix build error in xe_ggtt.c
URL   : https://patchwork.freedesktop.org/series/130347/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cd62896504543deb288c1d649eed56308dbcfb80
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 475ec4811f83f260b0b342c62f0614ea6c2ce603
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sat Feb 24 16:14:48 2024 -0800

    drm/xe: Fix build error in xe_ggtt.c
    
    Need to include io-64-nonatomic-lo-hi.h for writeq function.
    
    Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7291e2e67dff0ff573900266382c9c9248a7dea5 drm-intel
475ec4811f83 drm/xe: Fix build error in xe_ggtt.c
-:8: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 475ec4811f83 ("drm/xe: Fix build error in xe_ggtt.c")'
#8: 
Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


