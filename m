Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57576606D822
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 14:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109B110F138;
	Thu,  5 Nov 2026 14:14:31 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39011245A;
 Thu,  5 Nov 2026 14:14:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-buf=3A_dma-fence=3A_R?=
 =?utf-8?q?emove_dma=5Ffence=5Finit64=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 14:14:30 -0000
Message-ID: <179388807049.125275.14387260464556521256@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105113529.1989375-2-phasta@kernel.org>
In-Reply-To: <20261105113529.1989375-2-phasta@kernel.org>
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

Series: dma-buf: dma-fence: Remove dma_fence_init64()
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
commit 803183dc66a6540c7670a1d1af5edf74c7411a9e
Author: Philipp Stanner <phasta@kernel.org>
Date:   Thu Nov 5 12:35:30 2026 +0100

    dma-buf: dma-fence: Remove dma_fence_init64()
    
    All users of dma_fence_init64() have been removed. They now use the
    respective initialization flag in dma_fence_init().
    
    Remove dma_fence_init64().
    
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 0e8b43b5a5ef2dd52c454158e7fd8a927d796eb4 drm-intel
f4f82e165c22 dma-buf: dma-fence: Add flags parameter to dma_fence_init()
-:56: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#56: FILE: drivers/accel/ivpu/ivpu_job.c:522:
+	dma_fence_init(&fence->base, &ivpu_fence_ops, &fence->lock, dma_fence_context_alloc(1), 1, 0);

-:125: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#125: FILE: drivers/dma-buf/dma-fence.c:1094:
+		GENMASK(

-:126: CHECK:SPACING: No space is necessary after a cast
#126: FILE: drivers/dma-buf/dma-fence.c:1095:
+			BITS_PER_TYPE(unsigned long) - 1,

total: 0 errors, 1 warnings, 2 checks, 476 lines checked
cf362d87ff17 dma-buf: Port users of dma_fence_init64()
803183dc66a6 dma-buf: dma-fence: Remove dma_fence_init64()


