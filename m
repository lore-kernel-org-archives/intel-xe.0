Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A1DC48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 21:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77010E2CB;
	Tue, 20 Feb 2024 21:54:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029B10E567;
 Tue, 20 Feb 2024 21:54:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drivers/i915/intel=5Fbios?=
 =?utf-8?q?=3A_Fix_parsing_backlight_BDB_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthikeyan Ramasubramanian" <kramasub@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 21:54:24 -0000
Message-ID: <170846606400.132386.1629741165388159512@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220141256.v1.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
In-Reply-To: <20240220141256.v1.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
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

Series: drivers/i915/intel_bios: Fix parsing backlight BDB data
URL   : https://patchwork.freedesktop.org/series/130153/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0e2d10f2e1f56f80dbe5c1245758d8e0629ed68d
Author: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Date:   Tue Feb 20 14:12:57 2024 -0700

    drivers/i915/intel_bios: Fix parsing backlight BDB data
    
    Starting BDB version 239, hdr_dpcd_refresh_timeout is introduced to
    backlight BDB data. Commit 700034566d68 ("drm/i915/bios: Define more BDB
    contents") updated the backlight BDB data accordingly. This broke the
    parsing of backlight BDB data in VBT for versions 236 - 238 (both
    inclusive) and hence the backlight controls are not responding on units
    with the concerned BDB version.
    
    backlight_control information has been present in backlight BDB data
    from at least BDB version 191 onwards, if not before. Hence this patch
    extracts the backlight_control information if the block size of
    backlight BDB is >= version 191 backlight BDB block size.
    Tested on Chromebooks using Jasperlake SoC (reports bdb->version = 236).
    Tested on Chromebooks using Raptorlake SoC (reports bdb->version = 251).
    
    Fixes: 700034566d68 ("drm/i915/bios: Define more BDB contents")
    Cc: stable@vger.kernel.org
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
+ /mt/dim checkpatch 52e6f4fe13d7b1f498009a367c6ce19466f167cc drm-intel
0e2d10f2e1f5 drivers/i915/intel_bios: Fix parsing backlight BDB data


