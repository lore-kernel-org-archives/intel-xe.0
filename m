Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA5CC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246A10E4E6;
	Thu, 13 Aug 2026 16:18:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7044510E4E6;
 Thu, 13 Aug 2026 16:18:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 16:18:54 -0000
Message-ID: <178663793445.49153.16455339547611654397@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813160918.918857-1-michal.grzelak@intel.com>
In-Reply-To: <20260813160918.918857-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override (rev6)
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
commit ee8ab2006e28c9d12064bac9d2d3ea3b3bece221
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Thu Aug 13 18:09:18 2026 +0200

    drm/i915/bios: remove VS/PE-O warning
    
    There is not much use of warning when port asks to override default
    VS/PE since it is already logged. Remove drm_WARN() and child_device
    from print_ddi_port() since drm_WARN() was the only user of it.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 12a74df2314c42325731297e95b9aafd9329a20d drm-intel
c95ca7776f76 drm/i915/bios: search for VBT #57 by default
c93fea0d9fbf drm/i915/bios: store VBT #57's metadata in intel_vbt_data
e58330f0bbd1 drm/i915/bios: print VS/PE-O port info
b512c109498d drm/i915/bios: de/allocate VS/PE-O buffers for each port
2c1425da598f drm/i915/buf_trans: add vfunc for VS/PE-O
-:54: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:293:
+								    const struct intel_crtc_state *crtc_state,

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
a36fb5bbc69b drm/i915: override Snps's VS/PE when requested
8f39e6efbf86 drm/i915: override Combo's VS/PE when requested
-:245: CHECK:BRACES: braces {} should be used on all arms of this statement
#245: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1883:
+		if (display->platform.jasperlake) {
[...]
+			encoder->get_buf_trans_override = jsl_get_combo_buf_trans_override;
[...]
-		else if (intel_encoder_is_combo(encoder))
[...]
+		} else if (intel_encoder_is_combo(encoder))
[...]

total: 0 errors, 0 warnings, 1 checks, 168 lines checked
ee8ab2006e28 drm/i915/bios: remove VS/PE-O warning


