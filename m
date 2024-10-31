Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3892D767F6
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EAB10E045;
	Thu, 31 Oct 2024 18:15:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06310E03D;
 Thu, 31 Oct 2024 18:15:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_non-contiguous_VRAM_B?=
 =?utf-8?q?O_access_in_Xe_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 18:15:57 -0000
Message-ID: <173039855705.1385523.1911244584385057764@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031181048.2948948-1-matthew.brost@intel.com>
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/140200/
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
commit 0bdafbaf9eb11ca51dbfcb68ee22571648f0e9e7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Oct 31 11:10:48 2024 -0700

    drm/xe: Only allow contiguous BOs to use xe_bo_vmap
    
    xe_bo_vmap only works on contiguous BOs, disallow xe_bo_vmap on BO
    unless we are certain the BO is contiguous.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch b8c3c871a2df70e3201eb70505981d39e449384d drm-intel
e7cede92443e drm/xe: Add xe_bo_vm_access
6ca1bf9074b5 drm/ttm: Add ttm_bo_access
-:20: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#20: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
5afb869b3ee6 drm/xe: Add xe_ttm_access_memory
-:17: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#17: 
Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
12c585fdf94f drm/xe: Take PM ref in delayed snapshot capture worker
38437d2caa56 drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
1c79076d86fd drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
4eafa8106bc1 drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
0bdafbaf9eb1 drm/xe: Only allow contiguous BOs to use xe_bo_vmap


