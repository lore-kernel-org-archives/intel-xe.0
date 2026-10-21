Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD3606A321
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358110E263;
	Wed, 21 Oct 2026 06:50:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D610E067;
 Wed, 21 Oct 2026 06:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 06:50:55 -0000
Message-ID: <179256545519.50172.6837278893718300077@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021060506.2377545-1-mpenttil@redhat.com>
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev8)
URL   : https://patchwork.freedesktop.org/series/165953/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf6180ecc35752df281a39567fae90ba9269f3da
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Wed Oct 21 09:05:06 2026 +0300

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
+ /mt/dim checkpatch f3bbda7128124e54c4881b56958249a18d79a110 drm-intel
f13478ecc5fc mm/Kconfig: changes for migrate on fault for device pages
15404a960e5e mm: add helper to convert HMM pfn to migrate pfn
-:179: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#179: FILE: mm/migrate_device.c:1584:
+
+}

total: 0 errors, 0 warnings, 1 checks, 138 lines checked
c887b5b56a44 mm/hmm: preparations for HMM to participate in migration
-:192: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#192: FILE: mm/hmm.c:422:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:215: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#215: FILE: mm/hmm.c:445:
+{
+

total: 0 errors, 0 warnings, 2 checks, 262 lines checked
1a03bf49a90a mm/hmm: do the plumbing for HMM to participate in migration
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
#216: FILE: mm/hmm.c:466:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:320: CHECK:BRACES: braces {} should be used on all arms of this statement
#320: FILE: mm/hmm.c:614:
+	if (minfo) {
[...]
+	} else
[...]

-:324: CHECK:BRACES: Unbalanced braces around else statement
#324: FILE: mm/hmm.c:618:
+	} else

total: 0 errors, 0 warnings, 8 checks, 482 lines checked
62069f077190 mm/hmm: migrate collection in HMM pagewalk - pte level
8c37a25bb300 mm/hmm: migrate collection in HMM pagewalk - pmd level
448794534cf2 mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
59a63360adff mm/hmm: implement rollback for device page migration in HMM pagewalk
-:167: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#167: FILE: mm/hmm.c:627:
+
+		}

total: 0 errors, 0 warnings, 1 checks, 167 lines checked
90eee00843a8 mm: enable device page migration from HMM pagewalk
741c9c6d33d2 lib/test_hmm: add a new testcase for the migrate on fault
-:246: CHECK:LINE_SPACING: Please don't use multiple blank lines
#246: FILE: lib/test_hmm.c:1515:
+
+

-:321: CHECK:LINE_SPACING: Please don't use multiple blank lines
#321: FILE: tools/testing/selftests/mm/hmm-tests.c:948:
 
+

total: 0 errors, 0 warnings, 2 checks, 326 lines checked
b9fd3fbebaa1 Documentation/mm/hmm: document migration through hmm_range_fault()
cf6180ecc357 drm/nouveau/svm: add support for migrate on fault
-:132: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#132: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:835:
+nouveau_dmem_migrate_alloc_and_copy(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,

-:151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#151: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:866:
+static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
+		struct nouveau_svmm *svmm, struct migrate_vma *args,

-:337: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#337: FILE: drivers/gpu/drm/nouveau/nouveau_dmem.c:1057:
+				pfns[0] = nouveau_dmem_hmm_pfn_to_map(hmm_pfn0,
+						start, &map_addr, &page_shift);

total: 0 errors, 0 warnings, 3 checks, 603 lines checked


