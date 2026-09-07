Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4CCC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7F10E4EC;
	Mon,  7 Sep 2026 13:17:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF5210E4EC;
 Mon,  7 Sep 2026 13:17:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 13:17:44 -0000
Message-ID: <178878706476.130176.2458313615585829318@61270ab9df2a>
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

Series: Vswing / Pre-emphasis Override (rev8)
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
commit ee3dd7f41d60e173949805c1dbf6a927ead820c5
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Fri Sep 4 14:31:48 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 547f981c369d4b8adf60c5d282b37854f11dab17 drm-intel
cf5383a4f903 drm/i915/bios: search for VBT #57 by default
73bf266904d6 drm/i915/bios: store VBT #57's metadata in intel_vbt_data
b3451f9f678a drm/i915/bios: print VS/PE-O port info
dbf1721e7d39 drm/i915/bios: de/allocate VS/PE-O buffers for each port
bab198a9c36b drm/i915/buf_trans: add vfunc for VS/PE-O
-:55: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:293:
+								    const struct intel_crtc_state *crtc_state,

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
5ced3056243b drm/i915: override Snps's VS/PE when requested
a920a4002f68 drm/i915: override Combo's VS/PE when requested
-:249: CHECK:BRACES: braces {} should be used on all arms of this statement
#249: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1884:
+		if (display->platform.jasperlake) {
[...]
+			encoder->get_buf_trans_override = jsl_get_combo_buf_trans_override;
[...]
-		else if (intel_encoder_is_combo(encoder))
[...]
+		} else if (intel_encoder_is_combo(encoder))
[...]

total: 0 errors, 0 warnings, 1 checks, 167 lines checked
ee3dd7f41d60 drm/i915/bios: remove VS/PE-O warning


