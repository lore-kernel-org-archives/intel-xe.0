Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3EFC44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EF310EC17;
	Wed, 22 Jul 2026 04:48:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7001310E350;
 Wed, 22 Jul 2026 04:48:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/3=5D?=
 =?utf-8?q?_mm/huge=5Fmemory=3A_add_folio=5Fsplit=5Fdriver=5Fmanaged=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 04:48:07 -0000
Message-ID: <178469568745.214466.13500155766396073866@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722044220.1110278-1-matthew.brost@intel.com>
In-Reply-To: <20260722044220.1110278-1-matthew.brost@intel.com>
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

Series: series starting with [1/3] mm/huge_memory: add folio_split_driver_managed()
URL   : https://patchwork.freedesktop.org/series/170875/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/mm.h:31,
                 from ../include/linux/pid_namespace.h:7,
                 from ../include/linux/ptrace.h:10,
                 from ../include/linux/audit.h:13,
                 from ../arch/um/kernel/asm-offsets.c:8:
../include/linux/pgtable.h: In function ‘pmdp_test_and_clear_young’:
../include/linux/pgtable.h:553:17: error: implicit declaration of function ‘set_pmd_at’; did you mean ‘set_pte_at’? [-Werror=implicit-function-declaration]
  553 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
      |                 ^~~~~~~~~~
      |                 set_pte_at
../include/linux/pgtable.h:553:55: error: implicit declaration of function ‘pmd_mkold’; did you mean ‘pte_mkold’? [-Werror=implicit-function-declaration]
  553 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
      |                                                       ^~~~~~~~~
      |                                                       pte_mkold
../include/linux/pgtable.h: In function ‘pmd_mkwrite’:
../include/linux/pgtable.h:1060:16: error: implicit declaration of function ‘pmd_mkwrite_novma’; did you mean ‘pte_mkwrite_novma’? [-Werror=implicit-function-declaration]
 1060 |         return pmd_mkwrite_novma(pmd);
      |                ^~~~~~~~~~~~~~~~~
      |                pte_mkwrite_novma
../include/linux/pgtable.h:1060:16: error: incompatible types when returning type ‘int’ but ‘pmd_t’ was expected
 1060 |         return pmd_mkwrite_novma(pmd);
      |                ^~~~~~~~~~~~~~~~~~~~~~
../include/linux/pgtable.h: In function ‘pmdp_set_wrprotect’:
../include/linux/pgtable.h:1241:39: error: implicit declaration of function ‘pmd_wrprotect’; did you mean ‘pte_wrprotect’? [-Werror=implicit-function-declaration]
 1241 |         set_pmd_at(mm, address, pmdp, pmd_wrprotect(old_pmd));
      |                                       ^~~~~~~~~~~~~
      |                                       pte_wrprotect
In file included from ../include/linux/mm.h:1790:
../include/linux/huge_mm.h: In function ‘pmd_is_huge’:
../include/linux/huge_mm.h:449:24: error: implicit declaration of function ‘pmd_trans_huge’; did you mean ‘pud_trans_huge’? [-Werror=implicit-function-declaration]
  449 |                 return pmd_trans_huge(pmd);
      |                        ^~~~~~~~~~~~~~
      |                        pud_trans_huge
../include/linux/mm.h: In function ‘folio_mk_pmd’:
../include/linux/mm.h:2608:16: error: implicit declaration of function ‘pmd_mkhuge’; did you mean ‘pmd_is_huge’? [-Werror=implicit-function-declaration]
 2608 |         return pmd_mkhuge(pfn_pmd(folio_pfn(folio), pgprot));
      |                ^~~~~~~~~~
      |                pmd_is_huge
../include/linux/mm.h:2608:16: error: incompatible types when returning type ‘int’ but ‘pmd_t’ was expected
 2608 |         return pmd_mkhuge(pfn_pmd(folio_pfn(folio), pgprot));
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [../scripts/Makefile.build:184: arch/um/kernel/asm-offsets.s] Error 1
make[2]: *** [/kernel/Makefile:1405: prepare0] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[04:47:55] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[04:48:00] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


