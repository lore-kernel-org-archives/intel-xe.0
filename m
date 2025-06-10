Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC1C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 11:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8052F10E50A;
	Tue, 10 Jun 2025 11:10:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7510E4EF;
 Tue, 10 Jun 2025 11:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_kernel_param_to_limit?=
 =?utf-8?q?_the_eDP_rate_to_HBR2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 11:10:24 -0000
Message-ID: <174955382477.63627.14539444955511559211@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610100449.185927-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250610100449.185927-1-ankit.k.nautiyal@intel.com>
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

Series: Add kernel param to limit the eDP rate to HBR2
URL   : https://patchwork.freedesktop.org/series/150031/
State : success

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
commit aceed4f4a969dd9ad9d907aa56d1959b255d2dea
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Tue Jun 10 15:34:49 2025 +0530

    drm/i915/dp: Add kernel param to limit eDP rate to HBR2"
    
    Some ICL/TGL platforms with combo PHY ports can theoretically support HBR3,
    but in practice, signal integrity issues may prevent stable operation.
    While some systems include a Parade PS8461 mux chip to mitigate jitter and
    enable HBR3, there is no reliable way to detect its presence.
    Additionally, many systems have broken or missing VBT entries, making it
    unsafe to rely on VBT for link rate limits.
    
    To address this, introduce a new kernel parameter `limit_edp_hbr2`.
    When set, this parameter forces the eDP link rate to be capped at
    HBR2 (540000 kHz), overriding any higher advertised rates from the sink or
    DPCD. By default, the higher rates will be allowed, i.e. the parameter
    will be set to false.
    
    This provides a manual override for users and OEMs to limit the rate to
    HBR2, where output with HBR3 is unstable.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 52ecbb6a68785860c776b29f58792d9807243979 drm-intel
0b495f0b0920 Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
aceed4f4a969 drm/i915/dp: Add kernel param to limit eDP rate to HBR2"


