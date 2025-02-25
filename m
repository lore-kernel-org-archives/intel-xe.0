Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8FFC021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 00:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF810E032;
	Tue, 25 Feb 2025 00:17:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51D110E032;
 Tue, 25 Feb 2025 00:17:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Userptr_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 00:17:40 -0000
Message-ID: <174044266073.1774488.12791711530899968801@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224170109.3078314-1-matthew.brost@intel.com>
In-Reply-To: <20250224170109.3078314-1-matthew.brost@intel.com>
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

Series: Userptr fixes
URL   : https://patchwork.freedesktop.org/series/145344/
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
commit 1f652c97ddd2bfeab6d86e8ea98734daf3c904fd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 24 09:01:09 2025 -0800

    drm/xe: Add staging tree for VM binds
    
    Concurrent VM bind staging and zapping of PTEs from a userptr notifier
    do not work because the view of PTEs is not stable. VM binds cannot
    acquire the notifier lock during staging, as memory allocations are
    required. To resolve this race condition, use a staging tree for VM
    binds that is committed only under the userptr notifier lock during the
    final step of the bind. This ensures a consistent view of the PTEs in
    the userptr notifier.
    
    A follow up may only use staging for VM in fault mode as this is the
    only mode in which the above race exists.
    
    v3:
     - Drop zap PTE change (Thomas)
     - s/xe_pt_entry/xe_pt_entry_staging (Thomas)
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: <stable@vger.kernel.org>
    Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
    Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 0bd853a9790bbe9c4ccf3bf2c521958d1df41d54 drm-intel
938f189c7c79 drm/xe: Userptr invalidation race with binds fixes
1f652c97ddd2 drm/xe: Add staging tree for VM binds


