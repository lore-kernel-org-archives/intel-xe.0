Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7CDC83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 06:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2110E279;
	Wed,  2 Jul 2025 06:06:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9208B10E279;
 Wed,  2 Jul 2025 06:06:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Read_?=
 =?utf-8?q?DP=5FADAPTER=5FCAP_to_pass_LinkLayer_DPCD=26EDID_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 06:06:23 -0000
Message-ID: <175143638359.126613.4122948493242113692@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250701192631.3750408-1-khaled.almahallawy@intel.com>
In-Reply-To: <20250701192631.3750408-1-khaled.almahallawy@intel.com>
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

Series: drm/i915/display: Read DP_ADAPTER_CAP to pass LinkLayer DPCD&EDID tests (rev2)
URL   : https://patchwork.freedesktop.org/series/151035/
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
commit ed7acceedfa9d16d845ff9aeb25d6f3be0e7809d
Author: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date:   Tue Jul 1 12:26:31 2025 -0700

    drm/i915/display: Read DP_ADAPTER_CAP to pass LinkLayer DPCD&EDID tests
    
    4.2.2.1 LinkLayer test states:
    "Verify that Source DUT does the following within 5 seconds after HPD
    being asserted:
    Reads the DPCD Receiver Capability field (DPCD: 00000h:0000Fh)"
    ...
    
    Fail1:
    Source DUT failed to read the DPCD Receiver Capability field (DPCD:
    00000h:0000Fh) through AUX_CH before link training."
    
    Fix this by reading DP_ADAPTER_CAP(0x000F & 0x220F)
    
    Cc: Uma Shankar <uma.shankar@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
+ /mt/dim checkpatch 149b15e02e6496a37621cd5bf8a28f7d8c1869cd drm-intel
ed7acceedfa9 drm/i915/display: Read DP_ADAPTER_CAP to pass LinkLayer DPCD&EDID tests
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:283:
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_ADAPTER_CAP,
+				   &adapter_cap);

-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:285:
+	drm_dp_dpcd_readb(&intel_dp->aux, 0x220f,
+				   &adapter_cap);

total: 0 errors, 0 warnings, 2 checks, 19 lines checked


