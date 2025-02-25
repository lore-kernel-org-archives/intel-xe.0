Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75940C021BC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 12:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3910E669;
	Tue, 25 Feb 2025 12:20:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9CB10E669;
 Tue, 25 Feb 2025 12:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Fix_link_traini?=
 =?utf-8?q?ng_interrupted_by_HPD_pulse_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 12:20:21 -0000
Message-ID: <174048602156.1958123.8150361321153354327@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224193115.2058512-1-imre.deak@intel.com>
In-Reply-To: <20250224193115.2058512-1-imre.deak@intel.com>
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

Series: drm/dp: Fix link training interrupted by HPD pulse (rev3)
URL   : https://patchwork.freedesktop.org/series/145353/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a0016d88cd3ac1d0c614a26c506e1ef4333f228
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Feb 25 14:15:36 2025 +0200

    drm/i915/crt: Use intel_hpd_suspend/resume() instead of intel_hpd_disable/enable()
    
    intel_hpd_disable/enable() have the same purpose as
    intel_hpd_suspend/resume(), except that disable/enable will drop any HPD
    IRQs which were triggered while the HPD was disabled, while
    suspend/resume will handle such IRQs after the IRQ handling is resumed.
    Use intel_hpd_suspend/resume() for crt as well, by adding a helper to
    explicitly clear any pending IRQs before resuming.
    
    v2:
    - Handle encoders without a port assigned to them.
    - Rebase on change in intel_hpd_suspend() documentation.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch d5debc4841e604372c74ebda0bbf54bd527c3475 drm-intel
88f5fceb8913 drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
091e815af9be drm/i915/hpd: Add support for suspending the IRQ handling on an HPD pin
3c2f8a183612 drm/i915/dp: Fix link training interrupted by a short HPD pulse
add4364b37a0 drm/i915/dp: Queue a link check after link training is complete
9a0016d88cd3 drm/i915/crt: Use intel_hpd_suspend/resume() instead of intel_hpd_disable/enable()


