Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F5CD5BD5
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 08:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25510E5BC;
	Mon, 25 May 2026 08:51:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A010E414;
 Mon, 25 May 2026 08:50:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 08:50:58 -0000
Message-ID: <177969905891.4776.234645311450189491@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525084524.139868-1-mpenttil@redhat.com>
In-Reply-To: <20260525084524.139868-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev4)
URL   : https://patchwork.freedesktop.org/series/165953/
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
commit 4df3f7f299ec87c2d4e05da53f760ebde5ad6980
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Mon May 25 11:45:24 2026 +0300

    lib/test_hmm: add a new testcase for the migrate on fault
    
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
+ /mt/dim checkpatch a17b0235a9c5a8d4d1b2cade1af6c5f76429484f drm-intel
ae88738d7316 mm/Kconfig: changes for migrate on fault for device pages
b91a476ebe5c mm: Add helper to convert HMM pfn to migrate pfn
-:174: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#174: FILE: mm/migrate_device.c:1543:
+
+}

total: 0 errors, 0 warnings, 1 checks, 132 lines checked
51985b039b0e mm/hmm: do the plumbing for HMM to participate in migration
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

-:281: CHECK:BRACES: braces {} should be used on all arms of this statement
#281: FILE: mm/hmm.c:411:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:284: CHECK:BRACES: Unbalanced braces around else statement
#284: FILE: mm/hmm.c:414:
+	} else

-:294: CHECK:BRACES: braces {} should be used on all arms of this statement
#294: FILE: mm/hmm.c:459:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:390: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#390: FILE: mm/hmm.c:552:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:439: CHECK:BRACES: braces {} should be used on all arms of this statement
#439: FILE: mm/hmm.c:596:
+	if (minfo) {
[...]
+	} else
[...]

-:443: CHECK:BRACES: Unbalanced braces around else statement
#443: FILE: mm/hmm.c:600:
+	} else

-:480: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#480: FILE: mm/hmm.c:636:
+	if (pmd_trans_huge(pmd) || !pmd_present(pmd)) {
+

-:495: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#495: FILE: mm/hmm.c:651:
+		if (pmd_trans_huge(pmd)) {
+

-:564: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#564: FILE: mm/hmm.c:701:
 
+	}

-:582: CHECK:BRACES: braces {} should be used on all arms of this statement
#582: FILE: mm/hmm.c:720:
+	if (minfo) {
[...]
+	} else
[...]

-:586: CHECK:BRACES: Unbalanced braces around else statement
#586: FILE: mm/hmm.c:724:
+	} else

-:613: CHECK:BRACES: braces {} should be used on all arms of this statement
#613: FILE: mm/hmm.c:748:
+	if (hmm_vma_walk->ptelocked) {
[...]
+	} else
[...]

-:616: CHECK:BRACES: Unbalanced braces around else statement
#616: FILE: mm/hmm.c:751:
+	} else

-:692: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#692: FILE: mm/hmm.c:985:
+		if (is_fault_path && mmu_interval_check_retry(range->notifier,
+					     range->notifier_seq)) {

total: 0 errors, 1 warnings, 27 checks, 658 lines checked
f14524511066 mm: setup device page migration in HMM pagewalk
-:195: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#195: FILE: mm/hmm.c:614:
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+

-:219: CHECK:LINE_SPACING: Please don't use multiple blank lines
#219: FILE: mm/hmm.c:638:
+
+

-:382: CHECK:BRACES: braces {} should be used on all arms of this statement
#382: FILE: mm/hmm.c:798:
+	if (fault_folio == folio || folio_trylock(folio)) {
[...]
+	} else
[...]

-:439: CHECK:BRACES: Unbalanced braces around else statement
#439: FILE: mm/hmm.c:855:
+	} else

-:458: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#458: FILE: mm/hmm.c:871:
+	spinlock_t *ptl;

-:480: CHECK:BRACES: braces {} should be used on all arms of this statement
#480: FILE: mm/hmm.c:893:
+		if (folio != fault_folio) {
[...]
+		}  else
[...]

-:486: CHECK:BRACES: Unbalanced braces around else statement
#486: FILE: mm/hmm.c:899:
+		}  else

-:495: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#495: FILE: mm/hmm.c:908:
+
+	}

total: 0 errors, 0 warnings, 8 checks, 1062 lines checked
4df3f7f299ec lib/test_hmm: add a new testcase for the migrate on fault
-:162: CHECK:LINE_SPACING: Please don't use multiple blank lines
#162: FILE: lib/test_hmm.c:1358:
+
+

-:235: CHECK:LINE_SPACING: Please don't use multiple blank lines
#235: FILE: tools/testing/selftests/mm/hmm-tests.c:995:
 
+

total: 0 errors, 0 warnings, 2 checks, 243 lines checked


