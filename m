Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371E1C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 05:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD28210E428;
	Tue, 22 Sep 2026 05:41:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E86610E41B;
 Tue, 22 Sep 2026 05:41:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 05:41:40 -0000
Message-ID: <179005570031.190466.3102048051544073234@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922053421.4092027-1-mpenttil@redhat.com>
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev6)
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
commit 37abc623899e8e6a1e29c95a9c55281edc979e35
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Tue Sep 22 08:34:21 2026 +0300

    Documentation/mm/hmm: document migration through hmm_range_fault()
    
    Describe the two new MIGRATE_VMA_FAULT / MIGRATE_VMA_WRITE flags of
    migrate_vma_setup(), and add a section on driving the migration
    collection phase directly from hmm_range_fault() via HMM_PFN_REQ_MIGRATE
    and migrate_hmm_range_setup().
    
    Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
+ /mt/dim checkpatch dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 drm-intel
2549541686b9 mm/Kconfig: changes for migrate on fault for device pages
9d869e31097c mm: add helper to convert HMM pfn to migrate pfn
-:179: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#179: FILE: mm/migrate_device.c:1584:
+
+}

total: 0 errors, 0 warnings, 1 checks, 138 lines checked
56ef952d875a mm/hmm: preparations for HMM to participate in migration
-:189: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#189: FILE: mm/hmm.c:420:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:211: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#211: FILE: mm/hmm.c:442:
+{
+

total: 0 errors, 0 warnings, 2 checks, 258 lines checked
babdfdf65f17 mm/hmm: do the plumbing for HMM to participate in migration
-:47: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#47: FILE: mm/hmm.c:52:
+	spinlock_t			*ptl;

-:55: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#55: FILE: mm/hmm.c:74:
+#define HMM_ASSERT_PTE_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked != locked)

-:58: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'locked' may be better as '(locked)' to avoid precedence issues
#58: FILE: mm/hmm.c:77:
+#define HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, locked)		\
+	WARN_ON_ONCE((hmm_vma_walk)->pmdlocked != locked)

-:61: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'hmm_vma_walk' - possible side-effects?
#61: FILE: mm/hmm.c:80:
+#define HMM_ASSERT_UNLOCKED(hmm_vma_walk)			\
+	WARN_ON_ONCE((hmm_vma_walk)->ptelocked ||		\
+		     (hmm_vma_walk)->pmdlocked)

-:92: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#92: FILE: mm/hmm.c:116:
+		end-addr == HPAGE_PMD_SIZE) {
 		   ^

-:216: CHECK:BRACES: braces {} should be used on all arms of this statement
#216: FILE: mm/hmm.c:464:
+		if (softleaf_is_device_private(entry)) {
[...]
 		else
[...]

-:334: CHECK:BRACES: braces {} should be used on all arms of this statement
#334: FILE: mm/hmm.c:625:
+	if (minfo) {
[...]
+	} else
[...]

-:338: CHECK:BRACES: Unbalanced braces around else statement
#338: FILE: mm/hmm.c:629:
+	} else

-:455: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#455: FILE: mm/hmm.c:724:
+
+	}

total: 0 errors, 0 warnings, 9 checks, 494 lines checked
bd8b1d36eec5 mm/hmm: implement folio split for migrate needs in HMM pagewalk
-:39: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#39: FILE: mm/hmm.c:521:
+	spinlock_t *ptl;

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
473aa0c03ac2 mm/hmm: migrate collection in HMM pagewalk - pte level
7d91037a5f88 mm/hmm: migrate collection in HMM pagewalk - pmd level
781c02917e09 mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
3064a5a59e73 mm/hmm: implement rollback for device page migration in HMM pagewalk
-:163: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#163: FILE: mm/hmm.c:606:
+
+		}

total: 0 errors, 0 warnings, 1 checks, 164 lines checked
f26a7a295a3b mm: enable device page migration from HMM pagewalk
15198e9f4a06 lib/test_hmm: add a new testcase for the migrate on fault
-:176: CHECK:LINE_SPACING: Please don't use multiple blank lines
#176: FILE: lib/test_hmm.c:1491:
+
+

-:251: CHECK:LINE_SPACING: Please don't use multiple blank lines
#251: FILE: tools/testing/selftests/mm/hmm-tests.c:948:
 
+

total: 0 errors, 0 warnings, 2 checks, 259 lines checked
37abc623899e Documentation/mm/hmm: document migration through hmm_range_fault()


