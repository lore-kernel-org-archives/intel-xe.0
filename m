Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF29ECE587
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 20:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9410E69E;
	Mon,  9 Sep 2024 20:31:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F2310E69E;
 Mon,  9 Sep 2024 20:31:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_fix_build_warni?=
 =?utf-8?q?ng_with_CONFIG=5FPM=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 20:31:08 -0000
Message-ID: <172591386855.977796.17016153418747579549@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909202521.1018439-1-arnd@kernel.org>
In-Reply-To: <20240909202521.1018439-1-arnd@kernel.org>
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

Series: drm/xe: fix build warning with CONFIG_PM=n
URL   : https://patchwork.freedesktop.org/series/138430/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 23e607f4a3fc2e794593b7fe682edd12ba5e8258
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Sep 9 20:25:08 2024 +0000

    drm/xe: fix build warning with CONFIG_PM=n
    
    The 'runtime_status' field is an implementation detail of the
    power management code, so a device driver should not normally
    touch this:
    
    drivers/gpu/drm/xe/xe_pm.c: In function 'xe_pm_suspending_or_resuming':
    drivers/gpu/drm/xe/xe_pm.c:606:26: error: 'struct dev_pm_info' has no member named 'runtime_status'
      606 |         return dev->power.runtime_status == RPM_SUSPENDING ||
          |                          ^
    drivers/gpu/drm/xe/xe_pm.c:607:27: error: 'struct dev_pm_info' has no member named 'runtime_status'
      607 |                 dev->power.runtime_status == RPM_RESUMING;
          |                           ^
    drivers/gpu/drm/xe/xe_pm.c:608:1: error: control reaches end of non-void function [-Werror=return-type]
    
    Add an #ifdef check to avoid the build regression.
    
    Fixes: cb85e39dc5d1 ("drm/xe: Suppress missing outer rpm protection warning")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch bd6c4b2266ebc908d55e8ec3f419b832ebdc3945 drm-intel
23e607f4a3fc drm/xe: fix build warning with CONFIG_PM=n


