Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA9EC531DF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 01:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EAB10EBF2;
	Fri, 23 Aug 2024 01:14:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89DD10EBF2;
 Fri, 23 Aug 2024 01:14:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_dma-fence_a?=
 =?utf-8?q?rray_for_media_GT_TLB_invalidations_in_PT_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 01:14:11 -0000
Message-ID: <172437565175.727910.5251551124296490425@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823010825.2005759-1-matthew.brost@intel.com>
In-Reply-To: <20240823010825.2005759-1-matthew.brost@intel.com>
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

Series: drm/xe: Use dma-fence array for media GT TLB invalidations in PT code
URL   : https://patchwork.freedesktop.org/series/137676/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c08889aafd579335246d9115e52a57f7c9c534a1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 22 18:08:25 2024 -0700

    drm/xe: Use dma-fence array for media GT TLB invalidations in PT code
    
    Using a chain fence is problematic as these cannot be installed in
    timeout drm sync objects. Use a dma-fence-array instead at the cost of
    an extra failure point.
    
    Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7365d672ab38ee0eabb65fcd359e5774a8efbd70 drm-intel
c08889aafd57 drm/xe: Use dma-fence array for media GT TLB invalidations in PT code


