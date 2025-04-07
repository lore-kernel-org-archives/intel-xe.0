Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F57C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 14:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94FE10E485;
	Mon,  7 Apr 2025 14:18:24 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019110E490;
 Mon,  7 Apr 2025 14:18:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_add_CONFIG=5FMMU_d?=
 =?utf-8?q?ependency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 14:18:24 -0000
Message-ID: <174403550425.43715.17544113037973553971@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407104025.3421624-1-arnd@kernel.org>
In-Reply-To: <20250407104025.3421624-1-arnd@kernel.org>
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

Series: PCI: add CONFIG_MMU dependency
URL   : https://patchwork.freedesktop.org/series/147320/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ece10ccc7600416bc43daf2bc636fa61b185b0da
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Apr 7 12:38:14 2025 +0200

    PCI: add CONFIG_MMU dependency
    
    It turns out that there are no platforms that have PCI but don't have an MMU,
    so adding a Kconfig dependency on CONFIG_PCI simplifies build testing kernels
    for those platforms a lot, and avoids a lot of inadvertent build regressions.
    
    Add a dependency for CONFIG_PCI and remove all the ones for PCI specific
    device drivers that are currently marked not having it.
    
    Link: https://lore.kernel.org/lkml/a41f1b20-a76c-43d8-8c36-f12744327a54@app.fastmail.com/
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 100ba24787e877cd422caa7d08cb046ef4bb769c drm-intel
ece10ccc7600 PCI: add CONFIG_MMU dependency
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
It turns out that there are no platforms that have PCI but don't have an MMU,

total: 0 errors, 1 warnings, 0 checks, 183 lines checked


