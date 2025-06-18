Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E46C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 15:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9210E8D2;
	Wed, 18 Jun 2025 15:56:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517289A1F;
 Wed, 18 Jun 2025 15:56:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_fix_regis?=
 =?utf-8?q?ter_file_style?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 15:56:53 -0000
Message-ID: <175026221373.92095.5024247007762805769@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250618155137.1651865-1-jani.nikula@intel.com>
In-Reply-To: <20250618155137.1651865-1-jani.nikula@intel.com>
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

Series: drm/i915/vrr: fix register file style
URL   : https://patchwork.freedesktop.org/series/150474/
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
commit b7fa222ad54fd0701b5555d7c43bdf171a755c68
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jun 18 18:51:37 2025 +0300

    drm/i915/vrr: fix register file style
    
    Fix indents, use of spaces vs. tabs, grouping, remove superfluous
    comments, remove some line continuations, wrap macro arguments in
    parens, rename dev_priv to display. This is the way.
    
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 55cbd02fa784e94b4f658c1e547371ac804c62a9 drm-intel
b7fa222ad54f drm/i915/vrr: fix register file style
-:45: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:24:
+#define   XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))

-:74: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#74: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:44:
+#define TRANS_VRR_VMAXSHIFT(display, trans)	_MMIO_TRANS2((display), (trans), _TRANS_VRR_VMAXSHIFT_A)

-:98: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:53:
+#define TRANS_VRR_STATUS(display, trans)	_MMIO_TRANS2((display), (trans), _TRANS_VRR_STATUS_A)

-:124: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#124: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:73:
+#define TRANS_VRR_VTOTAL_PREV(display, trans)	_MMIO_TRANS2((display), (trans), _TRANS_VRR_VTOTAL_PREV_A)

-:137: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#137: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:83:
+#define TRANS_VRR_FLIPLINE(display, trans)	_MMIO_TRANS2((display), (trans), _TRANS_VRR_FLIPLINE_A)

-:146: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#146: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:90:
+#define TRANS_VRR_STATUS2(display, trans)	_MMIO_TRANS2((display), (trans), _TRANS_VRR_STATUS2_A)

-:181: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#181: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:112:
+#define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))

total: 0 errors, 7 warnings, 0 checks, 183 lines checked


