Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00FC606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 18:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9674B10EC88;
	Wed, 18 Nov 2026 18:37:44 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8310EC29;
 Wed, 18 Nov 2026 18:37:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-buf=3A_dma-fence=3A_R?=
 =?utf-8?q?emove_dma=5Ffence=5Finit64=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 18:37:44 -0000
Message-ID: <179502706403.46043.14799891602500340501@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118134522.1646892-2-phasta@kernel.org>
In-Reply-To: <20261118134522.1646892-2-phasta@kernel.org>
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

Series: dma-buf: dma-fence: Remove dma_fence_init64() (rev2)
URL   : https://patchwork.freedesktop.org/series/177858/
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
commit 415b801cd5dbf17ab9c06dc6171a54fafc953d8f
Author: Philipp Stanner <phasta@kernel.org>
Date:   Wed Nov 18 14:45:23 2026 +0100

    dma-buf: dma-fence: Remove dma_fence_init64()
    
    All users of dma_fence_init64() have been removed. They now use the
    respective initialization flag in dma_fence_init().
    
    Remove dma_fence_init64().
    
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
    Reviewed-by: Timur Kristóf <timur.kristof@gmail.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch 6d6b6ed3d20eb8db677d6463fd2f267fc29cd510 drm-intel
c67e8feb5bec dma-buf: dma-fence: Add flags parameter to dma_fence_init()
-:61: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#61: FILE: drivers/accel/ivpu/ivpu_job.c:522:
+	dma_fence_init(&fence->base, &ivpu_fence_ops, &fence->lock, dma_fence_context_alloc(1), 1, 0);

-:122: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#122: FILE: drivers/dma-buf/dma-fence.c:1095:
+		GENMASK(

-:123: CHECK:SPACING: No space is necessary after a cast
#123: FILE: drivers/dma-buf/dma-fence.c:1096:
+			BITS_PER_TYPE(unsigned long) - 1,

total: 0 errors, 1 warnings, 2 checks, 469 lines checked
be6e51836d66 dma-buf: Port users of dma_fence_init64()
415b801cd5db dma-buf: dma-fence: Remove dma_fence_init64()


