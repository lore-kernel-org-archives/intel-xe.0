Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E2C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 03:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CAC10E226;
	Tue, 13 Aug 2024 03:24:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C9210E226;
 Tue, 13 Aug 2024 03:24:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_HDMI_PLL_Algorithm_fo?=
 =?utf-8?q?r_SNPS/C10PHY_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 03:24:21 -0000
Message-ID: <172351946101.596344.3692109226043584175@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813031941.3553574-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240813031941.3553574-1-ankit.k.nautiyal@intel.com>
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

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev3)
URL   : https://patchwork.freedesktop.org/series/135396/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 53b47b1b7665a7a6ea701a61328c5c2610894eb5
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Aug 13 08:49:38 2024 +0530

    drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY
    
    Try HDMI PLL alogorithm for C10 PHY, if there are no pre-computed tables.
    Also get rid of the helpers to get rate for HDMI for C10/20 PHY, as we no
    longer depend only on pre-computed tables.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch bb06cec392c188bc980be5cee9a85240ce866b78 drm-intel
749cb8c72ebb drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 315 lines checked
65a425592b21 drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
0c53853ab52f drm/i915/cx0_phy_regs: Add C10 registers bits
0a56edbe72fd drm/i915/intel_snps_hdmi_pll: Compute C10 HDMI PLLs with algorithm
53b47b1b7665 drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY


