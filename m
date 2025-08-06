Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D8CC87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 13:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157AB10E0DA;
	Wed,  6 Aug 2025 13:59:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD110E0DA;
 Wed,  6 Aug 2025 13:58:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_WIP_limit_the_?=
 =?utf-8?q?TTM_pool_to_32bit_CPUs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 13:58:59 -0000
Message-ID: <175448873905.216502.6766612682447357463@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806132838.1831-1-christian.koenig@amd.com>
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>
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

Series: drm/ttm: WIP limit the TTM pool to 32bit CPUs
URL   : https://patchwork.freedesktop.org/series/152588/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6fd3754e5533e725f9e19b96f5f30524ca8858f5
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Wed Aug 6 15:28:38 2025 +0200

    drm/ttm: WIP limit the TTM pool to 32bit CPUs
    
    On some old x86 systems we had the problem that changing the caching flags
    of system memory requires changing the global MTRR/PAT tables.
    
    But on any modern x86 system (CPUs introduced rughly after 2004) we
    actually don't need that any more and can update the caching flags
    directly in the PTEs of the CPU mapping. It was just never disabled
    because of the fear of regressions.
    
    We already use the PTE flags for encryption on x86 64bit for quite a while
    and all other supported platforms (Sparc, PowerPC, ARM, MIPS, LONGARCH)
    have never done anything different either.
    
    So disable the page pool completely for 64bit systems and just insert a
    clflush to be on the safe side so that we never return memory with dirty
    cache lines.
    
    Testing on a Ryzen 5 and 7 shows that this has absolutely no performance
    impact and of hand the AMD CI can't find a problem either.
    
    Let's see what the i915 and XE CI systems say to that.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 886b8d8ef3839f604e3e7f6187ac6c46eb21b802 drm-intel
6fd3754e5533 drm/ttm: WIP limit the TTM pool to 32bit CPUs
-:100: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


