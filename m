Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28637D1CA23
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 04:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42BF10E149;
	Tue,  5 Nov 2024 04:40:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FAE10E149;
 Tue,  5 Nov 2024 04:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_A_couple_exec_IOCTL_fixes?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 04:40:55 -0000
Message-ID: <173078165581.1410018.3704711414107783394@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105043524.4062774-1-matthew.brost@intel.com>
In-Reply-To: <20241105043524.4062774-1-matthew.brost@intel.com>
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

Series: A couple exec IOCTL fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/140910/
State : warning

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
commit 8e0c73ff76f608f24ca9b6838cefa171dd82092c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Nov 4 20:35:24 2024 -0800

    drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec IOCTL
    
    Upon failure all locks need to be dropped before returning to the user.
    
    Fixes: 58480c1c912f ("drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC")
    Cc: stable <stable@kernel.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fffb00b58c0ce4d5a729f3bbd7f05d38ff3dbe63 drm-intel
5b9ab04b53f3 drm/xe: Fix possible exec queue leak in exec IOCTL
-:11: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'stable <stable@kernel.org>', prefer 'stable@kernel.org'
#11: 
Cc: stable <stable@kernel.org>

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
8e0c73ff76f6 drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec IOCTL
-:10: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'stable <stable@kernel.org>', prefer 'stable@kernel.org'
#10: 
Cc: stable <stable@kernel.org>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


