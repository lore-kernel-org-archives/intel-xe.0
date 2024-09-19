Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40261CE8D62
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97910E6BE;
	Thu, 19 Sep 2024 09:17:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343A410E6B6;
 Thu, 19 Sep 2024 09:17:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dma-buf/dma-fence=3A_Use_?=
 =?utf-8?q?a_successful_read=5Ftrylock=28=29_annotation_for_dma=5Ffence=5Fbe?=
 =?utf-8?q?gin=5Fsignalling=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 09:17:06 -0000
Message-ID: <172673742620.1038618.1239694018316854519@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
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

Series: dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling() (rev2)
URL   : https://patchwork.freedesktop.org/series/117113/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e79819345d5d38fe03a00bb1a69c012c2c842028
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Apr 28 14:52:32 2023 +0200

    dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling()
    
    Condsider the following call sequence:
    
    /* Upper layer */
    dma_fence_begin_signalling();
    lock(tainted_shared_lock);
    /* Driver callback */
    dma_fence_begin_signalling();
    ...
    
    The driver might here use a utility that is annotated as intended for the
    dma-fence signalling critical path. Now if the upper layer isn't correctly
    annotated yet for whatever reason, resulting in
    
    /* Upper layer */
    lock(tainted_shared_lock);
    /* Driver callback */
    dma_fence_begin_signalling();
    
    We will receive a false lockdep locking order violation notification from
    dma_fence_begin_signalling(). However entering a dma-fence signalling
    critical section itself doesn't block and could not cause a deadlock.
    
    So use a successful read_trylock() annotation instead for
    dma_fence_begin_signalling(). That will make sure that the locking order
    is correctly registered in the first case, and doesn't register any
    locking order in the second case.
    
    The alternative is of course to make sure that the "Upper layer" is always
    correctly annotated. But experience shows that's not easily achievable
    in all cases.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+ /mt/dim checkpatch 2a472f4478e3d55068ea419e79f691f3fa890d4b drm-intel
e79819345d5d dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling()


