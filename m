Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7EC36005
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 21:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686E410E4C8;
	Mon, 24 Mar 2025 21:11:57 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAC210E367;
 Mon, 24 Mar 2025 21:11:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_avoid_plain_64-?=
 =?utf-8?q?bit_division?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 21:11:57 -0000
Message-ID: <174285071712.75091.10016406639993236346@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324210612.2927194-1-arnd@kernel.org>
In-Reply-To: <20250324210612.2927194-1-arnd@kernel.org>
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

Series: drm/xe: avoid plain 64-bit division
URL   : https://patchwork.freedesktop.org/series/146689/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 15079da233a627d1e37adccffc17ab1ec4d66535
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Mar 24 22:06:02 2025 +0100

    drm/xe: avoid plain 64-bit division
    
    Building the xe driver for i386 results in a link time warning:
    
    x86_64-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
    xe_migrate.c:(.text+0x1e15): undefined reference to `__udivdi3'
    
    Avoid this by using DIV_U64_ROUND_UP() instead of DIV_ROUND_UP().  The driver
    is unlikely to be used on 32=bit hardware, so the extra cost here is not
    too important.
    
    Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c drm-intel
15079da233a6 drm/xe: avoid plain 64-bit division
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
x86_64-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


