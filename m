Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E99C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2410E885;
	Thu, 25 Jul 2024 15:48:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE3B10E885;
 Thu, 25 Jul 2024 15:48:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_64K_pages_on_Xe2_HPG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 15:48:50 -0000
Message-ID: <172192253012.382191.8935900582719615661@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725141916.3406757-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240725141916.3406757-1-juhapekka.heikkila@gmail.com>
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

Series: Use 64K pages on Xe2 HPG
URL   : https://patchwork.freedesktop.org/series/136503/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dbf510faaef0ff6883836ae6e5bad176e8bdb7c6
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Thu Jul 25 17:19:11 2024 +0300

    drm/xe/xe2: Separate graphics_xe2 features to hpg and lpg
    
    Separate graphics_xe2 to graphics_xe2hpg and graphics_xe2lpg. This is done to
    be able to add XE_VRAM_FLAGS_NEED64K for xe2hpg. Without 64K pages xe2hpg
    ccs decompression can result in corruption on display.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d drm-intel
dbf510faaef0 drm/xe/xe2: Separate graphics_xe2 features to hpg and lpg
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Separate graphics_xe2 to graphics_xe2hpg and graphics_xe2lpg. This is done to

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


