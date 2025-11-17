Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23500CEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 12:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F6B10E3BF;
	Mon, 17 Nov 2025 12:15:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1510E3D1;
 Mon, 17 Nov 2025 12:15:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CMTG_enablement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 12:15:22 -0000
Message-ID: <176338172224.356.9158603084681775752@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117114216.1522615-1-animesh.manna@intel.com>
In-Reply-To: <20251117114216.1522615-1-animesh.manna@intel.com>
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

Series: CMTG enablement
URL   : https://patchwork.freedesktop.org/series/157663/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d4e4ac3bc97a0be5e88eb7a0300c4d40906a5e2a
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Nov 17 17:12:16 2025 +0530

    drm/i915/cmtg: enable cmtg ctl
    
    Enable CMTG through control register.
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch b2e41c70a5eeddce427dc6df02508b6856eb4a11 drm-intel
f651c06793f9 drm/i915/cmtg: enable cmtg LNL onwards
-:33: ERROR:SPACING: space required before the open parenthesis '('
#33: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3424:
+	if(DISPLAY_VER(display) >= 15 && intel_dp_is_edp(intel_dp)) {

-:35: ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3426:
+		drm_dbg_kms(display->drm,"ANI-DBG: intel_dp_compute_config\n");
 		                        ^

-:35: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'intel_dp_compute_config', this function's name, in a string
#35: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3426:
+		drm_dbg_kms(display->drm,"ANI-DBG: intel_dp_compute_config\n");

total: 2 errors, 1 warnings, 0 checks, 20 lines checked
bb64cd8ac65e drm/i915/cmtg: cmtg set clock select
d669f168cd16 drm/i915/cmtg: set timings for cmtg
-:49: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#49: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:241:
+
+}

total: 0 errors, 0 warnings, 1 checks, 79 lines checked
7353a6524f32 drm/i915/cmtg: program vrr registers of cmtg
ac089b3b7603 drm/i915/cmtg: program set context latency of cmtg
31c15d66c27b drm/i915/cmtg: set transcoder mn for cmtg
5e806bbb973a drm/i915/cmtg: program sync to port for cmtg
d4e4ac3bc97a drm/i915/cmtg: enable cmtg ctl


