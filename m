Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8738CF6499
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 11:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A3410E401;
	Mon, 30 Sep 2024 11:29:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8310E3F0;
 Mon, 30 Sep 2024 11:29:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Worka?=
 =?utf-8?q?round_for_odd_panning_for_planar_yuv_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 11:29:10 -0000
Message-ID: <172769575095.1134408.14661272617660576254@2413ebb6fbb6>
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

Series: drm/i915/display: Workaround for odd panning for planar yuv (rev5)
URL   : https://patchwork.freedesktop.org/series/136422/
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
commit b23b7fa02f835df722b85323b324a6edba91fcba
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Mon Sep 30 16:51:46 2024 +0530

    drm/i915/display: Workaround for odd panning for planar yuv
    
    Disable the support for odd x pan for even xsize for NV12 format as underrun
    issue is seen.
    
    WA: 16024459452
    
    v2: Replace HSD with WA in commit message [Suraj]
        Modified the condition for handling odd panning
    
    v3: Simplified the condition for checking hsub
        Using older framework for wa as rev1[Jani]
    
    v4: Modify the condition for hsub [Sai Teja]
        Initialize hsub in else path [Dan]
    
    v5: Replace IS_LUNARLAKE with display version.
        Resolve nitpicks[Jani]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 8ffb4ffcd9c475e88792494601785dc5d617c5f1 drm-intel
b23b7fa02f83 drm/i915/display: Workaround for odd panning for planar yuv
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Disable the support for odd x pan for even xsize for NV12 format as underrun

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


