Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD91FCD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 07:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9177E10E9C0;
	Tue,  5 May 2026 07:55:36 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7E10E9CD;
 Tue,  5 May 2026 07:55:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 07:55:34 -0000
Message-ID: <177796773496.38341.1251501822070646552@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505051658.2219537-1-mpenttil@redhat.com>
In-Reply-To: <20260505051658.2219537-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages
URL   : https://patchwork.freedesktop.org/series/165953/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8cb7b58597e12874573abb460ea8a399b73c4cf2
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Tue May 5 08:16:58 2026 +0300

    lib/test_hmm:: add a new testcase for the migrate on fault
    
    Enhance the hmm test driver (lib/test_hmm) with migrate on fault case.
    
    Cc: David Hildenbrand <david@kernel.org>
    Cc: Jason Gunthorpe <jgg@nvidia.com>
    Cc: Leon Romanovsky <leonro@nvidia.com>
    Cc: Alistair Popple <apopple@nvidia.com>
    Cc: Balbir Singh <balbirs@nvidia.com>
    Cc: Zi Yan <ziy@nvidia.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Marco Pagani <marpagan@redhat.com>
    Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
+ /mt/dim checkpatch 080a06082eb178e71ef38b4e2ac94a2274874c04 drm-intel
7c9f6c1f4820 mm/Kconfig: changes for migrate on fault for device pages
1841c98f3774 mm: Add helper to convert HMM pfn to migrate pfn
-:174: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#174: FILE: mm/migrate_device.c:1543:
+
+}

total: 0 errors, 0 warnings, 1 checks, 132 lines checked
e9ab7361392f mm/hmm: do the plumbing for HMM to participate in migration
-:127: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#127: FILE: mm/hmm.c:56:
+	spinlock_t			*ptl;

-:130: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hmm_vma_walk' may be better as '(hmm_vma_walk)' to avoid precedence issues
#130: FILE: mm/hmm.c:59:
+#define HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, locked)		\
+		WARN_ON_ONCE(hmm_vma_walk->ptelocked != locked)

-:130: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#130: FILE: mm/hmm.c:59:
+#define HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, locked)		\
+		WARN_ON_ONCE(hmm_vma_walk->ptelocked != locked)

-:133: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hmm_vma_walk' may be better as '(hmm_vma_walk)' to avoid precedence issues
#133: FILE: mm/hmm.c:62:
+#define HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, locked)		\
+		WARN_ON_ONCE(hmm_vma_walk->pmdlocked != locked)

-:133: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#133: FILE: mm/hmm.c:62:
+#define HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, locked)		\
+		WARN_ON_ONCE(hmm_vma_walk->pmdlocked != locked)

-:136: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hmm_vma_walk' - possible side-effects?
#136: FILE: mm/hmm.c:65:
+#define HMM_ASSERT_UNLOCKED(hmm_vma_walk)		\
+		WARN_ON_ONCE(hmm_vma_walk->ptelocked ||	\
+			     hmm_vma_walk->pmdlocked)

-:136: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'hmm_vma_walk' may be better as '(hmm_vma_walk)' to avoid precedence issues
#136: FILE: mm/hmm.c:65:
+#define HMM_ASSERT_UNLOCKED(hmm_vma_walk)		\
+		WARN_ON_ONCE(hmm_vma_walk->ptelocked ||	\
+			     hmm_vma_walk->pmdlocked)

-:233: CHECK:BRACES: braces {} should be used on all arms of this statement
#233: FILE: mm/hmm.c:357:
+			if (!hmm_select_migrate(range)) {
[...]
+			} else
[...]

-:238: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#238: FILE: mm/hmm.c:362:
+				return -EBUSY;
+			} else

-:238: CHECK:BRACES: Unbalanced braces around else statement
#238: FILE: mm/hmm.c:362:
+			} else

-:245: CHECK:BRACES: braces {} should be used on all arms of this statement
#245: FILE: mm/hmm.c:368:
+		if (hmm_vma_walk->ptelocked) {
[...]
+		} else
[...]

