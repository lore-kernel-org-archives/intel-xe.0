Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70932C3ABAA
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 03:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391EC10E24D;
	Mon,  5 May 2025 03:57:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2AE10E24D;
 Mon,  5 May 2025 03:57:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Program_E?=
 =?utf-8?q?MP=5FAS=5FSDP=5FTL_for_DP_AS_SDP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 May 2025 03:57:20 -0000
Message-ID: <174641744062.43504.15257556232806668158@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505033911.393628-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250505033911.393628-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP (rev2)
URL   : https://patchwork.freedesktop.org/series/148422/
State : warning

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
commit 1d5d35424cf8f88894524144f2960452c7dc754e
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Mon May 5 09:09:11 2025 +0530

    drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
    
    The register EMP_AS_SDP_TL (MTL) was introduced for configuring the
    double buffering point and transmission line for all
    HDMI2.1 Extended Metadata Packets (VT-EMP for VRR, CVT-EMP for DSC etc).
    This was also intended to be configured for DP to HDMI2.1 PCON to
    support VRR.
    
    From BMG and LNL+ onwards, this register was extended to Display Port
    Adaptive Sync SDP to have a common register to configure double
    buffering point and transmission line for both HDMI EMPs and DP VRR related
    packets.
    
    Currently, we do not support VRR for either native HDMI or via PCON.
    However we need to configure this for DP SDP case. As per the spec,
    program the register to set Vsync start as the double buffering point
    for DP AS SDP.
    
    v2:
    -Make the helper more readable. (Jani)
    -Add more information in commit message and comment.
    
    Bspec:70984, 71197
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Tested-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 9c8c2c903387f43ed1e34e2c5f9ca7bd0201f115 drm-intel
1d5d35424cf8 drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
-:93: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#93: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:115:
+#define EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))

total: 0 errors, 1 warnings, 0 checks, 53 lines checked


