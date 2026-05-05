Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBD2FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BAE10EBE3;
	Tue,  5 May 2026 18:50:58 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4C210EBDF;
 Tue,  5 May 2026 18:50:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 18:50:57 -0000
Message-ID: <177800705789.40958.13381685956626687291@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505184421.2324798-1-mpenttil@redhat.com>
In-Reply-To: <20260505184421.2324798-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev2)
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
commit 323748c3bffcdd9e173e14479fd0f98e2438df74
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Tue May 5 21:44:21 2026 +0300

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
+ /mt/dim checkpatch e782e6a579775723266be631e06276d43aa7a907 drm-intel
729d3c89a1aa mm/Kconfig: changes for migrate on fault for device pages
a5466856c900 mm: Add helper to convert HMM pfn to migrate pfn
-:174: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#174: FILE: mm/migrate_device.c:1543:
+
+}

total: 0 errors, 0 warnings, 1 checks, 132 lines checked
928a21744ab2 mm/hmm: do the plumbing for HMM to participate in migration
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

-:239: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#239: FILE: mm/hmm.c:363:
+				return -EBUSY;
+			} else

-:239: CHECK:BRACES: Unbalanced braces around else statement
#239: FILE: mm/hmm.c:363:
+			} else

-:246: CHECK:BRACES: braces {} should be used on all arms of this statement
#246: FILE: mm/hmm.c:369:
+		if (hmm_vma_walk->ptelocked) {
[...]
+		} else
[...]

-:249: CHECK:BRACES: Unbalanced braces around else statement
#249: FILE: mm/hmm.c:372:
+		} else

-:260: CHECK:BRACES: braces {} should be used on all arms of this statement
#260: FILE: mm/hmm.c:391:
+			if (hmm_vma_walk->ptelocked) {
[...]
+			} else
[...]

-:263: CHECK:BRACES: Unbalanced braces around else statement
#263: FILE: mm/hmm.c:394:
+			} else

-:274: CHECK:BRACES: braces {} should be used on all arms of this statement
#274: FILE: mm/hmm.c:409:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:277: CHECK:BRACES: Unbalanced braces around else statement
#277: FILE: mm/hmm.c:412:
+	} else

-:287: CHECK:BRACES: braces {} should be used on all arms of this statement
#287: FILE: mm/hmm.c:457:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:383: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#383: FILE: mm/hmm.c:550:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:432: CHECK:BRACES: braces {} should be used on all arms of this statement
#432: FILE: mm/hmm.c:594:
+	if (minfo) {
[...]
+	} else
[...]

-:436: CHECK:BRACES: Unbalanced braces around else statement
#436: FILE: mm/hmm.c:598:
+	} else

-:470: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#470: FILE: mm/hmm.c:631:
+	if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
+

-:485: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#485: FILE: mm/hmm.c:646:
+		if (pmd_trans_huge(pmd)) {
+

-:554: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#554: FILE: mm/hmm.c:696:
 
+	}

-:572: CHECK:BRACES: braces {} should be used on all arms of this statement
#572: FILE: mm/hmm.c:715:
+	if (minfo) {
[...]
+	} else
[...]

-:576: CHECK:BRACES: Unbalanced braces around else statement
#576: FILE: mm/hmm.c:719:
+	} else

-:603: CHECK:BRACES: braces {} should be used on all arms of this statement
#603: FILE: mm/hmm.c:743:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:606: CHECK:BRACES: Unbalanced braces around else statement
#606: FILE: mm/hmm.c:746:
+	} else

-:682: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#682: FILE: mm/hmm.c:980:
+		if (is_fault_path && mmu_interval_check_retry(range->notifier,
+					     range->notifier_seq)) {

total: 0 errors, 1 warnings, 27 checks, 648 lines checked
b72d51f7d004 mm: setup device page migration in HMM pagewalk
-:195: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#195: FILE: mm/hmm.c:612:
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+

-:219: CHECK:LINE_SPACING: Please don't use multiple blank lines
#219: FILE: mm/hmm.c:636:
+
+

-:382: CHECK:BRACES: braces {} should be used on all arms of this statement
#382: FILE: mm/hmm.c:796:
+	if (fault_folio == folio || folio_trylock(folio)) {
[...]
+	} else
[...]

-:439: CHECK:BRACES: Unbalanced braces around else statement
#439: FILE: mm/hmm.c:853:
+	} else

-:458: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#458: FILE: mm/hmm.c:869:
+	spinlock_t *ptl;

-:480: CHECK:BRACES: braces {} should be used on all arms of this statement
#480: FILE: mm/hmm.c:891:
+		if (folio != fault_folio) {
[...]
+		}  else
[...]

-:486: CHECK:BRACES: Unbalanced braces around else statement
#486: FILE: mm/hmm.c:897:
+		}  else

-:495: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#495: FILE: mm/hmm.c:906:
+
+	}

total: 0 errors, 0 warnings, 8 checks, 1062 lines checked
323748c3bffc lib/test_hmm:: add a new testcase for the migrate on fault
-:124: CHECK:LINE_SPACING: Please don't use multiple blank lines
#124: FILE: lib/test_hmm.c:1349:
+
+

-:197: CHECK:LINE_SPACING: Please don't use multiple blank lines
#197: FILE: tools/testing/selftests/mm/hmm-tests.c:995:
 
+

total: 0 errors, 0 warnings, 2 checks, 208 lines checked


