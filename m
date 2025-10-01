Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7970CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 16:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ED410E737;
	Wed,  1 Oct 2025 16:22:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115A810E0F9;
 Wed,  1 Oct 2025 16:22:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Enabl?=
 =?utf-8?q?e_PICA_power_before_AUX_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 16:22:43 -0000
Message-ID: <175933576301.383746.2705810952314739862@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251001-pica-power-before-aux-v2-0-6308df4de5a8@intel.com>
In-Reply-To: <20251001-pica-power-before-aux-v2-0-6308df4de5a8@intel.com>
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

Series: drm/i915/display: Enable PICA power before AUX (rev2)
URL   : https://patchwork.freedesktop.org/series/154964/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 818a049100bb5c6bea74deb764fee12368fb026b
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Oct 1 13:04:49 2025 -0300

    drm/i915/display: Enable PICA power before AUX
    
    According to Bspec, before enabling AUX power, we need to have the
    "power well containing Aux logic powered up". Starting with Xe2_LPD,
    such power well is the "PICA" power well, which is managed by the driver
    on demand.
    
    While we did add the mapping of AUX power domains to the PICA power
    well, we ended up placing its power well descriptor after the
    descriptor for AUX power. As a result, when enabling power wells for one
    of the aux power domains, the driver will enable AUX power before PICA
    power, going against the order specified in Bspec.
    
    It appears that issue did not become apparent to us mainly because,
    luckily, AUX power is brought up after we assert PICA power, even if
    done in the wrong order; and in enough time for the first AUX
    transaction to succeed.
    
    Furthermore, I have also realized that, in some cases, like driver
    initialization, PICA power is already up when we need to acquire AUX
    power.
    
    One case where we can observe the incorrect ordering is when the driver
    is resuming from runtime PM suspend. Here is an excerpt of a dmesg with
    some extra debug logs extracted from a LNL machine to illustrate the
    issue:
    
        [  +0.000156] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabling AUX_TC1
        [  +0.001312] xe 0000:00:02.0: [drm:xelpdp_aux_power_well_enable [xe]] DBG: AUX_CH_USBC1 power status: 0
        [  +0.000127] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabling PICA_TC
        [  +0.001072] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC1 power status: 1
        [  +0.000102] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC2 power status: 0
        [  +0.000090] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC3 power status: 0
        [  +0.000092] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC4 power status: 0
    
    The first "DBG: ..." line shows that AUX power for TC1 is off after we
    assert and wait. The remaining lines show that AUX power for TC1 was on
    after we enabled PICA power and waited for AUX power.
    
    It is important that we stay compliant with the spec, so let's fix this
    by listing the power wells in an order that matches the requirements
    from Bspec. (As a side note, it would be nice if we could define those
    dependencies explicitly.)
    
    After this change, we have:
    
        [  +0.000146] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabling PICA_TC
        [  +0.001417] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC1 power status: 0
        [  +0.000116] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC2 power status: 0
        [  +0.000096] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC3 power status: 0
        [  +0.000094] xe 0000:00:02.0: [drm:xe2lpd_pica_power_well_enable [xe]] DBG: AUX_CH_USBC4 power status: 0
        [  +0.000095] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabling AUX_TC1
        [  +0.000915] xe 0000:00:02.0: [drm:xelpdp_aux_power_well_enable [xe]] DBG: AUX_CH_USBC1 power status: 1
    
    Bspec: 68967, 68886, 72519
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 5f87abb254011980c8332008cfff72d2cfab4952 drm-intel
4cc085851de7 drm/i915/display: Extract separate AUX PW descriptors
818a049100bb drm/i915/display: Enable PICA power before AUX
-:31: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#31: 
    [  +0.000156] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabling AUX_TC1

total: 0 errors, 1 warnings, 0 checks, 27 lines checked


