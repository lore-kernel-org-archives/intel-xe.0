Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438B2E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 11:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C710EFC5;
	Fri, 13 Dec 2024 11:04:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069910EFC5;
 Fri, 13 Dec 2024 11:04:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dsc=3A_Expose_ds?=
 =?utf-8?q?c_sink_max_slice_count_via_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 11:04:30 -0000
Message-ID: <173408787099.2104919.148370175192168523@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213093008.2149452-1-swati2.sharma@intel.com>
In-Reply-To: <20241213093008.2149452-1-swati2.sharma@intel.com>
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

Series: drm/i915/dsc: Expose dsc sink max slice count via debugfs
URL   : https://patchwork.freedesktop.org/series/142538/
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
commit 6a58351c8279f0b2d5c7d354bb674d79997ec3fa
Author: Swati Sharma <swati2.sharma@intel.com>
Date:   Fri Dec 13 15:00:08 2024 +0530

    drm/i915/dsc: Expose dsc sink max slice count via debugfs
    
    Number of DSC slices can be shown in the DSC debugfs so that
    test can take a call whether the configuration can support forcing
    bigjoiner/ultrajoiner.
    
    v2: used intel_dp_is_edp() as the parameter to
        drm_dp_dsc_sink_max_slice_count() (Jani N)
    
    Reviewed-by: Nemesa Garg <nemesa.garg@intel.com> (v1)
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3387
    Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
+ /mt/dim checkpatch 8f7b64e137723da601f3c07d0cda22566cf994d5 drm-intel
6a58351c8279 drm/i915/dsc: Expose dsc sink max slice count via debugfs
-:26: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_display_debugfs.c:1017:
+			   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), intel_dp_is_edp(intel_dp)));

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


