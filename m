Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF1C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 11:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84A410E56C;
	Tue, 22 Apr 2025 11:31:51 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568A710E568;
 Tue, 22 Apr 2025 11:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PM_notifier_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 11:31:51 -0000
Message-ID: <174532151135.25354.17302998026406498897@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416150913.434369-5-matthew.auld@intel.com>
In-Reply-To: <20250416150913.434369-5-matthew.auld@intel.com>
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

Series: PM notifier (rev3)
URL   : https://patchwork.freedesktop.org/series/147536/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 77539996f04942400c953c10d782518f47ef74e4
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Apr 16 16:09:17 2025 +0100

    drm/xe: handle pinned memory in PM notifier
    
    Userspace is still alive and kicking at this point so actually moving
    pinned stuff here is tricky. However, we can instead pre-allocate the
    backup storage upfront from the notifier, such that we scoop up as much
    as we can, and then leave the final .suspend() to do the actual copy (or
    allocate anything that we missed). That way the bulk of our allocations
    will hopefully be done outside the more restrictive .suspend().
    
    We do need to be extra careful though, since the pinned handling can now
    race with PM notifier, like something becoming unpinned after we prepare
    it from the notifier.
    
    v2 (Thomas):
      - Fix kernel doc and drop the pin as soon as we are done with the
        restore, instead of deferring to later.
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch ada794bd93930fd265c2df8f38196994173e1fde drm-intel
c452824bdcdf drm/xe: evict user memory in PM notifier
40bea5c45676 drm/xe: share bo dma-resv with backup object
77539996f049 drm/xe: handle pinned memory in PM notifier


