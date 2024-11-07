Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE75D5D688
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 20:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7D910E20B;
	Thu,  7 Nov 2024 20:39:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC2010E20B;
 Thu,  7 Nov 2024 20:39:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/mst=3A_cleanups?=
 =?utf-8?q?=2C_renames=2C_clarifications?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 20:39:39 -0000
Message-ID: <173101197969.1423994.17572781211398485011@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731011435.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731011435.git.jani.nikula@intel.com>
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

Series: drm/i915/mst: cleanups, renames, clarifications
URL   : https://patchwork.freedesktop.org/series/141067/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d1e2fb82cadb1868151a8490581c220fe1c67690
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 7 22:32:21 2024 +0200

    drm/i915/dp: add comments about hooks called from MST stream encoders
    
    It would be best to have self-explanatory code, but lacking that, add
    some comments about the way the DDI encoder hooks get called from DP MST
    stream encoders.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 85b1b17ed748e1f68ac83052916a95d624405c97 drm-intel
5e4c897f892b drm/i915/mst: pass primary encoder to primary encoder hooks
-:21: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#21: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:1116:
+		dig_port->base.post_pll_disable(state, &dig_port->base, old_crtc_state, old_conn_state);

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
60ce0f96a4d8 drm/i915/mst: rename intel_encoder to encoder
4f3eec0a5d0a drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
-:153: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#153: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:1126:
+		primary_encoder->post_pll_disable(state, primary_encoder, old_crtc_state, old_conn_state);

total: 0 errors, 1 warnings, 0 checks, 231 lines checked
25295cc46d90 drm/i915/mst: use primary_encoder in fake mst encoder creation
6eab7549e8f4 drm/i915/display: make CHICKEN_TRANS() display version aware
-:224: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#224: FILE: drivers/gpu/drm/i915/i915_reg.h:2805:
+#define _CHICKEN_TRANS(trans)	_MMIO(_PICK((trans), \
 					    [TRANSCODER_EDP] = _CHICKEN_TRANS_EDP, \
 					    [TRANSCODER_A] = _CHICKEN_TRANS_A, \
 					    [TRANSCODER_B] = _CHICKEN_TRANS_B, \

-:236: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#236: FILE: drivers/gpu/drm/i915/i915_reg.h:2816:
+#define CHICKEN_TRANS(display, trans)	(DISPLAY_VER(display) >= 14 ? _MTL_CHICKEN_TRANS(trans) : _CHICKEN_TRANS(trans))

-:236: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'trans' - possible side-effects?
#236: FILE: drivers/gpu/drm/i915/i915_reg.h:2816:
+#define CHICKEN_TRANS(display, trans)	(DISPLAY_VER(display) >= 14 ? _MTL_CHICKEN_TRANS(trans) : _CHICKEN_TRANS(trans))

total: 1 errors, 1 warnings, 1 checks, 176 lines checked
ef88efb47a1a drm/i915/mst: convert to struct intel_display
eecc9d118f5b drm/i915/mst: change naming from fake encoders to MST stream encoders
d1e2fb82cadb drm/i915/dp: add comments about hooks called from MST stream encoders


