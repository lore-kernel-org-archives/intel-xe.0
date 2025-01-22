Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BBFC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 17:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AA210E17D;
	Wed, 22 Jan 2025 17:02:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28810E17D;
 Wed, 22 Jan 2025 17:02:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_HDMI_PLL_Algorithm_fo?=
 =?utf-8?q?r_SNPS/C10PHY_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 17:02:04 -0000
Message-ID: <173756532477.3148812.14102964984179222507@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
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

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev6)
URL   : https://patchwork.freedesktop.org/series/135396/
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
commit 0874e855a4dccb9833372ed94c7ce60b1d835ed1
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon Jan 20 09:51:21 2025 +0530

    drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY
    
    Try HDMI PLL alogorithm for C10 PHY, if there are no pre-computed tables.
    Also get rid of the helpers to get rate for HDMI for C10/20 PHY, as we no
    longer depend only on pre-computed tables.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 6834acba715b85cbecfeb660b9695806e98c9a0a drm-intel
27fbd46cd2fa drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 317 lines checked
ca78f5616d22 drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
66a3b15838c1 drm/i915/cx0_phy_regs: Add C10 registers bits
8f93e4ac1461 drm/i915/intel_snps_hdmi_pll: Compute C10 HDMI PLLs with algorithm
0874e855a4dc drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY


