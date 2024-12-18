Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CDFE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 03:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1ED10E64D;
	Wed, 18 Dec 2024 03:06:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CA410E64D;
 Wed, 18 Dec 2024 03:05:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pm=3A_Also_avoid_m?=
 =?utf-8?q?issing_outer_rpm_warning_on_system_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 03:05:59 -0000
Message-ID: <173449115998.4093921.12132248274281603711@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/pm: Also avoid missing outer rpm warning on system suspend
URL   : https://patchwork.freedesktop.org/series/142758/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ee0dd877ac294df7527a42d59fb5b262097fff06
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Dec 17 18:05:47 2024 -0500

    drm/xe/pm: Also avoid missing outer rpm warning on system suspend
    
    We have some cases where display is releasing power domains at
    release_async_put_domains() where intel_runtime_pm_get_noresume()
    is called, but no outer protection. In Xe this will trigger our
    traditional warning. However, this case should be safe because
    it is triggered from the system suspend path, where we certainly
    won't be transitioning to rpm suspend.
    
    This wouldn't happen if the display pm sequences, including
    all irq flow was in sync between i915 and xe. So, while we
    don't get there, let's not raise warnings when we are in this
    system suspend path.
    
    Suggested-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 69607bbcaccc29ae254d974a5e547d873e7c0ac0 drm-intel
ee0dd877ac29 drm/xe/pm: Also avoid missing outer rpm warning on system suspend


