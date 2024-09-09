Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125B2ECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 14:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631E10E59A;
	Mon,  9 Sep 2024 14:08:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3EE10E59A;
 Mon,  9 Sep 2024 14:08:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cx0=3A_Use_one_l?=
 =?utf-8?q?ane_to_set_power_state_to_ready_in_DP_alt_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vamsi Krishna Brahmajosyula" <vamsikrishna.brahmajosyula@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 14:08:54 -0000
Message-ID: <172589093496.976496.4709023453683233152@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906174601.9271-1-vamsikrishna.brahmajosyula@gmail.com>
In-Reply-To: <20240906174601.9271-1-vamsikrishna.brahmajosyula@gmail.com>
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

Series: drm/i915/cx0: Use one lane to set power state to ready in DP alt mode
URL   : https://patchwork.freedesktop.org/series/138412/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c7d68bf966d9b1dafef86c384b5f2a8277f7e3a9
Author: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date:   Fri Sep 6 23:16:01 2024 +0530

    drm/i915/cx0: Use one lane to set power state to ready in DP alt mode
    
    In DP alt mode one lane is owned by display and the other by usb
    intel_cx0pll_enable currently performs a power cycle ready on both
    the lanes in all cases.
    
    Address the todo to perfom power state ready only on the display lane
    when DP alt mode is enabled.
    
    Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.
    
    Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
+ /mt/dim checkpatch 36d222030253864ce07e73f27f631db5112d32c6 drm-intel
c7d68bf966d9 drm/i915/cx0: Use one lane to set power state to ready in DP alt mode
-:32: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#32: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2956:
+		intel_cx0_powerdown_change_sequence(encoder, maxpclk_lane,
+					    CX0_P2_STATE_READY);

-:35: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/i915/display/intel_cx0_phy.c:2959:
+		intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES,
 					    CX0_P2_STATE_READY);

total: 0 errors, 0 warnings, 2 checks, 15 lines checked


