Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B1FC3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 07:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D082E10E215;
	Wed, 14 May 2025 07:09:07 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421E10E2A4;
 Wed, 14 May 2025 07:09:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_u32_overflow_issues_f?=
 =?utf-8?q?or_SNPS_PHY_HDMI_PLL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 07:09:06 -0000
Message-ID: <174720654646.77507.1318993512463914523@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513083803.2596286-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250513083803.2596286-1-dibin.moolakadan.subrahmanian@intel.com>
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

Series: Fix u32 overflow issues for SNPS PHY HDMI PLL
URL   : https://patchwork.freedesktop.org/series/148946/
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
commit 749292b57187993ea321a7ab1772ab48a5b5b18f
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Date:   Tue May 13 14:08:03 2025 +0530

    drm/i915/display: Fix intel_snps_hdmi_pll.c overflow issues
    
    intel_snps_hdmi_pll.c calls do_div  function from DIV_ROUND_UP_ULL
    and DIV_ROUND_DOWN_ULL macros. do_div  expects the arg2 type to be u32.
    On higher data rate arg2 exceeds u32 and ends up in wrong pll
    configuration.
    
    So change do_div calls to div64_base64 calls where ever arg2 exceeds u32.
    
    Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
+ /mt/dim checkpatch 4fd790cf2b20fd2ab205aa2a074cecd214562089 drm-intel
2567c2dab2f6 drm/i915/display: Fix get_ana_cp_int_prop() argument type
749292b57187 drm/i915/display: Fix intel_snps_hdmi_pll.c overflow issues


