Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13178C5472C
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 03:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5E710E191;
	Sat, 24 Aug 2024 03:53:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2B010E18D;
 Sat, 24 Aug 2024 03:53:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_total_initi?=
 =?utf-8?q?alization_in_xe=5Fggtt=5Fprint=5Fholes=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 24 Aug 2024 03:53:33 -0000
Message-ID: <172447161382.748004.14635589095417914993@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-v1-1-12b02d079327@kernel.org>
In-Reply-To: <20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-v1-1-12b02d079327@kernel.org>
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

Series: drm/xe: Fix total initialization in xe_ggtt_print_holes()
URL   : https://patchwork.freedesktop.org/series/137740/
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
commit 324565aace0e11945133434ba20e08dc61fa509a
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Fri Aug 23 20:47:13 2024 -0700

    drm/xe: Fix total initialization in xe_ggtt_print_holes()
    
    Clang warns (or errors with CONFIG_DRM_WERROR or CONFIG_WERROR):
    
      drivers/gpu/drm/xe/xe_ggtt.c:810:3: error: variable 'total' is uninitialized when used here [-Werror,-Wuninitialized]
        810 |                 total += hole_size;
            |                 ^~~~~
      drivers/gpu/drm/xe/xe_ggtt.c:798:11: note: initialize the variable 'total' to silence this warning
        798 |         u64 total;
            |                  ^
            |                   = 0
      1 error generated.
    
    Move the zero initialization of total from
    xe_gt_sriov_pf_config_print_available_ggtt() to xe_ggtt_print_holes() to
    resolve the warning.
    
    Fixes: 136367290ea5 ("drm/xe: Introduce xe_ggtt_print_holes")
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
+ /mt/dim checkpatch 411a047925bb7e169a075a2ddfb63ba96f26a8c8 drm-intel
324565aace0e drm/xe: Fix total initialization in xe_ggtt_print_holes()


