Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36324EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 11:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047AE10E793;
	Tue, 10 Sep 2024 11:14:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2843D10E793;
 Tue, 10 Sep 2024 11:14:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_fix_and_enable_war?=
 =?utf-8?q?nings_on_unused_static_inlines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 11:14:02 -0000
Message-ID: <172596684216.980405.13482786475178211952@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
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

Series: drm: fix and enable warnings on unused static inlines
URL   : https://patchwork.freedesktop.org/series/138461/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f534fa4b77b3e83024e55060054716181f6e283d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 10 13:03:44 2024 +0300

    drm: enable warnings on unused static inlines
    
    We enable most W=1 warnings by default subsystem wide. Also enable
    warnings on unused static inlines when building with clang.
    
    See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
    inline functions for W=1 build").
    
    Cc: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
de3dc189662d drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
e20d22957206 drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
3bc25096c844 drm/kmb: annotate set_test_mode_src_osc_freq_target_{low, hi}_bits() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
0252611af48a drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request, release} with __maybe_unused
ae139a373053 drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
0b9bb07ff443 drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits() with __maybe_unused
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
dd438fe895c0 drm/msmi: annotate pll_cmp_to_fdata() with __maybe_unused
-:6: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#6: 
Building with clang and and W=1 leads to warning about unused

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
f534fa4b77b3 drm: enable warnings on unused static inlines


