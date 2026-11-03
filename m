Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7F606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 08:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5610E7BF;
	Tue,  3 Nov 2026 08:46:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE1D10F450;
 Tue,  3 Nov 2026 08:46:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 08:46:29 -0000
Message-ID: <179369558984.109284.7691995586686199053@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103061629.972669-1-mpenttil@redhat.com>
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev9)
URL   : https://patchwork.freedesktop.org/series/165953/
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
commit 22b3495b79362c0ba98c229494362b3020126424
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Tue Nov 3 08:16:29 2026 +0200

    drm/nouveau/svm: add support for migrate on fault
    
    Add a direct user for the new HMM_PFN_REQ_MIGRATE flag and
    implement migrate on fault for nouveau driver. It is gated
    by the svm_migrate_on_fault module parameter, default off.
    
    Added nouveau_dmem_migrate_fault() that faults a range in and
    does migrate collecting in a single hmm_range_fault() walk.
    
    As an optimization, a migration policy - deciding which faulting
    ranges are worth migrating to VRAM and which are better left
    mirrored in system memory - would be useful. This patch
    establishes the migrate-on-fault mechanism as a basis for later
    refinement.
    
    Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
+ /mt/dim checkpatch dabb4c72ce501c30b3e57854bb05415bfe9047f4 drm-intel
ee8cac66c94b mm/Kconfig: changes for migrate on fault for device pages
d3612d604e07 mm: add helper to convert HMM pfn to migrate pfn
-:179: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#179: FILE: mm/migrate_device.c:1586:
+
+}

total: 0 errors, 0 warnings, 1 checks, 138 lines checked
657d1ac73063 mm/hmm: preparations for HMM to participate in migration
9f6df6f8f2c2 mm/hmm: do the plumbing for HMM to participate in migration
-:47: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#47: FILE: mm/hmm.c:54:
+	spinlock_t			*ptl;

-:55: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#55: FILE: mm/hmm.c:76:
+#define HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked != locked)

-:58: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#58: FILE: mm/hmm.c:79:
+#define HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->pmdlocked != locked)

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hmm_vma_walk' - possible side-effects?
#61: FILE: mm/hmm.c:82:
+#define HMM_ASSERT_UNLOCKED(hmm_vma_walk)			\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked ||		\
+		     (hmm_vma_walk)->pmdlocked)

-:92: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#92: FILE: mm/hmm.c:118:
+		end-addr == HPAGE_PMD_SIZE) {
 		   ^

-:216: CHECK:BRACES: braces {} should be used on all arms of this statement
#216: FILE: mm/hmm.c:470:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:320: CHECK:BRACES: braces {} should be used on all arms of this statement
#320: FILE: mm/hmm.c:633:
+	if (minfo) {
[...]
+	} else
[...]

-:324: CHECK:BRACES: Unbalanced braces around else statement
#324: FILE: mm/hmm.c:637:
+	} else

total: 0 errors, 0 warnings, 8 checks, 487 lines checked
087405190f21 mm/hmm: migrate collection in HMM pagewalk - pte level
c1cd2eff4210 mm/hmm: migrate collection in HMM pagewalk - pmd level
fd91556e4ecf mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
3e2b94590cf5 mm/hmm: implement rollback for device page migration in HMM pagewalk
-:226: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#226: FILE: mm/hmm.c:649:
+
+		}

total: 0 errors, 0 warnings, 1 checks, 251 lines checked
3a7ad58164e2 mm: enable device page migration from HMM pagewalk
278ee42916a1 lib/test_hmm: add a new testcase for the migrate on fault
-:262: CHECK:LINE_SPACING: Please don't use multiple blank lines
#262: FILE: lib/test_hmm.c:1515:
+
+

-:337: CHECK:LINE_SPACING: Please don't use multiple blank lines
#337: FILE: tools/testing/selftests/mm/hmm-tests.c:947:
 
+

total: 0 errors, 0 warnings, 2 checks, 328 lines checked
9103195d05d6 Documentation/mm/hmm: document migration through hmm_range_fault()
22b3495b7936 drm/nouveau/svm: add support for migrate on fault
-:260: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#260: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:876:
+		if (nouveau_dmem_copy(drm, folio_nr_pages(page_folio(spage)),
 			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,

-:267: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#267: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:882:
+		if (nouveau_dmem_clear(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))

-:277: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#277: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:907:
+nouveau_dmem_migrate_alloc_and_copy(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,

-:297: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#297: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:938:
+static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
+		struct nouveau_svmm *svmm, struct migrate_vma *args,

-:497: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#497: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:1142:
+				pfns[0] = nouveau_dmem_hmm_pfn_to_map(hmm_pfn0,
+						start, &map_addr, &page_shift);

total: 0 errors, 0 warnings, 5 checks, 785 lines checked