-:248: CHECK:BRACES: Unbalanced braces around else statement
#248: FILE: mm/hmm.c:371:
+		} else

-:259: CHECK:BRACES: braces {} should be used on all arms of this statement
#259: FILE: mm/hmm.c:390:
+			if (hmm_vma_walk->ptelocked) {
[...]
+			} else
[...]

-:262: CHECK:BRACES: Unbalanced braces around else statement
#262: FILE: mm/hmm.c:393:
+			} else

-:273: CHECK:BRACES: braces {} should be used on all arms of this statement
#273: FILE: mm/hmm.c:408:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:276: CHECK:BRACES: Unbalanced braces around else statement
#276: FILE: mm/hmm.c:411:
+	} else

-:286: CHECK:BRACES: braces {} should be used on all arms of this statement
#286: FILE: mm/hmm.c:456:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:382: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#382: FILE: mm/hmm.c:549:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:431: CHECK:BRACES: braces {} should be used on all arms of this statement
#431: FILE: mm/hmm.c:593:
+	if (minfo) {
[...]
+	} else
[...]

-:435: CHECK:BRACES: Unbalanced braces around else statement
#435: FILE: mm/hmm.c:597:
+	} else

-:469: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#469: FILE: mm/hmm.c:630:
+	if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
+

-:484: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#484: FILE: mm/hmm.c:645:
+		if (pmd_trans_huge(pmd)) {
+

-:553: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#553: FILE: mm/hmm.c:695:
 
+	}

-:571: CHECK:BRACES: braces {} should be used on all arms of this statement
#571: FILE: mm/hmm.c:714:
+	if (minfo) {
[...]
+	} else
[...]

-:575: CHECK:BRACES: Unbalanced braces around else statement
#575: FILE: mm/hmm.c:718:
+	} else

-:602: CHECK:BRACES: braces {} should be used on all arms of this statement
#602: FILE: mm/hmm.c:742:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:605: CHECK:BRACES: Unbalanced braces around else statement
#605: FILE: mm/hmm.c:745:
+	} else

-:681: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#681: FILE: mm/hmm.c:979:
+		if (is_fault_path && mmu_interval_check_retry(range->notifier,
+					     range->notifier_seq)) {

total: 0 errors, 1 warnings, 27 checks, 647 lines checked
c09024f9eca8 mm: setup device page migration in HMM pagewalk
-:195: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#195: FILE: mm/hmm.c:611:
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+

-:219: CHECK:LINE_SPACING: Please don't use multiple blank lines
#219: FILE: mm/hmm.c:635:
+
+

-:382: CHECK:BRACES: braces {} should be used on all arms of this statement
#382: FILE: mm/hmm.c:795:
+	if (fault_folio == folio || folio_trylock(folio)) {
[...]
+	} else
[...]

-:439: CHECK:BRACES: Unbalanced braces around else statement
#439: FILE: mm/hmm.c:852:
+	} else

-:458: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#458: FILE: mm/hmm.c:868:
+	spinlock_t *ptl;

-:480: CHECK:BRACES: braces {} should be used on all arms of this statement
#480: FILE: mm/hmm.c:890:
+		if (folio != fault_folio) {
[...]
+		}  else
[...]

-:486: CHECK:BRACES: Unbalanced braces around else statement
#486: FILE: mm/hmm.c:896:
+		}  else

-:495: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#495: FILE: mm/hmm.c:905:
+
+	}

total: 0 errors, 0 warnings, 8 checks, 1062 lines checked
8cb7b58597e1 lib/test_hmm:: add a new testcase for the migrate on fault
-:124: CHECK:LINE_SPACING: Please don't use multiple blank lines
#124: FILE: lib/test_hmm.c:1349:
+
+

-:197: CHECK:LINE_SPACING: Please don't use multiple blank lines
#197: FILE: tools/testing/selftests/mm/hmm-tests.c:995:
 
+

total: 0 errors, 0 warnings, 2 checks, 208 lines checked


