Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A02C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 06:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60210E3F8;
	Mon, 14 Jul 2025 06:17:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D2D10E296;
 Mon, 14 Jul 2025 06:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_p?=
 =?utf-8?q?ower_well_mapping_for_WCL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 06:17:00 -0000
Message-ID: <175247382042.157881.18117571692183695123@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714055344.3825881-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250714055344.3825881-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/display: Add power well mapping for WCL
URL   : https://patchwork.freedesktop.org/series/151551/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit abdd624d18d2897219087c51077408f5ca63f253
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Jul 14 11:23:44 2025 +0530

    drm/i915/display: Add power well mapping for WCL
    
    WCL has 3 pipes, create power well mapping to reflect
    HW. Rest remains similar to Xe3 power well configuration.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 4990310f0d4505f8a92f01012eaf433c35da7822 drm-intel
abdd624d18d2 drm/i915/display: Add power well mapping for WCL
-:21: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#21: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1722:
+		.instances = &I915_PW_INSTANCES(

-:30: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#30: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1731:
+		.instances = &I915_PW_INSTANCES(

-:38: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#38: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1739:
+		.instances = &I915_PW_INSTANCES(

-:46: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#46: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1747:
+		.instances = &I915_PW_INSTANCES(

-:54: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#54: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1755:
+		.instances = &I915_PW_INSTANCES(

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1766:
+};
+static const struct i915_power_well_desc_list wcl_power_wells[] = {

total: 0 errors, 0 warnings, 6 checks, 70 lines checked


