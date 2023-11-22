Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E44C61D92
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 04:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351A610E253;
	Wed, 22 Nov 2023 04:26:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9955410E253;
 Wed, 22 Nov 2023 04:26:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 95166A0003;
 Wed, 22 Nov 2023 04:26:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 22 Nov 2023 04:26:03 -0000
Message-ID: <170062716360.4726.1837903166127341794@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Move_wa_processing_to_gt=5Finit?=
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

Series: drm/xe: Move wa processing to gt_init
URL   : https://patchwork.freedesktop.org/series/126709/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9446b6b555fee6bb30f86e2fbc7d9d0e25a26ebf
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Nov 21 16:55:55 2023 +0530

    drm/xe: Move wa processing to gt_init
    
    Currently WA processing for gt is happening in early init API.
    It also includes processing of WAs which needs filter based on
    hardware engine by looping over number of hardware engines in gt.
    
    However at early init stage hardware engines are not associated
    with gt in software which skips processing such WAs.
    
    Example WAs which will be fixed to apply after this change,
    "14011060649",
    "16010515920",
    "16021867713"
    
    Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
9446b6b55 drm/xe: Move wa processing to gt_init
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:18: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/xe: Introduce a new DRM driver for Intel GPUs")'
#18: 
Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

-:18: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '811a9b3d262d8', maybe rebased or not pulled?
#18: 
Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 2 warnings, 0 checks, 14 lines checked


