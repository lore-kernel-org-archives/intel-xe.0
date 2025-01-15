Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6F3C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 17:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C610E032;
	Wed, 15 Jan 2025 17:26:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE710E032;
 Wed, 15 Jan 2025 17:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Add_s?=
 =?utf-8?q?kip_link_check_quirk_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Denose" <jdenose@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 17:26:07 -0000
Message-ID: <173696196709.4026114.4357939415156674543@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
In-Reply-To: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
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

Series: drm/i915/display: Add skip link check quirk (rev2)
URL   : https://patchwork.freedesktop.org/series/143563/
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
commit 30c01be42017eb58e1af595561162d82b976c0f9
Author: Jonathan Denose <jdenose@google.com>
Date:   Tue Jan 14 19:07:11 2025 +0000

    drm/i915/display: Add skip link check quirk
    
    The display on the Advantech UTC124G3PWWW0E-ES worked fine until commit
    "drm/i915/dp: Recheck link state after modeset" was introduced. After
    this commit the display flickers intermittently as the driver code
    initiates the delayed link recheck in an infinite loop.
    
    To resolve this issue for the Advantech device, add a quirk to skip over
    the delayed link recheck.
    
    Signed-off-by: Jonathan Denose <jdenose@google.com>
+ /mt/dim checkpatch f28dfb722dce66482e5d1741deae312d96c29ee0 drm-intel
30c01be42017 drm/i915/display: Add skip link check quirk


