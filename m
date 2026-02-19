Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C56E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77A10E300;
	Thu, 19 Feb 2026 13:45:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F5D10E300;
 Thu, 19 Feb 2026 13:45:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PSR/PR_Selective_Fetch_Ea?=
 =?utf-8?q?rly_Transport_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 13:45:54 -0000
Message-ID: <177150875406.265813.18406823237839097844@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219130743.1232188-1-jouni.hogander@intel.com>
In-Reply-To: <20260219130743.1232188-1-jouni.hogander@intel.com>
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

Series: PSR/PR Selective Fetch Early Transport fixes
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
commit 74856dac452f3be735872468d55e03118649982f
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Feb 19 15:07:43 2026 +0200

    drm/i915/psr: Drop cursor_in_su_area from intel_psr2_sel_fetch_et_alignment
    
    Boolean variable cursor_in_su_area is not really used for anything. Remove
    it.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch c81e41f7aca96f583296a2a875f0179484b7a81f drm-intel
0ebb6673cc10 drm/i915/psr: Repeat Selective Update area alignment
ae6f7d6de56e drm/i915/psr: Add DSC_SU_PARAMETER_SET_0 registers for PSR configuration
-:26: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#26: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:271:
+#define DSC_SU_PARAMETER_SET_0_DSC0(pipe)	_MMIO_PIPE((pipe), _DSC_SU_PARAMETER_SET_0_DSC0_A, _DSC_SU_PARAMETER_SET_0_DSC0_B)

-:28: WARNING:LONG_LINE: line length of 138 exceeds 100 columns
#28: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:273:
+#define   DSC_SU_PARAMETER_SET_0_SU_SLICE_ROW_PER_FRAME(rows)	REG_FIELD_PREP(DSC_SU_PARAMETER_SET_0_SU_SLICE_ROW_PER_FRAME_MASK, (rows))

-:30: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:275:
+#define   DSC_SU_PARAMETER_SET_0_SU_PIC_HEIGHT(h)		REG_FIELD_PREP(DSC_SU_PARAMETER_SET_0_SU_PIC_HEIGHT_MASK, (h))

-:34: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_psr_regs.h:279:
+#define DSC_SU_PARAMETER_SET_0_DSC1(pipe)	_MMIO_PIPE((pipe), _DSC_SU_PARAMETER_SET_0_DSC1_A, _DSC_SU_PARAMETER_SET_0_DSC1_B)

total: 0 errors, 4 warnings, 0 checks, 18 lines checked
02de64091cb0 drm/i915/dsc: Convert intel_dsc_get_vdsc_per_pipe as non-static
b06fe13fc701 drm/i915/psr: DSC configuration for Early Transport
74856dac452f drm/i915/psr: Drop cursor_in_su_area from intel_psr2_sel_fetch_et_alignment


