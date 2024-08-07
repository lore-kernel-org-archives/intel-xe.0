Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2350DC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 19:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541B10E5B3;
	Wed,  7 Aug 2024 19:53:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ED410E5AF;
 Wed,  7 Aug 2024 19:53:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Fix_NULL_ptr_?=
 =?utf-8?q?deref_in_intel=5Fasync=5Fflip=5Fcheck=5Fuapi=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ma Ke" <make24@iscas.ac.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 19:53:53 -0000
Message-ID: <172306043373.547558.14855717944162379507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806092249.2407555-1-make24@iscas.ac.cn>
In-Reply-To: <20240806092249.2407555-1-make24@iscas.ac.cn>
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

Series: drm/i915: Fix NULL ptr deref in intel_async_flip_check_uapi()
URL   : https://patchwork.freedesktop.org/series/137006/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5c76eedfabbbe1d3069dab8e983d474ad3e886e
Author: Ma Ke <make24@iscas.ac.cn>
Date:   Tue Aug 6 17:22:49 2024 +0800

    drm/i915: Fix NULL ptr deref in intel_async_flip_check_uapi()
    
    intel_atomic_get_new_crtc_state can return NULL, unless crtc state wasn't
    obtained previously with intel_atomic_get_crtc_state. We should check it
    for NULLness here, just as in many other places, where we can't guarantee
    that intel_atomic_get_crtc_state was called.
    
    Cc: stable@vger.kernel.org
    Fixes: b0b2bed2a130 ("drm/i915: Check async flip capability early on")
    Signed-off-by: Ma Ke <make24@iscas.ac.cn>
+ /mt/dim checkpatch 4f5d551409fb5562ab0d732120e7ac9b698b5864 drm-intel
a5c76eedfabb drm/i915: Fix NULL ptr deref in intel_async_flip_check_uapi()


