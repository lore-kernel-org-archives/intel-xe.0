Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7165BC7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 11:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0910EA09;
	Thu, 19 Jun 2025 11:49:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B110E221;
 Thu, 19 Jun 2025 11:49:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Init_changes_fo?=
 =?utf-8?q?r_flicker-free_boot=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Jun 2025 11:49:19 -0000
Message-ID: <175033375971.95381.16249967978977603944@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250619104858.418440-13-dev@lankhorst.se>
In-Reply-To: <20250619104858.418440-13-dev@lankhorst.se>
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

Series: drm/xe: Init changes for flicker-free boot. (rev3)
URL   : https://patchwork.freedesktop.org/series/150410/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25e52bc429e36580312f8d1266fc916559009760
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Thu Jun 19 12:49:10 2025 +0200

    drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
    
    It feels to me like load is closer to the intention than init_hw.
    
    It makes the init calls slightly less confusing to me. :)
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch bcf5444c917a3a3fa382d3bc013124a9f6ad1f32 drm-intel
1fc36fa14dd5 drm/xe: Defer memirq init until needed
82984f7796de drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
3fa96f1be4df drm/xe: Simplify GuC early initialization
-:219: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#219: FILE: drivers/gpu/drm/xe/xe_uc.c:44:
+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 190 lines checked
ae8649f59aa0 drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
instance 0, which fortunately means no dependencies on further initialization

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
91125f4a641a drm/xe: Only dump PAT when xe_hw_engines_init_early fails
b204efbd3abf drm/xe: Rename gt_init sub-functions
78bd01069141 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
deae44121f63 drm/xe: Move xe_ttm_sys_mgr_init() downwards.
f6af76116613 drm/xe: Remove xe_uc_init_hwconfig()
772d80f674d9 drm/xe: Remove xe_uc_fini_hw
25e52bc429e3 drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw


