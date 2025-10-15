Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD6BCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 21:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E5F10E10E;
	Wed, 15 Oct 2025 21:45:50 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4CC10E10E;
 Wed, 15 Oct 2025 21:45:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Fix_C?=
 =?utf-8?q?20_PHY_PLL_DP/HDMI_mode_programming_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 21:45:49 -0000
Message-ID: <176056474958.19067.13875368801824145211@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015125446.3931198-1-mika.kahola@intel.com>
In-Reply-To: <20251015125446.3931198-1-mika.kahola@intel.com>
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

Series: drm/i915/display: Fix C20 PHY PLL DP/HDMI mode programming (rev2)
URL   : https://patchwork.freedesktop.org/series/155824/
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
commit c04ebeb710013231570bfbe7e8c52d160d5009ae
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Oct 15 15:54:46 2025 +0300

    drm/i915/display: Add missing clock to C10 PHY state compute/HW readout
    
    Clock value is missing from C10 hw readout stage. Let's fix this.
    
    Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch f019aaad58112f89234f7b68557c831846437008 drm-intel
fa7360dd1a5e drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/DP_RATE field macros
b73c1a865a56 drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_DP flag macro
9346a4706115 drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/CONTEXT_TOGGLE flag macro
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Move the PHY_C20_CONTEXT_TOGGLE flag's definition under the register containing

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
2dc2c9750452 drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_HDMI_FRL flag macro
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Define PHY_C20_IS_HDMI_FRL, so it can be used instead of the plain bit number.

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
9f2e94693960 drm/i915/display: Fix PHY_C20_VDR_CUSTOM_SERDES_RATE programming
169785469816 drm/i915/display: Fix PHY_C20_VDR_HDMI_RATE programming
c04ebeb71001 drm/i915/display: Add missing clock to C10 PHY state compute/HW readout


