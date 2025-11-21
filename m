Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03B8CFA460
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 01:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682610E07E;
	Fri, 21 Nov 2025 01:09:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373B010E07E;
 Fri, 21 Nov 2025 01:09:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Silence_allocation_warnin?=
 =?utf-8?q?gs_for_sync_arrays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Nov 2025 01:09:22 -0000
Message-ID: <176368736219.15649.3711629094671334140@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
In-Reply-To: <20251120234254.427452-4-shuicheng.lin@intel.com>
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

Series: Silence allocation warnings for sync arrays
URL   : https://patchwork.freedesktop.org/series/157874/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 658ccf463751412f6502046dbffd2109cffb6874
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Nov 20 23:42:56 2025 +0000

    drm/xe/oa: Silence allocation warnings for sync arrays
    
    param->num_syncs comes from userspace and may be large or fuzzed.
    When kcalloc() attempts a large allocation, the allocator may emit
    noisy warning like below, even though the driver already returns
    -ENOMEM safely.
    
    Use __GFP_NOWARN to suppress it.
    "
    WARNING: CPU: 0 PID: 1217 at mm/page_alloc.c:5124 __alloc_frozen_pages_noprof+0x2f8/0x2180 mm/page_alloc.c:5124
    "
    
    Fixes: c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA sync properties")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 drm-intel
4577e2d6fd09 drm/xe: Silence allocation warnings for sync arrays
-:39: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#39: 
Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
658ccf463751 drm/xe/oa: Silence allocation warnings for sync arrays


