Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723B6CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 14:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746010E768;
	Wed,  5 Nov 2025 14:58:59 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090410E761;
 Wed,  5 Nov 2025 14:58:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Reviewed_patches_from=3A_?=
 =?utf-8?q?=5BPATCH_v3_00/29=5D_drm/i915/display=3A_Add_initial_support_for_?=
 =?utf-8?q?Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 14:58:57 -0000
Message-ID: <176235473785.20785.5544656165823008408@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105140651.71713-19-gustavo.sousa@intel.com>
In-Reply-To: <20251105140651.71713-19-gustavo.sousa@intel.com>
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

Series: Reviewed patches from: [PATCH v3 00/29] drm/i915/display: Add initial support for Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/157072/
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
commit 832a780cdb7a1a5a4b73f1baac753412c39b5b64
Author: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date:   Wed Nov 5 11:07:06 2025 -0300

    drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers
    
    Xe3p_LPD updated fields of registers MBUS_CTL and DBUF_CTL to
    accommodate for higher MDCLK:CDCLK ratios.  Update the code to use the
    new fields.
    
    The field MBUS_TRANSLATION_THROTTLE_MIN_MASK was changed from range
    [15:13] to [16:13].  Since bit 16 is not reserved in previous display
    IPs and already used for something else, we can't simply extend the mask
    definition to include it, but rather define an Xe3p-specific mask and
    select the correct one to use based on the IP version.
    
    Similarly, DBUF_MIN_TRACKER_STATE_SERVICE_MASK was changed from range
    [18:16] to [20:16]. For the same reasons stated above, it needs a
    Xe3p-specific mask definition.
    
    v2:
      - Keep definitions in the same line (i.e. without line continuation
        breaks) for better readability. (Jani)
    v3:
      - Keep mask fields sorted by the upper limit. (Matt)
      - Extend commit message to indicate why we need Xe3p-specific
        definitions of the masks instead of just extending the existing
        ones. (Matt)
    
    Bspec: 68868, 68872
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://patch.msgid.link/20251103-xe3p_lpd-basic-enabling-v3-18-00e87b510ae7@intel.com
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 16a75a91c651f103f022b6b3c6ca29b13205cc9b drm-intel
2e5aa252d648 drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
586f36a2ab65 drm/i915/xe3p_lpd: Drop north display reset option programming
3d737a8e0d21 drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
2b159990c666 drm/i915/xe3p_lpd: Update bandwidth parameters
48bd95a23ee3 drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
9dec679dadf5 drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
0a51107a4e28 drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks
d4bd90fe975a drm/i915/xe3p_lpd: Add CDCLK table
19c0a45773f5 drm/i915/xe3p_lpd: Load DMC firmware
6bcbb106642d drm/i915/xe3p_lpd: Drop support for interlace mode
4146e459d402 drm/i915/xe3p_lpd: Extend Wa_16025573575
bf967752b1bf drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar format
43cfb71b0ac0 drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
def8122d808e drm/i915/wm: don't use method1 in Xe3p_LPD onwards
91afcf28fa99 drm/i915/dram: Add field ecc_impacting_de_bw
5f7f990b091b drm/i915/xe3p_lpd: Always apply WaWmMemoryReadLatency
832a780cdb7a drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers
-:95: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#95: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:41:
+#define   MBUS_JOIN_PIPE_SELECT(pipe)			REG_FIELD_PREP(MBUS_JOIN_PIPE_SELECT_MASK, pipe)

-:98: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#98: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:44:
+#define   XE3P_MBUS_TRANSLATION_THROTTLE_MIN(val)	REG_FIELD_PREP(XE3P_MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:100: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:46:
+#define   MBUS_TRANSLATION_THROTTLE_MIN(val)		REG_FIELD_PREP(MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

-:134: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:68:
+#define  DBUF_TRACKER_STATE_SERVICE(x)			REG_FIELD_PREP(DBUF_TRACKER_STATE_SERVICE_MASK, x)

-:136: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#136: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:70:
+#define  XE3P_DBUF_MIN_TRACKER_STATE_SERVICE(x)		REG_FIELD_PREP(XE3P_DBUF_MIN_TRACKER_STATE_SERVICE_MASK, x)

total: 0 errors, 5 warnings, 0 checks, 92 lines checked


