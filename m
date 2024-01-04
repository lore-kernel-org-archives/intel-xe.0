Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB60C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 19:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AB810E509;
	Thu,  4 Jan 2024 19:34:53 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FA810E509;
 Thu,  4 Jan 2024 19:34:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/dgfx=3A_Release_mm?=
 =?utf-8?q?ap_mappings_on_rpm_suspend_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Thu, 04 Jan 2024 19:34:52 -0000
Message-ID: <170439689222.22260.937936415939866310@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240104130702.950078-1-badal.nilawar@intel.com>
In-Reply-To: <20240104130702.950078-1-badal.nilawar@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/dgfx: Release mmap mappings on rpm suspend (rev5)
URL   : https://patchwork.freedesktop.org/series/122860/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a56e30dd2cfe637645a2102b02d020b2fb90ff00
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Jan 4 18:37:02 2024 +0530

    drm/xe/dgfx: Release mmap mappings on rpm suspend
    
    Release all mmap mappings for all vram objects which are associated
    with userfault such that, while pcie function in D3hot, any access
    to memory mappings will raise a userfault.
    
    Upon userfault, in order to access memory mappings, if graphics
    function is in D3 then runtime resume of dgpu will be triggered to
    transition to D0.
    
    v2:
      - Avoid iomem check before bo migration check as bo can migrate
        to system memory (Matthew Auld)
    v3:
      - Delete bo userfault link during bo destroy
      - Upon bo move (vram-smem), do bo userfault link deletion in
        xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
      - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)
    v4:
      - Add kernel doc and wrap vram_userfault related
        stuff in the structure (Matthew Auld)
      - Get rpm wakeref before taking dma reserve lock (Matthew Auld)
      - In suspend path apply lock for entire list op
        including list iteration (Matthew Auld)
    v5:
      - Use mutex lock instead of spin lock
    v6:
      - Fix review comments (Matthew Auld)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> #For the xe_bo_move_notify() changes
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
a56e30dd2 drm/xe/dgfx: Release mmap mappings on rpm suspend


