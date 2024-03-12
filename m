Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE84C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 17:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A385F10E873;
	Tue, 12 Mar 2024 17:50:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BC910E37B;
 Tue, 12 Mar 2024 17:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_LNL_display_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 17:50:18 -0000
Message-ID: <171026581873.696620.1545891126728694514@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312163639.172321-1-gustavo.sousa@intel.com>
In-Reply-To: <20240312163639.172321-1-gustavo.sousa@intel.com>
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

Series: Enable LNL display (rev2)
URL   : https://patchwork.freedesktop.org/series/130688/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35e6cb118dc4dab624f4307fb0730ef6ec0b0cfe
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue Mar 12 13:36:39 2024 -0300

    drm/xe/lnl: Enable display support
    
    Enable display support for Lunar Lake.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 1dfbf3ced62236dd318c701e3f21f5a33c226d0d drm-intel
c0268eb9fa41 drm/i915/cdclk: Rename lnl_cdclk_table to xe2lpd_cdclk_table
869a5922a8cb drm/i915/cdclk: Add and use mdclk_source_is_cdclk_pll()
869f2b88a3ea drm/i915/cdclk: Only compute squash waveform when necessary
a36516d43a7c drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
989836d1a077 drm/i915: Add mdclk_cdclk_ratio to intel_dbuf_state
25cc2a11d42a drm/i915/xe2lpd: Support MDCLK:CDCLK ratio changes
-:265: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#265: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:44:
+#define   MBUS_TRANSLATION_THROTTLE_MIN(val)	REG_FIELD_PREP(MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
2de5087ba005 drm/i915/xe2lpd: Load DMC
35e6cb118dc4 drm/xe/lnl: Enable display support


