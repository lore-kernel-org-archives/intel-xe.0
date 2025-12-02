Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3772CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 03:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8910E16B;
	Tue,  2 Dec 2025 03:23:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72F10E16B;
 Tue,  2 Dec 2025 03:23:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 03:23:34 -0000
Message-ID: <176464581457.46619.2280220900779505812@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251202012306.9315-1-matthew.s.atwood@intel.com>
In-Reply-To: <20251202012306.9315-1-matthew.s.atwood@intel.com>
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

Series: drm/i915/display: Add initial support Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/158344/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d5d6d7f67ab8ed7c59b594de611175820712f089
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Dec 1 17:23:06 2025 -0800

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
+ /mt/dim checkpatch 639f325d8cbdc690de963db2fe5840444ac7ea65 drm-intel
842048d154b4 drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
9f805393b400 drm/i915/power: Use intel_encoder_is_tc()
77103da79a93 drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
d36cabb0b551 drm/i915/xe3p_lpd: Handle underrun debug bits
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/all/20251015-xe3p_lpd-basic-enabling-v1-12-d2d1e26520aa@intel.com/

total: 0 errors, 1 warnings, 0 checks, 247 lines checked
6533c20dbf26 drm/i915/nvls: Add NVL-S display support
b1e673225c02 drm/i915/display: Use platform check in HAS_LT_PHY()
ef8bee4c0ae4 drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
d5d6d7f67ab8 drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power


