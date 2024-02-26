Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E60EC5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 20:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2DC10E802;
	Mon, 26 Feb 2024 20:43:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15410E803;
 Mon, 26 Feb 2024 20:43:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Disab?=
 =?utf-8?q?le_AuxCCS_framebuffers_if_built_for_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 20:43:17 -0000
Message-ID: <170898019763.318338.13328929156594986557@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226203651.818678-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240226203651.818678-1-juhapekka.heikkila@gmail.com>
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

Series: drm/i915/display: Disable AuxCCS framebuffers if built for Xe
URL   : https://patchwork.freedesktop.org/series/130400/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0c154c094f54266ae5de84733202d44dc09fb988
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad622ad6c105a80a0a4f54444516f7d0fe17088c
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon Feb 26 22:36:51 2024 +0200

    drm/i915/display: Disable AuxCCS framebuffers if built for Xe
    
    AuxCCS framebuffers don't work on Xe driver hence disable them
    from plane capabilities until they are fixed. FlatCCS framebuffers
    work and they are left enabled. CCS is left untouched for i915
    driver.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/933
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch c815c7fa9257eb8ff4433c43058dd292b16347eb drm-intel
ad622ad6c105 drm/i915/display: Disable AuxCCS framebuffers if built for Xe


