Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1651CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 15:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAED10EA44;
	Thu, 28 Aug 2025 15:48:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1110EA42;
 Thu, 28 Aug 2025 15:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_conve?=
 =?utf-8?q?rt_to_generic_poll=5Ftimeout=5Fus=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 15:48:41 -0000
Message-ID: <175639612110.279076.9460537576085593872@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1756383233.git.jani.nikula@intel.com>
In-Reply-To: <cover.1756383233.git.jani.nikula@intel.com>
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

Series: drm/i915/display: convert to generic poll_timeout_us()
URL   : https://patchwork.freedesktop.org/series/153630/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 381a2c3ca549c9d375872521709c464778e50453
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Aug 28 15:21:02 2025 +0300

    drm/i915/pps: prefer poll_timeout_us() over read_poll_timeout()
    
    Unify on using poll_timeout_us() throughout instead of mixing with
    readx_poll_timeout().
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 drm-intel
dd67440c56f1 drm/i915/hdmi: use generic poll_timeout_us() instead of __wait_for()
f58da9c77b91 drm/i915/hdcp: use generic poll_timeout_us() instead of __wait_for()
3e009722f7ca drm/i915/hdcp: use generic poll_timeout_us() instead of wait_for()
-:38: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/display/intel_hdcp.c:909:
+	ret = poll_timeout_us(val = intel_de_read(display, HDCP_STATUS(display, cpu_transcoder, port)),

-:51: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/intel_hdcp.c:944:
+		ret = poll_timeout_us(val = intel_de_read(display, HDCP_STATUS(display, cpu_transcoder, port)),

total: 0 errors, 2 warnings, 0 checks, 40 lines checked
e31def7b9154 drm/i915/dsi: use generic poll_timeout_us() instead of wait_for_us()
4bc0c2ac73d0 drm/i915/dsi-pll: use generic poll_timeout_us() instead of wait_for()
c53298027476 drm/i915/gmbus: use generic poll_timeout*() instead of wait_for*()
88bb512dbf66 drm/i915/wm: use generic poll_timeout_us() instead of wait_for()
c5cb2c8c0610 drm/i915/cdclk: use generic poll_timeout_us() instead of wait_for()
-:66: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_cdclk.c:728:
+				      (val & CCK_FREQUENCY_STATUS) == (divider << CCK_FREQUENCY_STATUS_SHIFT),

total: 0 errors, 1 warnings, 0 checks, 73 lines checked
137902e056c1 drm/i915/power: use generic poll_timeout_us() instead of wait_for()
7a0fb50a6661 drm/i915/power-well: use generic poll_timeout_us() instead of wait_for() for DKL PHY
1dce2686ef61 drm/i915/power-well: use generic poll_timeout_us() instead of wait_for() for VLV/CHV
b77b7658ee30 drm/i915/dp: use generic poll_timeout_us() instead of wait_for()
-:55: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3903:
+	ret = poll_timeout_us(is_active = intel_dp_pcon_is_frl_trained(intel_dp, max_frl_bw_mask, &frl_trained_mask),

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
7b5b3c027070 drm/i915/dp: use generic poll_timeout_us() instead of wait_for() in link training
7619d32699c0 drm/i915/vblank: use generic poll_timeout_us() instead of wait_for()
92bd83bd119b drm/i915/tc: use generic poll_timeout_us() instead of wait_for()
5c97530b9142 drm/i915/dsb: use generic poll_timeout_us() instead of wait_for()
70bae7b959ff drm/i915/lspcon: use generic poll_timeout_us() instead of wait_for()
5b310419bcb6 drm/i915/opregion: use generic poll_timeout_us() instead of wait_for()
ebbf7a60103d drm/i915/ddi: prefer poll_timeout_us() over readx_poll_timeout()
381a2c3ca549 drm/i915/pps: prefer poll_timeout_us() over read_poll_timeout()


