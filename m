Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0EC3DA70
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 19:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76E10E3D1;
	Mon, 29 Jul 2024 19:38:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619D10E471;
 Mon, 29 Jul 2024 19:38:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Fix_possible_?=
 =?utf-8?q?int_overflow_in_skl=5Fddi=5Fcalculate=5Fwrpll=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 19:38:27 -0000
Message-ID: <172228190787.425931.7599532236362054128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729174035.25727-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240729174035.25727-1-n.zhandarovich@fintech.ru>
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

Series: drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll() (rev2)
URL   : https://patchwork.freedesktop.org/series/136513/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d935c3ef1f8ebba5876ba7dc55c9e1509a6af06d
Author: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Date:   Mon Jul 29 10:40:35 2024 -0700

    drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
    
    On the off chance that clock value ends up being too high (by means
    of skl_ddi_calculate_wrpll() having benn called with big enough
    value of crtc_state->port_clock * 1000), one possible consequence
    may be that the result will not be able to fit into signed int.
    
    Fix this issue by moving conversion of clock parameter from kHz to Hz
    into the body of skl_ddi_calculate_wrpll(), as well as casting the
    same parameter to u64 type while calculating the value for AFE clock.
    This both mitigates the overflow problem and avoids possible erroneous
    integer promotion mishaps.
    
    Found by Linux Verification Center (linuxtesting.org) with static
    analysis tool SVACE.
    
    Fixes: fe70b262e781 ("drm/i915: Move a bunch of stuff into rodata from the stack")
    Cc: stable@vger.kernel.org
    Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
+ /mt/dim checkpatch e64cee35967e4b08dd7f3b3ad6f110927c4699a9 drm-intel
d935c3ef1f8e drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()


