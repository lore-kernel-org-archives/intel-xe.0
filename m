Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC61C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869810E219;
	Mon, 21 Sep 2026 05:49:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8510E1E0;
 Mon, 21 Sep 2026 05:49:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=3A_Disable_DC?=
 =?utf-8?q?5/6_before_AUX_programming_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 05:49:34 -0000
Message-ID: <178996977478.185576.6652159217780809879@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

Series: drm/i915/dp: Disable DC5/6 before AUX programming (rev4)
URL   : https://patchwork.freedesktop.org/series/174474/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b373f249a4901510b03fd3a3669d17ad78206e2d
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Sep 21 07:50:17 2026 +0530

    drm/i915/xe3plpd: Map AUX power domains to DC_off
    
    From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
    for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
    which powers down the PHY. Which means we need to make sure
    "Disable DC5/6" of AUX Programming sequence is honored.
    Add the AUX power domains to the DC_off power well on Xe3p_LPD+, so that
    DC5/6 stays disabled for as long as an AUX power domain is held.
    
    Bspec: 68851, 68967
    Suggested-by: Imre Deak <imre.deak@intel.com>
    Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
    Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf drm-intel
b373f249a490 drm/i915/xe3plpd: Map AUX power domains to DC_off
-:29: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#29: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1763:
+I915_DECL_PW_DOMAINS(xe3plpd_pwdoms_dc_off,
+	POWER_DOMAIN_DC_OFF,

-:49: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#49: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1783:
+		.instances = &I915_PW_INSTANCES(

total: 0 errors, 0 warnings, 2 checks, 54 lines checked


