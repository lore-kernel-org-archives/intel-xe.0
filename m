Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596CCEACCE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AEF10EB2D;
	Fri, 14 Nov 2025 21:09:34 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696EA10EB2D;
 Fri, 14 Nov 2025 21:09:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_i?=
 =?utf-8?q?nitial_support_for_Xe3p=5FLPD_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 21:09:33 -0000
Message-ID: <176315457342.55609.17737404135766667169@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114-xe3p_lpd-basic-enabling-v5-0-c183388367f4@intel.com>
In-Reply-To: <20251114-xe3p_lpd-basic-enabling-v5-0-c183388367f4@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD (rev5)
URL   : https://patchwork.freedesktop.org/series/155951/
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
commit 1a6e55fa201c4ad354455b1a134db303070183d3
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Nov 14 17:52:15 2025 -0300

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
+ /mt/dim checkpatch 0602386d452aeaa5f0abadb7d2805ea45f97d9f6 drm-intel
e7385f79870c drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
7a2251517b90 drm/i915/power: Use intel_encoder_is_tc()
5f488a7e9658 drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
244a52dbff2f drm/i915/xe3p_lpd: Handle underrun debug bits
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
[1] https://lore.kernel.org/all/20251015-xe3p_lpd-basic-enabling-v1-12-d2d1e26520aa@intel.com/

total: 0 errors, 1 warnings, 0 checks, 253 lines checked
d0702dbc676e drm/i915/nvls: Add NVL-S display support
41438d575930 drm/i915/display: Use platform check in HAS_LT_PHY()
c7ac7aa8a149 drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
1a6e55fa201c drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power


