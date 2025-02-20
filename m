Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF2C021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 23:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA810E9F9;
	Thu, 20 Feb 2025 23:50:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C5110E9F9;
 Thu, 20 Feb 2025 23:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Userptr_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 23:50:41 -0000
Message-ID: <174009544103.278735.8776816272412589888@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220234557.2613010-1-matthew.brost@intel.com>
In-Reply-To: <20250220234557.2613010-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145198/
State : warning

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
commit d0f811a2f2d95f988b2d2ad8eb6937deec539fa9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 20 15:45:57 2025 -0800

    drm/xe: Userptr invalidation race with binds fixes
    
    Squash bind operation after userptr invalidation into a clearing of
    PTEs. Will prevent valid GPU page tables from pointing to stale CPU
    pages.
    
    Fixup initial bind handling always add VMAs to invalidation list and
    clear PTEs.
    
    Remove unused rebind variable in xe_pt.
    
    Always hold notifier across TLB invalidation in notifier to prevent a
    UAF if an unbind races.
    
    Including all of the above changes for Fixes patch in hopes of an easier
    backport which fix a single patch.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: <stable@vger.kernel.org>
    Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into single job")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2c2b141845ce906e187d4aa4fee06bcd9d517415 drm-intel
ef6ce4c0f4fa drm/xe/userptr: fix EFAULT handling
d0f811a2f2d9 drm/xe: Userptr invalidation race with binds fixes
-:26: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")'
#26: 
Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into single job")

total: 0 errors, 1 warnings, 0 checks, 190 lines checked


