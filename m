Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17BFC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 16:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BD110E646;
	Tue,  4 Mar 2025 16:23:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAFC10E646;
 Tue,  4 Mar 2025 16:23:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_link_t?=
 =?utf-8?q?raining_interrupted_by_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 16:23:09 -0000
Message-ID: <174110538964.667674.5895593416677537522@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304152917.3407080-1-imre.deak@intel.com>
In-Reply-To: <20250304152917.3407080-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix link training interrupted by HPD pulse
URL   : https://patchwork.freedesktop.org/series/145781/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0e065e7fc7a503d5e87f2d2781c5e1fc719d16dd
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a7e16049d8ebe1b0a7d82583da1d2e1f4032cf7
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Mar 4 17:29:17 2025 +0200

    drm/i915/crt: Use intel_hpd_block/unblock() instead of intel_hpd_disable/enable()
    
    intel_hpd_disable/enable() have the same purpose as
    intel_hpd_block/unblock(), except that disable/enable will drop any HPD
    IRQs which were triggered while the HPD was disabled, while
    block/unblock will handle such IRQs after the IRQ handling is unblocked.
    Use intel_hpd_block/unblock() for crt as well, by adding a helper to
    explicitly clear any pending IRQs before unblocking.
    
    v2:
    - Handle encoders without a port assigned to them.
    - Rebase on change in intel_hpd_suspend() documentation.
    v3:
    - Rebase on the suspend/resume -> block/unblock rename change.
    - Clear the pending events only after all encoders have unblocked the
      HPD handling.
    - Clear the short/long port events for all encoders using the given HPD
      pin.
    v4:
    - Rebase on port->hpd_pin tracking. (Ville)
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 695fb2079be58348467d9b6469ac307d2600524a drm-intel
b3f24fb6c3d1 drm/i915/hpd: Track HPD pins instead of ports for HPD pulse events
ca02961db999 drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
cb92bef3b782 drm/i915/hpd: Add support for blocking the IRQ handling on an HPD pin
0ceaf94c400f drm/i915/dp: Fix link training interrupted by a short HPD pulse
789a8c2f2c4c drm/i915/dp: Queue a link check after link training is complete
9a7e16049d8e drm/i915/crt: Use intel_hpd_block/unblock() instead of intel_hpd_disable/enable()


