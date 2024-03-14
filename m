Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3DC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AFB10FA23;
	Thu, 14 Mar 2024 10:15:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F3C10FA23;
 Thu, 14 Mar 2024 10:15:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Fix_out-of-bounds_warning_in_vm=5Fbind=5Fioctl=5F?=
 =?utf-8?q?check=5Fargs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 10:15:25 -0000
Message-ID: <171041132527.754222.10955091072613105778@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314095442.32153-1-nirmoy.das@intel.com>
In-Reply-To: <20240314095442.32153-1-nirmoy.das@intel.com>
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

Series: series starting with [1/3] drm/xe: Fix out-of-bounds warning in vm_bind_ioctl_check_args
URL   : https://patchwork.freedesktop.org/series/131129/
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
commit e349924fd13f6e0c80eec6e61dd46307b5b186df
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Mar 14 10:54:42 2024 +0100

    drm/xe: Warn on NULL job when user fence used in xe_sync_entry_signal
    
    Added a check and warn for NULL job when sync->type is
    DRM_XE_SYNC_TYPE_USER_FENCE to prevent potential crashes
    and aid in debugging
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 9bedef916cef04bba9e98430c1c1de637219a573 drm-intel
518376890229 drm/xe: Fix out-of-bounds warning in vm_bind_ioctl_check_args
2dad5bfea9cd drm/xe: Fix potential integer overflow in page size calculation
e349924fd13f drm/xe: Warn on NULL job when user fence used in xe_sync_entry_signal


