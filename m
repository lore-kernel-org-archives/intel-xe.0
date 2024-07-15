Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660DBC3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 19:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEDA10E4EF;
	Mon, 15 Jul 2024 19:37:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F8110E4EF;
 Mon, 15 Jul 2024 19:37:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/fbdev=3A_Limit_the?=
 =?utf-8?q?_usage_of_stolen_for_LNL+_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jul 2024 19:37:40 -0000
Message-ID: <172107226002.232888.1262515260789411900@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715190043.3775819-1-uma.shankar@intel.com>
In-Reply-To: <20240715190043.3775819-1-uma.shankar@intel.com>
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

Series: drm/xe/fbdev: Limit the usage of stolen for LNL+ (rev3)
URL   : https://patchwork.freedesktop.org/series/135970/
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
commit 1cf01bda7d64750db398ced2deae4957fee51e82
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Tue Jul 16 00:30:43 2024 +0530

    drm/xe/fbdev: Limit the usage of stolen for LNL+
    
    As per recommendation in the workarounds:
    WA_22019338487
    
    There is an issue with accessing Stolen memory pages due a
    hardware limitation. Limit the usage of stolen memory for
    fbdev for LNL+. Don't use BIOS FB from stolen on LNL+ and
    assign the same from system memory.
    
    v2: Corrected the WA Number, limited WA to LNL and
        Adopted XE_WA framework as suggested by Lucas and Matt.
    
    v3: Introduced the waxxx_display to avoid tipping on other WA.
        Used xe_root_mmio_gt and avoid the for loop.
        (Suggested by Lucas)
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
1cf01bda7d64 drm/xe/fbdev: Limit the usage of stolen for LNL+


