Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CB1C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 19:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269810F598;
	Thu,  2 Jul 2026 19:06:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2C310F598;
 Thu,  2 Jul 2026 19:06:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Jul 2026 19:06:14 -0000
Message-ID: <178301917490.145556.11275097085952793544@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702185839.4042397-1-michal.grzelak@intel.com>
In-Reply-To: <20260702185839.4042397-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override (rev5)
URL   : https://patchwork.freedesktop.org/series/167570/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e545db2ea4d793024cdba63d767a878714c8e2c
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Jul 2 20:58:39 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 76d0ddcc37bbcc1fe5819e0322739e5e17f59aae drm-intel
3e1187adc9e4 drm/i915/bios: search for VBT #57 by default
65d9edfc6c3a drm/i915/bios: store VBT #57's metadata in intel_vbt_data
64568fbf84de drm/i915/bios: print VS/PE-O port info
9f5f327a36f8 drm/i915/bios: de/allocate VS/PE-O buffers for each port
30f50b639e83 drm/i915/buf_trans: add vfunc for VS/PE-O
-:53: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:293:
+								    const struct intel_crtc_state *crtc_state,

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
5073a4837fac drm/i915: override Snps's VS/PE when requested
53dd5298cf7d drm/i915: override Combo's VS/PE when requested
-:247: CHECK:BRACES: braces {} should be used on all arms of this statement
#247: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1883:
+		if (display->platform.jasperlake) {
[...]
+			encoder->get_buf_trans_override = jsl_get_combo_buf_trans_override;
[...]
-		else if (intel_encoder_is_combo(encoder))
[...]
+		} else if (intel_encoder_is_combo(encoder))
[...]

total: 0 errors, 0 warnings, 1 checks, 177 lines checked
3e545db2ea4d drm/i915/bios: remove VS/PE-O warning


