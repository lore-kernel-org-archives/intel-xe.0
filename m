Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB2CC021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 01:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB5310E0DE;
	Tue, 25 Feb 2025 01:54:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6746710E0DE;
 Tue, 25 Feb 2025 01:54:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Fix_link_traini?=
 =?utf-8?q?ng_interrupted_by_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 01:54:54 -0000
Message-ID: <174044849441.1795632.3923982601943374237@b555e5b46a47>
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

Series: drm/dp: Fix link training interrupted by HPD pulse
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
commit e269048125719d78e66bb40f9da7b97a5b44d00b
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Feb 24 21:31:15 2025 +0200

    drm/i915/crt: Use intel_hpd_suspend/resume() instead of intel_hpd_disable/enable()
    
    intel_hpd_disable/enable() have the same purpose as
    intel_hpd_suspend/resume(), except that disable/enable will drop any HPD
    IRQs which were triggered while the HPD was disabled, while
    suspend/resume will handle such IRQs after the IRQ handling is resumed.
    Use intel_hpd_suspend/resume() for crt as well, by adding a helper to
    explicitly clear any pending IRQs before resuming.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 9f112b86fd27ff7de2ce09718596cfefd71ee41f drm-intel
b4aaa7a5e746 drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
b7d0697f54bf drm/i915/hpd: Add support for suspending the IRQ handling on an HPD pin
bb30ebab2468 drm/i915/dp: Fix link training interrupted by a short HPD pulse
cfda20f33bc9 drm/i915/dp: Queue a link check after link training is complete
e26904812571 drm/i915/crt: Use intel_hpd_suspend/resume() instead of intel_hpd_disable/enable()


