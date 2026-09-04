Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE57C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 13:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836310E54F;
	Fri,  4 Sep 2026 13:04:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810810E547;
 Fri,  4 Sep 2026 13:04:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 13:04:24 -0000
Message-ID: <178852706401.122453.3249834431714415999@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
In-Reply-To: <20260904123148.2165596-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override (rev7)
URL   : https://patchwork.freedesktop.org/series/167570/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1ea5f0a045f474d3216c16ffa2862d13a7bacad
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Fri Sep 4 14:31:48 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 313da1cc22491f07075c7ae36372343aa235d11e drm-intel
22985a1465ba drm/i915/bios: search for VBT #57 by default
9cf4cd442a1c drm/i915/bios: store VBT #57's metadata in intel_vbt_data
69a040127afa drm/i915/bios: print VS/PE-O port info
56d1cd8cdaea drm/i915/bios: de/allocate VS/PE-O buffers for each port
345d06702fa8 drm/i915/buf_trans: add vfunc for VS/PE-O
-:55: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:293:
+								    const struct intel_crtc_state *crtc_state,

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
d60e20118e27 drm/i915: override Snps's VS/PE when requested
1256121383d4 drm/i915: override Combo's VS/PE when requested
-:250: CHECK:BRACES: braces {} should be used on all arms of this statement
#250: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1884:
+		if (display->platform.jasperlake) {
[...]
+			encoder->get_buf_trans_override = jsl_get_combo_buf_trans_override;
[...]
-		else if (intel_encoder_is_combo(encoder))
[...]
+		} else if (intel_encoder_is_combo(encoder))
[...]

total: 0 errors, 0 warnings, 1 checks, 167 lines checked
f1ea5f0a045f drm/i915/bios: remove VS/PE-O warning


