Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C793CD10F53
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 13:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CD89864;
	Wed, 26 Nov 2025 13:59:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B9F89864;
 Wed, 26 Nov 2025 13:59:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-fence=3A_Remove_retur?=
 =?utf-8?q?n_code_of_dma=5Ffence=5Fsignal=28=29_et_al=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 13:59:46 -0000
Message-ID: <176416558686.30433.11263006210256547369@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126131914.149445-2-phasta@kernel.org>
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
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

Series: dma-fence: Remove return code of dma_fence_signal() et al.
URL   : https://patchwork.freedesktop.org/series/158108/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ac37ad1a19b95593ec8ff82060b1f4788848acdc
Author: Philipp Stanner <phasta@kernel.org>
Date:   Wed Nov 26 14:19:15 2025 +0100

    dma-buf/dma-fence: Remove return code of signaling-functions
    
    All functions used for signaling a fence return an error code whose sole
    purpose is to tell whether a fence was already signaled.
    
    This is racy and has been used by almost no party in the kernel, and the
    few users have been removed in preceding cleanup commits.
    
    Turn all signaling-functions into void-functions.
    
    Suggested-by: Christian König <christian.koenig@amd.com>
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 drm-intel
7df9c2abae0c dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
39d81656a3cd amd/amdkfd: Ignore return code of dma_fence_signal()
94813ca99142 drm/gpu/xe: Ignore dma_fenc_signal() return code
54d0b5ed7342 dma-buf: Don't misuse dma_fence_signal()
584e5f0cd0dc drm/ttm: Remove return check of dma_fence_signal()
ac37ad1a19b9 dma-buf/dma-fence: Remove return code of signaling-functions
-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/dma-buf/dma-fence.c:363:
+void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp)

total: 0 errors, 0 warnings, 1 checks, 115 lines checked


