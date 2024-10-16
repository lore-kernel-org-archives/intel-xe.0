Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057D3D1AD3A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BDE10E6E7;
	Wed, 16 Oct 2024 09:53:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2320110E6E7;
 Wed, 16 Oct 2024 09:53:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Worka?=
 =?utf-8?q?round_for_odd_panning_for_planar_yuv_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 09:53:36 -0000
Message-ID: <172907241613.1273251.44731998949652474@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
In-Reply-To: <20240930112146.2673086-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Workaround for odd panning for planar yuv (rev6)
URL   : https://patchwork.freedesktop.org/series/136422/
State : success

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
commit 2afd2d2a25198c471dc8d880bcfbbc138934fb5a
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Oct 16 12:54:36 2024 +0530

    drm/i915/display: Workaround for odd panning for planar yuv
    
    Disable the support for odd x pan for even xsize for NV12
    format as underrun issue is seen.
    
    WA: 16024459452
    
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
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 drm-intel
2afd2d2a2519 drm/i915/display: Workaround for odd panning for planar yuv


