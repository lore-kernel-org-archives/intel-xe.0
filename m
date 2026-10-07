Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2977CA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 09:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DA310E308;
	Wed,  7 Oct 2026 09:17:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7D10E308;
 Wed,  7 Oct 2026 09:17:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_ASYNC=5FV?=
 =?utf-8?q?IDEO=5FTIMING=5FNOT=5FSUPPORTED=5FIN=5FPR_not_valid_for_eDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 09:17:24 -0000
Message-ID: <179136464447.247153.10940136356301422164@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007083443.647649-1-jouni.hogander@intel.com>
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not valid for eDP
URL   : https://patchwork.freedesktop.org/series/175653/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 159ec601b23dda9dc5824fa71ddb1a16f27aa293
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Oct 7 11:34:43 2026 +0300

    drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not valid for eDP
    
    EDP1.5 specification says:
    
    "Although defined for the PR function in DP Standard, the
    ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR and DSC_DECODE_NOT_SUPPORTED_IN_PR
    bits (DPCD 000B1h[3, 2], respectively) are DP-specific and are therefore
    not used in eDP."
    
    Stop using SYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR on eDP.
    
    Cc: Jake Steinman <j@metarealtyinc.ca>
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch daeb062fc40f727fafefed080c6d12a5ad1d0d12 drm-intel
159ec601b23d drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not valid for eDP
-:35: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_psr.c:1704:
+		!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


