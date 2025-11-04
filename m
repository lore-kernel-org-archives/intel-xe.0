Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CCCCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 16:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E16210E292;
	Tue,  4 Nov 2025 16:46:12 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B62B10E292;
 Tue,  4 Nov 2025 16:46:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/ltphy=3A_Implement_HDMI_Algo_for_Pll_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Nov 2025 16:46:11 -0000
Message-ID: <176227477163.17530.2860221150897488989@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104093425.154941-1-suraj.kandpal@intel.com>
In-Reply-To: <20251104093425.154941-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/2] drm/i915/ltphy: Implement HDMI Algo for Pll state
URL   : https://patchwork.freedesktop.org/series/156983/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 14f438d0125d2321226ff3cc5716f50b448cb7e5
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Nov 4 15:04:25 2025 +0530

    drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm
    
    Return the lowest port clock for HDMI when the reverse algorithm
    calculates it to be 0 to avoid errors later but throw a warn.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch d05a764cda694ab87c96960a6a06da34db443255 drm-intel
dc80e1bfaba0 drm/i915/ltphy: Implement HDMI Algo for Pll state
-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i' - possible side-effects?
#102: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1435:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#102: FILE: drivers/gpu/drm/i915/display/intel_lt_phy.c:1435:
+#define DATA_ASSIGN(i, val)	\
+	do {			\
+		lt_state->data[i][0] = (u8)(((val) & 0xFF000000) >> 24); \
+		lt_state->data[i][1] = (u8)(((val) & 0x00FF0000) >> 16); \
+		lt_state->data[i][2] = (u8)(((val) & 0x0000FF00) >> 8); \
+		lt_state->data[i][3] = (u8)(((val) & 0x000000FF));	\
+	} while (0)

total: 0 errors, 0 warnings, 2 checks, 351 lines checked
14f438d0125d drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorithm


