Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B24FC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 17:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61110E477;
	Mon, 17 Jun 2024 17:30:23 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF210E477;
 Mon, 17 Jun 2024 17:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/i915=3A_Move_encoder_suspend/shutdown_helpers_to_intel?=
 =?utf-8?q?=5Fencoder=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 17:30:22 -0000
Message-ID: <171864542200.97967.14812099156779472555@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617170356.4000251-1-imre.deak@intel.com>
In-Reply-To: <20240617170356.4000251-1-imre.deak@intel.com>
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

Series: series starting with [1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
URL   : https://patchwork.freedesktop.org/series/134965/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9a8b7e17388f56ec993c534363e6e677c19d5a5
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Jun 17 20:03:56 2024 +0300

    drm/xe: Use the encoder suspend helper also used by the i915 driver
    
    Use the suspend encoders helper which is also used by the i915 driver.
    This fixes an issue in the xe driver where the encoder
    suspend_complete() hook is not called and was an overlook when this hook
    was added in
    
    Commit b61fad5f7e5d ("drm/i915/tc: Call TypeC port flush_work/cleanup without modeset locks held")
    
    for i915, but not added to the xe driver (which was still in a separate
    source tree at the above point).
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 3b4eab7e82c7a1429e257890553ad571f320b8a3 drm-intel
6835e4bd9893 drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
1d88c3b76172 drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
b9a8b7e17388 drm/xe: Use the encoder suspend helper also used by the i915 driver
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
Commit b61fad5f7e5d ("drm/i915/tc: Call TypeC port flush_work/cleanup without modeset locks held")

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


