Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CF6C83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 16:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3610E0A1;
	Wed, 16 Jul 2025 16:56:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9910E0A1;
 Wed, 16 Jul 2025 16:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_rename_ttm=5Fb?=
 =?utf-8?q?o=5Fput_to_=5Ffini_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 16:56:06 -0000
Message-ID: <175268496662.167626.5330370312078377246@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716121522.3340-1-christian.koenig@amd.com>
In-Reply-To: <20250716121522.3340-1-christian.koenig@amd.com>
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

Series: drm/ttm: rename ttm_bo_put to _fini v2
URL   : https://patchwork.freedesktop.org/series/151705/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f3ac6bba292a275ba0c7fff532f0271e0bf403b7
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Wed Jul 16 14:15:22 2025 +0200

    drm/ttm: rename ttm_bo_put to _fini v2
    
    Give TTM BOs a separate cleanup function.
    
    No funktional change, but the next step in removing the TTM BO reference
    counting and replacing it with the GEM object reference counting.
    
    v2: move the code around a bit to make it clearer what's happening
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 5c81898a2e97ccaed5067b1476f6a77321d057f9 drm-intel
f3ac6bba292a drm/ttm: rename ttm_bo_put to _fini v2
-:481: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 368 lines checked


