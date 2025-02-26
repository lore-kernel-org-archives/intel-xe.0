Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C69C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 19:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8B10E9D1;
	Wed, 26 Feb 2025 19:23:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1340610E9D1;
 Wed, 26 Feb 2025 19:23:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Fix_link_traini?=
 =?utf-8?q?ng_interrupted_by_HPD_pulse_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 19:23:28 -0000
Message-ID: <174059780807.2431112.12628103340882318817@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226171924.2646997-1-imre.deak@intel.com>
In-Reply-To: <20250226171924.2646997-1-imre.deak@intel.com>
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

Series: drm/dp: Fix link training interrupted by HPD pulse (rev5)
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
commit 0430c7492928c454d468bcba642d814891345b02
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Feb 26 19:19:23 2025 +0200

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
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 59b653d829a07f1ccb21fee898efc32bcb3589ff drm-intel
9f3fed7a7de3 drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
35fd8d0e6369 drm/i915/hpd: Add support for blocking the IRQ handling on an HPD pin
d0735619d29d drm/i915/dp: Fix link training interrupted by a short HPD pulse
e54c322cfe32 drm/i915/dp: Queue a link check after link training is complete
0430c7492928 drm/i915/crt: Use intel_hpd_block/unblock() instead of intel_hpd_disable/enable()


