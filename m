Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DCEC25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B68210E303;
	Mon,  3 Jun 2024 08:12:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185AF10E303;
 Mon,  3 Jun 2024 08:11:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_use_non-posted_?=
 =?utf-8?q?writes_for_user_fence_signalling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Jun 2024 08:11:59 -0000
Message-ID: <171740231909.2261151.9873882044635413880@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com>
In-Reply-To: <20240603-fix_user_fence_posted-v1-1-61c76ef69cea@intel.com>
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

Series: drm/xe: use non-posted writes for user fence signalling
URL   : https://patchwork.freedesktop.org/series/134354/
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
commit d3f58a2d04ceb799b4f9cd70f6cb8cac076c4ca5
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Mon Jun 3 10:06:20 2024 +0200

    drm/xe: use non-posted writes for user fence signalling
    
    Moving flush before user fence signalling fixes issue with prior writes not
    visible when fence is signalled. The change, however, should be also
    accompanied with updating signalling to non-posted write, there is no
    need for flush, as writes are coherent with CPU cache.
    
    Fixes: 38007fa96419 ("drm/xe: flush gtt before signalling user fence on all engines")
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch dbdf6d2379c9a06795be8de282afeaa3b2a06315 drm-intel
d3f58a2d04ce drm/xe: use non-posted writes for user fence signalling


