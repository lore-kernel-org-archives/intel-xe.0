Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43429D4335D
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 14:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75A210E84C;
	Thu,  7 Nov 2024 14:01:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98DC10E84C;
 Thu,  7 Nov 2024 14:01:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_functions_to_sa?=
 =?utf-8?q?ve_and_restore_VF_LMEM_and_CCS_data_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 14:01:09 -0000
Message-ID: <173098806982.1422405.3337533616560813303@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107135517.9516-1-lukasz.laguna@intel.com>
In-Reply-To: <20241107135517.9516-1-lukasz.laguna@intel.com>
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

Series: PF: Add functions to save and restore VF LMEM and CCS data (rev3)
URL   : https://patchwork.freedesktop.org/series/140050/
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
commit 9b5a3ad431e91deb717287a71586b58d2f111045
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Thu Nov 7 14:55:17 2024 +0100

    drm/xe/pf: Allow to view and replace VF LMEM and CCS state over debugfs
    
    For feature enabling and testing purposes, allow to save VF LMEM and CCS
    state and to replace it using debugfs blob file, but only under strict
    debug config.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 6f358787ded211657532e2ee4df2e446b03d860f drm-intel
4cf0519181d0 drm/xe/migrate: Add function for raw copy of VRAM and CCS
18feb7f04444 drm/xe/pf: Add helper to retrieve VF's LMEM object
-:28: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#28: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1529:
+{
+

-:39: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#39: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1540:
+
+}

total: 0 errors, 0 warnings, 2 checks, 35 lines checked
ecb555604e31 drm/xe/pf: Add functions to save and restore VF LMEM and CCS data
9b5a3ad431e9 drm/xe/pf: Allow to view and replace VF LMEM and CCS state over debugfs
-:154: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#154: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:413:
+	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(chunk_size), ttm_bo_type_kernel,
+				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |

-:179: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#179: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:438:
+			xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
+				ret, chunk_size);

-:209: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#209: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:468:
+	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(count), ttm_bo_type_kernel,
+				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |

total: 0 errors, 0 warnings, 3 checks, 323 lines checked


