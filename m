Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D1FC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 20:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8A010EB94;
	Tue,  4 Aug 2026 20:13:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D8510E881;
 Tue,  4 Aug 2026 20:13:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Add_q?=
 =?utf-8?q?uirk_to_force_backlight_type_on_some_TUXEDO_devices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Werner Sembach" <wse@tuxedocomputers.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 20:13:02 -0000
Message-ID: <178587438234.19128.3769329050033522035@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804200021.171947-1-wse@tuxedocomputers.com>
In-Reply-To: <20260804200021.171947-1-wse@tuxedocomputers.com>
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

Series: drm/i915/display: Add quirk to force backlight type on some TUXEDO devices (rev3)
URL   : https://patchwork.freedesktop.org/series/147702/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e9ab20e86d116f48c4bb43734a1edb2e0a214068
Author: Werner Sembach <wse@tuxedocomputers.com>
Date:   Tue Aug 4 21:52:47 2026 +0200

    drm/i915/display: Add quirk to force backlight type on some TUXEDO devices
    
    The display backlight on TUXEDO DX1708 and InsanityBook 15 v1 with panels
    AUO 12701 and AUO 12701 must be forced to INTEL_DP_AUX_BACKLIGHT_ON to be
    able to control the brightness.
    
    This could already be archived via a module parameter, but this patch adds
    a quirk to apply this by default on the mentioned devices.
    
    This patch does not actually test for the exact panels as the id that is
    used in the intel_dpcd_quirks list is sadly zeroed on the devices, but
    afaik all these devices use try_intel_interface first anyway so all the
    quirk does is to add the fallback to try_vesa_interface, so the behaviour
    on the devices not needing the quirk and fallback should functionally stay
    the same.
    
    Cc: stable@vger.kernel.org
    Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
+ /mt/dim checkpatch 814bd7de7f09446c4b9401eecb8b30c3285af78b drm-intel
e9ab20e86d11 drm/i915/display: Add quirk to force backlight type on some TUXEDO devices
-:108: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 68 lines checked


