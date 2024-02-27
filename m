Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA1BC5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 02:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22810E45F;
	Tue, 27 Feb 2024 02:48:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B210E5E4;
 Tue, 27 Feb 2024 02:48:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe=5Fsync_and_ufence_rewo?=
 =?utf-8?q?rk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 02:48:51 -0000
Message-ID: <170900213128.318338.16562147602010455658@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227024337.141585-1-matthew.brost@intel.com>
In-Reply-To: <20240227024337.141585-1-matthew.brost@intel.com>
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

Series: xe_sync and ufence rework
URL   : https://patchwork.freedesktop.org/series/130418/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0c154c094f54266ae5de84733202d44dc09fb988
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 93274f2c1b1e0e3cf2704a6f1922762ea34bd7ef
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 26 18:43:37 2024 -0800

    drm/xe: Get page on user fence creation
    
    Attempt to get page on user fence creation and kmap_local_page on
    signaling. Should reduce latency and can ensure 64 bit atomicity
    compared to copy_to_user.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b3552bf1e79de200a6ca49c518ead46a1256618c drm-intel
5b1c0bd4d939 drm/xe: Remove used xe_sync_entry_wait
9b1a3cf5f337 drm/xe: Validate user fence during creation
-:8: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 93274f2c1b1e ("drm/xe: Get page on user fence creation")'
#8: 
Fixes: dd08ebf6c352 drm/xe: ("Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
93274f2c1b1e drm/xe: Get page on user fence creation


