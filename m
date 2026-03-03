Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC61DEC1451
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 14:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5219C10E02E;
	Tue,  3 Mar 2026 14:23:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155FF10E02E;
 Tue,  3 Mar 2026 14:23:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR/PR_Selective_Fetch_Ea?=
 =?utf-8?q?rly_Transport_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 14:23:07 -0000
Message-ID: <177254778706.310842.14012021686872632242@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303125409.503148-1-jouni.hogander@intel.com>
In-Reply-To: <20260303125409.503148-1-jouni.hogander@intel.com>
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

Series: PSR/PR Selective Fetch Early Transport fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/161835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d37022aa2323e4e9f475af300ef388ec2374174a
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Mar 3 14:54:09 2026 +0200

    drm/i915/psr: Write DSC parameters on Selective Update in ET mode
    
    There are slice row per frame and pic height parameters in DSC that needs
    to be configured on every Selective Update in Early Transport mode. Use
    helper provided by DSC code to configure these on Selective Update when in
    Early Transport mode. Also fill crtc_state->psr2_su_area with full frame
    area on full frame update for DSC calculation.
    
    Bspec: 68927, 71709
    Fixes: 467e4e061c44 ("drm/i915/psr: Enable psr2 early transport as possible")
    Cc: <stable@vger.kernel.org> # v6.9+
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 591d026bf9c13f8982524c9f6d945be1e6f4cfc6 drm-intel
1cbb280ea6c2 drm/i915/psr: Repeat Selective Update area alignment
8b560333187b drm/i915/dsc: Add Selective Update register definitions
-:28: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:203:
+#define LNL_DSC0_SU_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe), _LNL_DSC0_SU_PARAMETER_SET_0_PA, _LNL_DSC0_SU_PARAMETER_SET_0_PB)

-:29: WARNING:LONG_LINE: line length of 132 exceeds 100 columns
#29: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:204:
+#define LNL_DSC1_SU_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe), _LNL_DSC1_SU_PARAMETER_SET_0_PA, _LNL_DSC1_SU_PARAMETER_SET_0_PB)

-:32: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:207:
+#define   DSC_SUPS0_SU_SLICE_ROW_PER_FRAME(rows)	REG_FIELD_PREP(DSC_SUPS0_SU_SLICE_ROW_PER_FRAME_MASK, (rows))

-:34: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:209:
+#define   DSC_SUPS0_SU_PIC_HEIGHT(h)			REG_FIELD_PREP(DSC_SUPS0_SU_PIC_HEIGHT_MASK, (h))

total: 0 errors, 4 warnings, 0 checks, 18 lines checked
398420e33a67 drm/i915/dsc: Add helper for writing DSC Selective Update ET parameters
d37022aa2323 drm/i915/psr: Write DSC parameters on Selective Update in ET mode


