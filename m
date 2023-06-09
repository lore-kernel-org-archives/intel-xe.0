Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5838FC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 02:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6A710E0D1;
	Fri,  9 Jun 2023 02:46:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECBD710E0D1;
 Fri,  9 Jun 2023 02:46:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E9211AADF3;
 Fri,  9 Jun 2023 02:46:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Fri, 09 Jun 2023 02:46:57 -0000
Message-ID: <168627881795.15973.6041266749652056976@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230609024954.987039-1-badal.nilawar@intel.com>
In-Reply-To: <20230609024954.987039-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Donot_apply_forcewake_while_reading_actual_frequency_?=
 =?utf-8?b?KHJldjMp?=
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

Series: drm/xe: Donot apply forcewake while reading actual frequency (rev3)
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
commit b2afbd019fa82d418491e8a9519b7ed4d5a6db2d
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Jun 9 08:19:54 2023 +0530

    drm/xe: Donot apply forcewake while reading actual frequency
    
    RPSTAT1 is an sgunit register and thus doesn't need forcewake.
    MTL_MIRROR_TARGET_WP1 is within an "always on" power domain and thus
    doesn't require any forcewake to ensure the register is powered
    up and usable. When GT is RC6 the actual frequency reported will be 0.
    
    v2:
     - Add bspec index (Anshuman)
     - %s/GEN12_RPSTAT1/GT_PERF_STATUS as per bspec
    v3: Update Fixes tag
    
    Bspec: 51837, 67651
    Fixes: 9d9212dd4228 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
b2afbd019 drm/xe: Donot apply forcewake while reading actual frequency
-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9d9212dd4228', maybe rebased or not pulled?
#17: 
Fixes: 9d9212dd4228 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


