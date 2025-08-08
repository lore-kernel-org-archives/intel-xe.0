Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAD9C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 09:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD73D10E8EC;
	Fri,  8 Aug 2025 09:13:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9857710E8EC;
 Fri,  8 Aug 2025 09:13:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_Add_power_well_mapping_for_WCL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Aug 2025 09:13:39 -0000
Message-ID: <175464441961.221846.7668364226938156279@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808081931.4101388-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250808081931.4101388-1-chaitanya.kumar.borah@intel.com>
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

Series: series starting with [1/2] drm/i915/display: Add power well mapping for WCL
URL   : https://patchwork.freedesktop.org/series/152675/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 01469bcfe37a14e9588ccf8cfcd8385fdf6d01ef
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Aug 8 13:49:31 2025 +0530

    drm/i915/wcl: Add display device info
    
    Add device info for wildcat lake. WCL has 3 pipes and 2 TC ports.
    
    Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 0a8f74a5dde6c5327dac9522cf1441003f2ebcba drm-intel
a5e98dc91458 drm/i915/display: Add power well mapping for WCL
-:23: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#23: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1722:
+		.instances = &I915_PW_INSTANCES(

-:32: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#32: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1731:
+		.instances = &I915_PW_INSTANCES(

-:40: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#40: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1739:
+		.instances = &I915_PW_INSTANCES(

-:48: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#48: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1747:
+		.instances = &I915_PW_INSTANCES(

-:56: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#56: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1755:
+		.instances = &I915_PW_INSTANCES(

-:65: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#65: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1764:
+};
+static const struct i915_power_well_desc_list wcl_power_wells[] = {

total: 0 errors, 0 warnings, 6 checks, 68 lines checked
01469bcfe37a drm/i915/wcl: Add display device info


