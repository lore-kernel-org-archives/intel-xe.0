Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8F5C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 14:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9610E196;
	Thu,  8 Jun 2023 14:05:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD46710E196;
 Thu,  8 Jun 2023 14:05:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AABAFAADD7;
 Thu,  8 Jun 2023 14:05:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Thu, 08 Jun 2023 14:05:46 -0000
Message-ID: <168623314669.18385.11409622367648100578@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608133048.963599-1-badal.nilawar@intel.com>
In-Reply-To: <20230608133048.963599-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Donot_apply_forcewake_while_reading_actual_frequency_?=
 =?utf-8?b?KHJldjIp?=
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

Series: drm/xe: Donot apply forcewake while reading actual frequency (rev2)
URL   : https://patchwork.freedesktop.org/series/118990/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc7ea2cd05591e29d8da4c0e68240649ad0e4ce4
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Jun 8 19:00:48 2023 +0530

    drm/xe: Donot apply forcewake while reading actual frequency
    
    RPSTAT1 is an sgunit register and thus doesn't need forcewake.
    MTL_MIRROR_TARGET_WP1 is within an "always on" power domain and thus
    doesn't require any forcewake to ensure the register is powered
    up and usable. When GT is RC6 the actual frequency reported will be 0.
    
    v2:
     - Add bspec index (Anshuman)
     - %s/GEN12_RPSTAT1/GT_PERF_STATUS as per bspec
    
    Bspec: 51837, 67651
    Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
fc7ea2cd0 drm/xe: Donot apply forcewake while reading actual frequency
-:16: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7dbca224f176', maybe rebased or not pulled?
#16: 
Fixes: 7dbca224f176 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


