Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A928DCDD0D1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 18:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8E610E168;
	Tue, 22 Oct 2024 18:42:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D58410E168;
 Tue, 22 Oct 2024 18:42:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_W?=
 =?utf-8?q?a=5F16023981245?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 18:42:16 -0000
Message-ID: <172962253624.1310805.13527929703525311592@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022163117.758401-1-nemesa.garg@intel.com>
In-Reply-To: <20241022163117.758401-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Add Wa_16023981245
URL   : https://patchwork.freedesktop.org/series/140326/
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
commit 708ac863990326e75bc5ca8ca6d21139374d7da2
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Oct 22 22:01:17 2024 +0530

    drm/i915/display: Add Wa_16023981245
    
    Disable the support for odd panning in x direction.
    
    v2: Replace HSD with WA in commit message [Suraj]
        Modified the condition for handling odd panning
    
    v3: Simplified the condition for checking hsub
        Using older framework for wa as rev1[Jani]
    
    v4: Modify the condition for hsub [Sai Teja]
        Initialize hsub in else path [Dan]
    
    v5: Replace IS_LUNARLAKE with display version.
        Resolve nitpicks[Jani]
    
    v6: Replace -EINVAL with hsub [Suraj]
        Remove src_w check as not required
    
    v7: Remove check for NV12.
        Add check for PTL as well [Matt]
    
    Continuing discussions from:
    https://patchwork.freedesktop.org/series/136416/
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
708ac8639903 drm/i915/display: Add Wa_16023981245
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1030:
+		if ((DISPLAY_VER_FULL(i915) == IP_VER(20, 0) ||
+		    DISPLAY_VER_FULL(i915) == IP_VER(30, 0)) &&

total: 0 errors, 0 warnings, 1 checks, 12 lines checked


