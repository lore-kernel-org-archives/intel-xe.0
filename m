Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74465C2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 12:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2734510E674;
	Tue, 18 Jun 2024 12:57:39 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BB210E674;
 Tue, 18 Jun 2024 12:57:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/i915=3A_Move_encoder_suspend/shutdown_helpers_to_i?=
 =?utf-8?q?ntel=5Fencoder=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 12:57:38 -0000
Message-ID: <171871545849.103670.12897238374750057172@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618125255.4080303-1-imre.deak@intel.com>
In-Reply-To: <20240618125255.4080303-1-imre.deak@intel.com>
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

Series: series starting with [v2,1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
URL   : https://patchwork.freedesktop.org/series/135013/
State : success

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
commit 891f433a485ee154631fa6d29415d75e6da2a31a
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Jun 18 15:52:55 2024 +0300

    drm/xe: Use the encoder suspend helper also used by the i915 driver
    
    Use the suspend encoders helper which is also used by the i915 driver.
    This fixes an issue in the xe driver where the encoder
    suspend_complete() hook is not called and was an overlook when this hook
    was added in commit b61fad5f7e5d ("drm/i915/tc: Call TypeC port
    flush_work/cleanup without modeset locks held") for i915, but not added
    to the xe driver (which was still in a separate source tree at the above
    point).
    
    v2: Fix checkpatch warn in commit log. (Rodrigo)
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 5a093f17293ae50283f19372263a7595ed50bc34 drm-intel
0464f9a60fd4 drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
e38f721c7d75 drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
891f433a485e drm/xe: Use the encoder suspend helper also used by the i915 driver


