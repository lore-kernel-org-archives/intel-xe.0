Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81067C282EC
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 02:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBC410E06B;
	Wed, 12 Mar 2025 02:43:23 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8A10E06B;
 Wed, 12 Mar 2025 02:43:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_uninitializ?=
 =?utf-8?q?ed_variable_in_xe=5Fvm=5Fbind=5Fioctl=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 02:43:22 -0000
Message-ID: <174174740231.22452.2243458844774847303@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312023816.3641312-1-matthew.brost@intel.com>
In-Reply-To: <20250312023816.3641312-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl() (rev2)
URL   : https://patchwork.freedesktop.org/series/146076/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 48db77aa71cd07376abec0360ce7a9564cd37947
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Mar 11 19:38:16 2025 -0700

    drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
    
    The error handling assumes that vm_bind_ioctl_check_args() will
    initialize "bind_ops" but there are a couple early returns where that's
    not true.  Initialize "bind_ops" to NULL from the start.
    
    Also if vm_bind_ioctl_check_args, fails set bind_ops to NULL after
    freeing.
    
    Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch eb17816e52395a403aa0b447aa0befa9d2f86dd5 drm-intel
48db77aa71cd drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


