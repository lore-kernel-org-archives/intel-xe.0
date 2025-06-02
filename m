Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CA8C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 05:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8079B10E114;
	Mon,  2 Jun 2025 05:13:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4647910E114;
 Mon,  2 Jun 2025 05:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Fix_u?=
 =?utf-8?q?32_overflow_in_SNPS_PHY_HDMI_PLL_setup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 05:13:07 -0000
Message-ID: <174884118728.39982.4068245360713126604@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528064557.4172149-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250528064557.4172149-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup (rev2)
URL   : https://patchwork.freedesktop.org/series/149566/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f297be99936fbe156d2494013fd835b718b29e61
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Date:   Wed May 28 12:15:56 2025 +0530

    drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup
    
    When configuring the HDMI PLL, calculations use DIV_ROUND_UP_ULL and
    DIV_ROUND_DOWN_ULL macros, which internally rely on do_div. However, do_div
    expects a 32-bit (u32) divisor, and at higher data rates, the divisor can
    exceed this limit. This leads to incorrect division results and
    ultimately misconfigured PLL values.
    This fix replaces do_div calls with  div64_base64 calls where diviser
    can exceed u32 limit.
    
    Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Fixes: 5947642004bf ("drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 574ad1700b1819b1e762e9ab2a708ea100b4ba97 drm-intel
f297be99936f drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup


