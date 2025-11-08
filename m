Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A988CCCF9E3
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 01:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589DA10E1E6;
	Sat,  8 Nov 2025 01:52:58 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92E10E1E6;
 Sat,  8 Nov 2025 01:52:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_for_Xe3p=5FLPD_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Nov 2025 01:52:57 -0000
Message-ID: <176256677769.31057.6191780670652449184@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107-xe3p_lpd-basic-enabling-v4-0-ab3367f65f15@intel.com>
In-Reply-To: <20251107-xe3p_lpd-basic-enabling-v4-0-ab3367f65f15@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD (rev4)
URL   : https://patchwork.freedesktop.org/series/155951/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8975da4a18ed8f2b3185357ac5b8c6a4ea4c94b5
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Nov 7 21:05:44 2025 -0300

    drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power
    
    Bspec states that the new AUX power enable/disable sequences are
    associated with the LT PHY.  As such, use HAS_LT_PHY() instead of IP
    checks in those paths in the driver code.
    
    While at it, also move the comment that we can't use the power status
    flag to the "else" branch, since that comment is not applicable for the
    LT PHY.
    
    Bspec: 68967
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 2bc418aa7efaae562e49d84e8b28f799cf624745 drm-intel
838858cf34e0 drm/i915/wm: Do not make latency values monotonic on Xe3 onward
fcd9b615992e drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
ec551d2110d1 drm/i915/power: Use intel_encoder_is_tc()
abb83f6d3cb3 drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
aa19ee63ea65 drm/i915/fbc: Add intel_fbc_id_for_pipe()
9d40f63f7004 drm/i915/xe3p_lpd: Handle underrun debug bits
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/all/20251015-xe3p_lpd-basic-enabling-v1-12-d2d1e26520aa@intel.com/

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
2057c8655f70 drm/i915/xe3p_lpd: Extend Type-C flow for static DDI allocation
-:49: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'tc_port' - possible side-effects?
#49: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:2928:
+#define   IOM_DDI_CONSUMER_STATIC_TC(tc_port)	IOM_DDI_CONSUMER(tc_port, 0x8 + (tc_port))

total: 0 errors, 0 warnings, 1 checks, 219 lines checked
92774145328a drm/i915/nvls: Add NVL-S display support
1392c6a263cc drm/i915/display: Use platform check in HAS_LT_PHY()
7ce295f55fad drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
8975da4a18ed drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power


