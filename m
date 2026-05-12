Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E4CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 16:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C3210E0F9;
	Tue, 12 May 2026 16:46:16 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143D410E0F9;
 Tue, 12 May 2026 16:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Insert_instead_of_copy_pa?=
 =?utf-8?q?ges_into_shmem_when_shrinking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 16:46:16 -0000
Message-ID: <177860437607.61708.8048659678312004299@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512110339.6244-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260512110339.6244-1-thomas.hellstrom@linux.intel.com>
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

Series: Insert instead of copy pages into shmem when shrinking
URL   : https://patchwork.freedesktop.org/series/166409/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a75ce097b0de493650b3ab0ba537e492de649b60
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue May 12 13:03:39 2026 +0200

    drm/ttm: Use ttm_backup_insert_folio() for zero-copy swapout
    
    Add ttm_backup_insert_folio(), a thin wrapper around shmem_insert_folio()
    that returns a handle, for use by drivers with large isolated folios.
    
    Replace the alloc+copy ttm_backup_backup_page() path in ttm_pool_backup()
    with the zero-copy ttm_backup_insert_folio() path.
    
    On success NR_GPU_ACTIVE is decremented and the caller's reference is
    released; shmem takes ownership.  The alloc_gfp argument used for
    allocating shmem backing pages is no longer needed.
    
    If insertion fails for a higher-order page, it is split into order-0
    pages with ttm_pool_split_for_swap() and the loop retries each page
    individually.
    
    Assisted-by: GitHub_Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 5297e46fb8ee731657b6cbae24b3cde8ad094aa5 drm-intel
59ed74f6a302 mm/shmem: add shmem_insert_folio()
-:31: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#31: FILE: include/linux/mm.h:1679:
+extern void undo_compound_page(struct page *page);

-:131: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#131: FILE: mm/shmem.c:983:
+	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);

-:132: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#132: FILE: mm/shmem.c:984:
+	VM_BUG_ON_FOLIO(folio_mapped(folio), folio);

-:133: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#133: FILE: mm/shmem.c:985:
+	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);

-:134: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#134: FILE: mm/shmem.c:986:
+	VM_BUG_ON_FOLIO(folio->mapping, folio);

-:135: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#135: FILE: mm/shmem.c:987:
+	VM_BUG_ON(index != round_down(index, nr_pages));

total: 0 errors, 5 warnings, 1 checks, 153 lines checked
a75ce097b0de drm/ttm: Use ttm_backup_insert_folio() for zero-copy swapout


