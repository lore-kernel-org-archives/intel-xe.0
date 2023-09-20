Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271DACE79AB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAA010E463;
	Wed, 20 Sep 2023 08:54:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D54E310E463;
 Wed, 20 Sep 2023 08:54:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DB859A00CC;
 Wed, 20 Sep 2023 08:54:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 20 Sep 2023 08:54:18 -0000
Message-ID: <169520005889.6464.2286315493128972224@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe/bo=3A_Evict_VRAM_to_TT_rather_than_to_system?=
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

Series: fixup! drm/xe/bo: Evict VRAM to TT rather than to system
URL   : https://patchwork.freedesktop.org/series/123960/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f9d1478b4198b1323fa5c3b4e62179085cc1a10b
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Sep 20 10:22:17 2023 +0200

    fixup! drm/xe/bo: Evict VRAM to TT rather than to system
    
    The dma-buf kunit test and to some extent the dma-buf code assumed
    that all bos were evicted to system. Fix this by having the dma-buf
    code not assume anything about eviction placement and the test
    code assume that VRAM bos are evicted to TT.
    
    The patch applies using automerge conflict resolution.
    
    This fixes the following errors:
    
    [  102.102086]     KTAP version 1
    [  102.102102]     # Subtest: xe_dma_buf
    [  102.102113]     1..1
    [  102.102377]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.106167]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.106327]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.107136]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:98
                       Expected xe_bo_is_mem_type(exported, mem_type) to be true, but is false
    [  102.107691]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.108099]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.108158]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.108294]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.108742]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.108800]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.108908]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.109080]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.109842]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.109941]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.110131]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.110236]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.110402]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.110731]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.110790]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.111498]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.111793]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.111851]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.112302]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.112580]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
                   Importer wasn't properly evicted.
    [  102.112638]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    [  102.113292]     not ok 1 xe_dma_buf_kunit
    [  102.113296] not ok 1 xe_dma_buf
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b3b5f51b66e9f1bf5aecef46446c4e7c49146834 drm-intel
f9d1478b4 fixup! drm/xe/bo: Evict VRAM to TT rather than to system


