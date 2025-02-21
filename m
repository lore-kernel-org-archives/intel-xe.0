Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D0DC021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 15:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAE310EAA3;
	Fri, 21 Feb 2025 15:39:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C137E10EAA3;
 Fri, 21 Feb 2025 15:39:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/3=5D_drm/xe/userptr=3A_restore_invalidation_list_on_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 15:39:33 -0000
Message-ID: <174015237378.491017.15075564029157713401@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221143840.167150-4-matthew.auld@intel.com>
In-Reply-To: <20250221143840.167150-4-matthew.auld@intel.com>
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

Series: series starting with [v3,1/3] drm/xe/userptr: restore invalidation list on error
URL   : https://patchwork.freedesktop.org/series/145237/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8572be52999dd182ac781b44d112334cbfc59ba6
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Feb 21 14:38:43 2025 +0000

    drm/xe/userptr: remove tmp_evict list
    
    Doesn't look to be used.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a22ac320a08377d760e73fa530c27782f0b68b6d drm-intel
bf88ad0f1439 drm/xe/userptr: restore invalidation list on error
837b574524ec drm/xe/userptr: fix EFAULT handling
8572be52999d drm/xe/userptr: remove tmp_evict list


