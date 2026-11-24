Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35731606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E949210E080;
	Tue, 24 Nov 2026 00:57:18 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725DE10E080;
 Tue, 24 Nov 2026 00:57:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm/tests=3A_unblock_?=
 =?utf-8?q?Xe_CI_runs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 00:57:17 -0000
Message-ID: <179548183746.73146.14217376700491706086@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124004312.3880264-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261124004312.3880264-1-michal.grzelak@linux.intel.com>
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

Series: drm/ttm/tests: unblock Xe CI runs
URL   : https://patchwork.freedesktop.org/series/179420/
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
commit b130a1cf488a283ceea0e9fa12c48150a41876b1
Author: Michał Grzelak <michal.grzelak@linux.intel.com>
Date:   Tue Nov 24 01:43:12 2026 +0100

    drm/ttm/tests: do not count pages after pool's teardown
    
    Currently ttm_pool_fini_basic() checks if page count of pool-type's lru
    list is zero after tearing down its pre-populated pool.
    
    After commit 5ffdc8f83613 ("ttm/pool: Don't leak LRU list on shutdown")
    this check causes NULL dereference because page's lru list is destroyed
    during pool's teardown which leads to KUnit's crash:
    
    [20:08:24] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
    [20:08:24] [PASSED] ttm_pool_alloc_order_caching_match
    [20:08:24] [PASSED] ttm_pool_alloc_caching_mismatch
    [20:08:24] [PASSED] ttm_pool_alloc_order_mismatch
    [20:08:24] [PASSED] ttm_pool_free_dma_alloc
    [20:08:24] [PASSED] ttm_pool_free_no_dma_alloc
    [20:08:25] [ERROR] Test: ttm_pool: missing expected subtest!
    [20:08:25]
    [20:08:25] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-g401a3e7b64d1
    [20:08:25] RIP: 0033:list_lru_count_node+0xe/0x20
    [20:08:25] RSP: 00000000a08dbef8  EFLAGS: 00010246
    [20:08:25] RAX: 0000000000000001 RBX: 00000000a0803c70 RCX: 0000000000000020
    [20:08:25] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000060853030
    [20:08:25] RBP: 0000000060853000 R08: 00000000a08dbe98 R09: 00000000601246ac
    [20:08:25] R10: 000000009f227d00 R11: 0000000000000000 R12: 0000000060124640
    [20:08:25] R13: 0000000060853030 R14: 000000006047c950 R15: 00000000604c6488
    [20:08:25] Kernel panic - not syncing: Segfault with no mm
    [20:08:25] [CRASHED]
    [20:08:25] [ERROR] Test: ttm_pool: missing subtest result line!
    [20:08:25] # module: ttm_pool_test
    [20:08:25] ==================== [CRASHED] ttm_pool ====================
    [20:08:25] [ERROR] Test: main: missing expected subtest!
    [20:08:25] [CRASHED]
    [20:08:25] [ERROR] Test: main: missing expected subtest!
    [20:08:25] [CRASHED]
    [20:08:25] [ERROR] Test: main: missing expected subtest!
    [20:08:25] [CRASHED]
    [20:08:25] [ERROR] Test: main: missing expected subtest!
    [20:08:25] [CRASHED]
    [20:08:25] ============================================================
    [20:08:25] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors: 6
    
    The crash in turn prevents Xe CI from running IGT.
    
    Drop the post-teardown assertion.
    
    Fixes: 5ffdc8f83613 ("ttm/pool: Don't leak LRU list on shutdown")
    Cc: Ian Forbes <ian.forbes@broadcom.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
+ /mt/dim checkpatch 6e071be9c703c9e81f5be2d2601dfa5754d446e2 drm-intel
b130a1cf488a drm/ttm/tests: do not count pages after pool's teardown
-:24: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#24: 
[20:08:25] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7.4.0-rc4-g401a3e7b64d1

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


