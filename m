Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F4606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 10:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24D210E034;
	Thu, 29 Oct 2026 10:07:07 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A752010E034;
 Thu, 29 Oct 2026 10:07:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-buf=3A_Phase_out_is?=
 =?utf-8?q?=5Fsignaled=28=29_race?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 10:07:06 -0000
Message-ID: <179326842668.86822.17373577482755014347@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029095542.1526750-3-phasta@kernel.org>
In-Reply-To: <20261029095542.1526750-3-phasta@kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: dma-buf: Phase out is_signaled() race
URL   : https://patchwork.freedesktop.org/series/177133/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 88534836660d3b7105ad5dc39278396c3b37af68
Author: Philipp Stanner <phasta@kernel.org>
Date:   Thu Oct 29 10:55:43 2026 +0100

    drm/nouveau: Remove hacky fence check
    
    nouveau_cli_work() contains a section where a dma_fence lock is manually
    taken and immediately released afterwards. This was added in
    
            commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
    
    as a bugfix because the function dma_fence_is_signaled() could return
    true while the fence was still signaling.
    
    The fix was later modified in
    
            commit a80d12eafad1 ("drm/nouveau: Simplify nouveau_cli_work")
    
    Luckily, the dma_fence backend now fully synchronizes
    dma_fence_is_signaled() with the spinlock. Thus, the check in nouveau is
    not necessary anymore.
    
    Remove the manual lock-unlock section.
    
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch da8074467a69dce9a0dd59602875f5c54874c92a drm-intel
f63e4084c4fb dma-buf: dma-fence: Add flags parameter to dma_fence_init()
-:53: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#53: FILE: drivers/accel/ivpu/ivpu_job.c:522:
+	dma_fence_init(&fence->base, &ivpu_fence_ops, &fence->lock, dma_fence_context_alloc(1), 1, 0);

-:675: CHECK:CAMELCASE: Avoid CamelCase: <DMA_FENCE_INIT_FLAG_NR_OF_FLAGs>
#675: FILE: include/linux/dma-fence.h:130:
+	DMA_FENCE_INIT_FLAG_NR_OF_FLAGs,

total: 0 errors, 1 warnings, 1 checks, 438 lines checked
af9af2f7c907 dma-buf: dma-fence: Add flag for using 64-bit seqnos
6aa932db0f69 dma-buf: Port users of dma_fence_init64()
e5eaa1ccb5ff dma-buf: dma-fence: remove dma_fence_init64()
8b15d5940aeb dma-buf: dma-fence: Close race in dma_fence_is_signaled() by default
88534836660d drm/nouveau: Remove hacky fence check


