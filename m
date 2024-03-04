Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F97C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 19:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F8F112515;
	Mon,  4 Mar 2024 19:42:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ECE112515;
 Mon,  4 Mar 2024 19:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_LNL_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Mar 2024 19:42:09 -0000
Message-ID: <170958132916.503981.16497049906109262234@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304183028.195057-1-gustavo.sousa@intel.com>
In-Reply-To: <20240304183028.195057-1-gustavo.sousa@intel.com>
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

Series: Enable LNL display
URL   : https://patchwork.freedesktop.org/series/130688/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d2f8ad033a35976f1cf31f5d9e55d47d5db21296
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Mon Mar 4 15:30:27 2024 -0300

    drm/xe/lnl: Enable display support
    
    Enable display support for Lunar Lake.
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch e8bc216572501440efb20e112bb5aa60599f1863 drm-intel
fa5afc8ac2e5 drm/i915/cdclk: Rename lnl_cdclk_table to xe2lpd_cdclk_table
bcf95d24b0eb drm/i915/cdclk: Add and use xe2lpd_mdclk_source_sel()
f5c0fb223da8 drm/i915/cdclk: Only compute squash waveform when necessary
5983ac439679 drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
c3fa8c3cdc19 drm/i915: Add mdclk_cdclk_ratio to intel_dbuf_state
ee796be867a0 drm/i915/xe2lpd: Support MDCLK:CDCLK ratio changes
-:264: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#264: FILE: drivers/gpu/drm/i915/display/skl_watermark_regs.h:44:
+#define   MBUS_TRANSLATION_THROTTLE_MIN(val)	REG_FIELD_PREP(MBUS_TRANSLATION_THROTTLE_MIN_MASK, val)

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
d5050d00e1cf drm/i915/xe2lpd: Load DMC
d2f8ad033a35 drm/xe/lnl: Enable display support


