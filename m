Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF80C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 14:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6E010E4AF;
	Tue, 29 Apr 2025 14:47:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B2610E4AF;
 Tue, 29 Apr 2025 14:47:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Program_E?=
 =?utf-8?q?MP=5FAS=5FSDP=5FTL_for_DP_AS_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 14:47:56 -0000
Message-ID: <174593807692.24868.16498162839702739204@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
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
commit 5eac4ff56517950a4c2e48c754ec817833dbb06b
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Apr 29 20:00:55 2025 +0530

    drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
    
    The register EMP_AS_SDP_TL (MTL) was introduced for configuring the
    double buffering point and transmission line for
    HDMI Video Timing Extended Metadata Packet (VTEMP) for VRR.
    This was also intended to be configured for DP to HDMI2.1 PCON to
    support VRR.
    
    From BMG and LNL+ onwards, this register was extended to Display Port
    Adaptive Sync SDP to have a common register to configure double
    buffering point and transmission line for both HDMI and DP VRR related
    packets.
    
    Currently, we do not support VRR for either native HDMI or via PCON.
    However we need to configure this for DP SDP case. As per the spec,
    program the register to set Vsync start as the double buffering point
    for DP AS SDP.
    
    Bspec:70984, 71197
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 3f6ff17a8fd279cbaaee052bbf54458ea1ebfc8f drm-intel
5eac4ff56517 drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
-:82: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#82: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:115:
+#define EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))

total: 0 errors, 1 warnings, 0 checks, 50 lines checked


