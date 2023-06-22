Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0FEEB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 10:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A6210E524;
	Thu, 22 Jun 2023 10:23:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3CCA10E53E;
 Thu, 22 Jun 2023 10:23:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B0E88AADE8;
 Thu, 22 Jun 2023 10:23:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 22 Jun 2023 10:23:50 -0000
Message-ID: <168742943072.4872.4457054774561547369@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/ttm=3A_Fixes_around_resources_and_bulk_moves?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/ttm: Fixes around resources and bulk moves
URL   : https://patchwork.freedesktop.org/series/119741/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 71a73fb2d450788f977b054b158d9fd4930e17ec
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Jun 22 12:14:12 2023 +0200

    drm/ttm: Don't leak a resource on swapout move error
    
    If moving the bo to system for swapout failed, we were leaking
    a resource. Fix.
    
    Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
    Cc: Christian König <christian.koenig@amd.com>
    Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v5.14+
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch bf01ddde17686463166a5006a6521f71c3df771a drm-intel
ed847cbe9 drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
-:13: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#13: 
<3> [218.963342] BUG: KASAN: null-ptr-deref in ttm_lru_bulk_move_del+0xc5/0x180 [ttm]

-:63: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fee2ede15542', maybe rebased or not pulled?
#63: 
Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")

total: 0 errors, 2 warnings, 0 checks, 8 lines checked
d84b73d30 drm/ttm: Don't shadow the operation context
-:19: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dc947770cf34', maybe rebased or not pulled?
#19: 
Fixes: dc947770cf34 ("drm/ttm: enable swapout for reserved BOs during allocation")

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
561eafa19 drm/ttm: Don't leak a resource on eviction error
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '403797925768', maybe rebased or not pulled?
#12: 
Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
71a73fb2d drm/ttm: Don't leak a resource on swapout move error
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bfa3357ef9ab', maybe rebased or not pulled?
#12: 
Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


