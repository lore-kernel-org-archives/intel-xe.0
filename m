Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A4ED0BB66
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 07:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A79D10E8BB;
	Thu, 24 Oct 2024 07:01:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E6A10E8BB;
 Thu, 24 Oct 2024 07:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe2lpd=3A_Update?=
 =?utf-8?q?_C20_HDMI_TMDS_algorithm_to_include_tx=5Fmisc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 07:01:43 -0000
Message-ID: <172975330367.1325996.8613808938854069783@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023153352.144146-1-gustavo.sousa@intel.com>
In-Reply-To: <20241023153352.144146-1-gustavo.sousa@intel.com>
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

Series: drm/i915/xe2lpd: Update C20 HDMI TMDS algorithm to include tx_misc (rev2)
URL   : https://patchwork.freedesktop.org/series/140135/
State : success

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
commit 840677ab09f763646f86332b0ce518b0f5a6e91f
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Oct 23 12:33:46 2024 -0300

    drm/i915/xe2lpd: Update C20 algorithm to include tx_misc
    
    There has been an update to the BSpec in which we need to set
    tx_misc=0x5 field for C20 TX Context programming for HDMI TMDS for
    Xe2_LPD and newer. That field is mapped to the bits 7:0 of
    SRAM_GENERIC_<A/B>_TX_CNTX_CFG_1, which in turn translates to tx[1] of
    our state struct. Update the algorithm to reflect this change.
    
    v2:
      - Fix Bspec reference (Sai Teja)
      - Use struct intel_display instead of drm_i915_private. (Jani)
      - Use the correct bit width for C20_PHY_TX_MISC_MASK. (Jani)
    
    Bspec: 74491
    Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com> #v1
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 3d45ea06af2c04db741c142380d97001b3cdb5da drm-intel
90092718fd83 drm/i915/cx0: Pass crtc_state to intel_c20_compute_hdmi_tmds_pll()
840677ab09f7 drm/i915/xe2lpd: Update C20 algorithm to include tx_misc


