Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33973C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B410E640;
	Tue,  4 Aug 2026 04:35:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1679710E3EC;
 Tue,  4 Aug 2026 04:35:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 04:35:19 -0000
Message-ID: <178581811906.15902.9754713928126705300@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804042631.2175585-1-mpenttil@redhat.com>
In-Reply-To: <20260804042631.2175585-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev5)
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
commit ab5660e8c8f1d0d40b49cebb4cb0a8688fe63c99
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Tue Aug 4 07:26:31 2026 +0300

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
+ /mt/dim checkpatch c2d24e2eda55d74743f0d99a98805bf0b596beef drm-intel
0c97467f0a59 mm/Kconfig: changes for migrate on fault for device pages
458472e638bc mm: add helper to convert HMM pfn to migrate pfn
-:174: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#174: FILE: mm/migrate_device.c:1543:
+
+}

total: 0 errors, 0 warnings, 1 checks, 132 lines checked
ee87727a8a18 mm/hmm: preparations for HMM to participate in migration
-:158: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#158: FILE: mm/hmm.c:412:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:180: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#180: FILE: mm/hmm.c:434:
+{
+

total: 0 errors, 0 warnings, 2 checks, 203 lines checked
e6c254b94143 mm/hmm: do the plumbing for HMM to participate in migration
-:52: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#52: FILE: mm/hmm.c:56:
+	spinlock_t			*ptl;

-:55: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#55: FILE: mm/hmm.c:59:
+#define HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked != locked)

-:58: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#58: FILE: mm/hmm.c:62:
+#define HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->pmdlocked != locked)

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hmm_vma_walk' - possible side-effects?
#61: FILE: mm/hmm.c:65:
+#define HMM_ASSERT_UNLOCKED(hmm_vma_walk)			\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked ||		\
+		     (hmm_vma_walk)->pmdlocked)

-:92: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#92: FILE: mm/hmm.c:101:
+		end-addr == HPAGE_PMD_SIZE) {
 		   ^

-:216: CHECK:BRACES: braces {} should be used on all arms of this statement
#216: FILE: mm/hmm.c:461:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:334: CHECK:BRACES: braces {} should be used on all arms of this statement
#334: FILE: mm/hmm.c:622:
+	if (minfo) {
[...]
+	} else
[...]

-:338: CHECK:BRACES: Unbalanced braces around else statement
#338: FILE: mm/hmm.c:626:
+	} else

-:455: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#455: FILE: mm/hmm.c:721:
 
+	}

total: 0 errors, 0 warnings, 9 checks, 489 lines checked
f5b5b055813f mm/hmm: implement folio split for migrate needs in HMM pagewalk
-:39: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#39: FILE: mm/hmm.c:518:
+	spinlock_t *ptl;

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
1c0d1db6f786 mm/hmm: migrate collection in HMM pagewalk - pte level
cfd1ec6826ca mm/hmm: migrate collection in HMM pagewalk - pmd level
e93563a5a5f2 mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
1aa011a67173 mm/hmm: implement rollback for device page migration in HMM pagewalk
-:163: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#163: FILE: mm/hmm.c:603:
+
+		}

total: 0 errors, 0 warnings, 1 checks, 164 lines checked
9b5465dd5e41 mm: enable device page migration from HMM pagewalk
ab5660e8c8f1 lib/test_hmm: add a new testcase for the migrate on fault
-:176: CHECK:LINE_SPACING: Please don't use multiple blank lines
#176: FILE: lib/test_hmm.c:1395:
+
+

-:249: CHECK:LINE_SPACING: Please don't use multiple blank lines
#249: FILE: tools/testing/selftests/mm/hmm-tests.c:1000:
 
+

total: 0 errors, 0 warnings, 2 checks, 257 lines checked


