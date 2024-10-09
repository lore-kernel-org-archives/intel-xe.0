Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34987CEE339
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87E910E15C;
	Wed,  9 Oct 2024 18:08:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0AB10E15C;
 Wed,  9 Oct 2024 18:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Don?=
 =?utf-8?q?=27t_allow_tile4_framebuffer_to_do_hflip_on_display20_or_greater_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 18:08:55 -0000
Message-ID: <172849733550.1211513.9778851572853489786@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
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

Series: drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater (rev2)
URL   : https://patchwork.freedesktop.org/series/139665/
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
commit 4dc5787f5635a22102ca96ed0821dc47dd16acda
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon Oct 7 21:28:41 2024 +0300

    drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater
    
    On display ver 20 onwards tile4 is not supported with horizontal flip
    
    Bspec: 69853
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch 5ac8672cc80fd6228fbdcee22771f9f86b811eef drm-intel
4dc5787f5635 drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater


