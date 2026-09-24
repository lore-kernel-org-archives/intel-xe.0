Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4747EC98314
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 07:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E5310F353;
	Thu, 24 Sep 2026 07:28:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABB010F353;
 Thu, 24 Sep 2026 07:28:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Migrate_on_fault_for_devi?=
 =?utf-8?q?ce_pages_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 07:28:06 -0000
Message-ID: <179023488662.201188.15792260951026821205@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260924065313.899730-1-mpenttil@redhat.com>
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
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

Series: Migrate on fault for device pages (rev7)
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
commit f40ee1d9d3eca569bc0c7ce5ab4f021878d5a37c
Author: Mika Penttilä <mpenttil@redhat.com>
Date:   Thu Sep 24 09:53:13 2026 +0300

    Documentation/mm/hmm: document migration through hmm_range_fault()
    
    Describe the two new MIGRATE_VMA_FAULT / MIGRATE_VMA_WRITE flags of
    migrate_vma_setup(), and add a section on driving the migration
    collection phase directly from hmm_range_fault() via HMM_PFN_REQ_MIGRATE
    and migrate_hmm_range_setup().
    
    Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
+ /mt/dim checkpatch 1a702d79afe36153e37dd9784fde95f9f86ea03f drm-intel
6af278ad99a7 mm/Kconfig: changes for migrate on fault for device pages
007b00d9e503 mm: add helper to convert HMM pfn to migrate pfn
-:179: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#179: FILE: mm/migrate_device.c:1584:
+
+}

total: 0 errors, 0 warnings, 1 checks, 138 lines checked
232b61ad1b9c mm/hmm: preparations for HMM to participate in migration
-:191: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'hmm_vma_walk->vma != walk->vma'
#191: FILE: mm/hmm.c:422:
+	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))

-:214: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#214: FILE: mm/hmm.c:445:
+{
+

total: 0 errors, 0 warnings, 2 checks, 261 lines checked
73b7a99a0e4b mm/hmm: do the plumbing for HMM to participate in migration
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

-:430: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#430: FILE: mm/hmm.c:702:
+
+	}

total: 0 errors, 0 warnings, 9 checks, 483 lines checked
202ddf1d60dc mm/hmm: migrate collection in HMM pagewalk - pte level
de9005d71aaa mm/hmm: migrate collection in HMM pagewalk - pmd level
43288536a090 mm/hmm: add lazy MMU mode support for migration in HMM pagewalk
7626c9123cf3 mm/hmm: implement rollback for device page migration in HMM pagewalk
-:163: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#163: FILE: mm/hmm.c:624:
+
+		}

total: 0 errors, 0 warnings, 1 checks, 164 lines checked
1a74dce20970 mm: enable device page migration from HMM pagewalk
4b3f93e8f377 lib/test_hmm: add a new testcase for the migrate on fault
-:246: CHECK:LINE_SPACING: Please don't use multiple blank lines
#246: FILE: lib/test_hmm.c:1515:
+
+

-:321: CHECK:LINE_SPACING: Please don't use multiple blank lines
#321: FILE: tools/testing/selftests/mm/hmm-tests.c:948:
 
+

total: 0 errors, 0 warnings, 2 checks, 326 lines checked
f40ee1d9d3ec Documentation/mm/hmm: document migration through hmm_range_fault()


