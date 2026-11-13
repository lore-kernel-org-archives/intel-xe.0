Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528E60A382D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAFD10E6C5;
	Fri, 13 Nov 2026 19:08:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C7010E6C5;
 Fri, 13 Nov 2026 19:08:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/gpusvm=3A_Add_a_DMA-mapping_accounting_callback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 19:08:02 -0000
Message-ID: <179459688268.22178.17981304839998831494@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113190128.2118723-1-matthew.brost@intel.com>
In-Reply-To: <20261113190128.2118723-1-matthew.brost@intel.com>
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

Series: series starting with [v3,1/2] drm/gpusvm: Add a DMA-mapping accounting callback
URL   : https://patchwork.freedesktop.org/series/178528/
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
commit ebb1e4f0f9e36e7a7bdc514ce5d5420862454669
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Nov 13 11:01:28 2026 -0800

    drm/xe: Add debugfs stats for DMA-mapped pages per order
    
    Expose per-page-order DMA mapping counts for the system memory that the
    xe driver maps for GPU access, split into two categories: TTM buffer
    objects, and the GPU SVM / userptr ranges (which share a single
    drm_gpusvm instance per VM).
    
    The stats are visible at:
    
      <debugfs>/dri/<N>/dma_mapped_pages
    
    and are broken out into two rows (bo, svm/userptr), one column per page
    order, mirroring the layout of the TTM pool page_pool stat.
    
    For TTM BOs the per-order counts are derived from the DMA scatter-gather
    table: each mapped segment is physically contiguous, so its page count is
    split into the largest power-of-two runs (a segment of N pages contributes
    a 2^k chunk for the largest k with 2^k <= N, repeated for the remainder).
    Driving the accounting off the sg table rather than the pages[] array keeps
    it correct even when pages[] entries are cleared while still DMA-mapped,
    as happens on the defrag page-borrowing path. Dma-buf BOs are not
    accounted for in dma_mapped_pages stats.
    
    For the SVM and userptr ranges the accounting is driven by the
    drm_gpusvm @dma_map_account callback, which fires once per dma_addr[]
    entry at the exact point the entry is DMA-mapped and unmapped. This
    makes the accounting symmetric by construction and avoids driver-side
    walks that could drift across migration, partial unmaps and the iova vs
    non-iova paths. Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps
    and counted; device interconnect (VRAM, P2P) entries are skipped, so the
    counter reflects only system pages actually mapped through the DMA layer.
    
    The callback is shared between the full SVM instance (fault mode) and the
    core drm_gpusvm_pages-only instance used for userptr, so userptr
    mappings are accounted in both the CONFIG_DRM_XE_GPUSVM=y and =n (but
    CONFIG_DRM_GPUSVM=y) configurations, into the same svm/userptr counter.
    
    Since the counts are only ever consumed through debugfs, gate the counter
    storage and all accounting on CONFIG_DEBUG_FS so that builds without
    debugfs carry no extra atomic traffic or device state; the drm_gpusvm
    callback is simply left unregistered in that case.
    
    On device teardown assert that every counter has returned to zero, to
    catch any unbalanced accounting (a leaked DMA mapping) during testing.
    
    Assisted-by: LLM
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ddc259b91140f0c62cb589c3f9101498db73133e drm-intel
eb0a5a2d1cf7 drm/gpusvm: Add a DMA-mapping accounting callback
-:33: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#33: 
Assisted-by: LLM

-:33: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#33: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 100 lines checked
ebb1e4f0f9e3 drm/xe: Add debugfs stats for DMA-mapped pages per order
-:52: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#52: 
Assisted-by: LLM

-:52: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#52: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 317 lines checked


