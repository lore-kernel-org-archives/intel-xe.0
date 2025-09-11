Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6F6CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 18:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C4310EB7B;
	Thu, 11 Sep 2025 18:54:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6044C10EB7B;
 Thu, 11 Sep 2025 18:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_rename_ttm=5Fb?=
 =?utf-8?q?o=5Fput_to_=5Ffini_v3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 18:54:22 -0000
Message-ID: <175761686239.326696.5767251794603046714@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911173909.66432-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250911173909.66432-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: rename ttm_bo_put to _fini v3
URL   : https://patchwork.freedesktop.org/series/154413/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 816b40bc52e4214d72d9806ec513c4473017c135
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Thu Sep 11 19:39:09 2025 +0200

    drm/ttm: rename ttm_bo_put to _fini v3
    
    Give TTM BOs a separate cleanup function.
    
    No funktional change, but the next step in removing the TTM BO reference
    counting and replacing it with the GEM object reference counting.
    
    v2: move the code around a bit to make it clearer what's happening
    v3: fix nouveau_bo_fini as well
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch a433a14cc397ef049ef273a3d4404d46a20a28cb drm-intel
816b40bc52e4 drm/ttm: rename ttm_bo_put to _fini v3
-:495: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 376 lines checked


