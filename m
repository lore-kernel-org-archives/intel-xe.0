Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39A7C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC73A10E083;
	Mon, 12 Aug 2024 02:52:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE4410E083;
 Mon, 12 Aug 2024 02:52:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_ULLS_for_kernel_submissio?=
 =?utf-8?q?n_of_migration_jobs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 02:52:11 -0000
Message-ID: <172343113118.593178.14386534151901931475@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812024717.3584636-1-matthew.brost@intel.com>
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Series: ULLS for kernel submission of migration jobs
URL   : https://patchwork.freedesktop.org/series/137128/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1077244721711a077818fe095f01d2a54627469c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Aug 11 19:47:17 2024 -0700

    drm/xe: Enable ULLS migration jobs when opening LR VM
    
    Call xe_migration_lr_vm_get upon opening LR VM and
    xe_migration_lr_vm_put upon close.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a95e3e46063ddcea598b2ac865173debffba13fe drm-intel
6b0533811835 drm/xe: Add xe_hw_engine_write_ring_tail
-:8: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost <matthew.brost@intel.com'
#8: 
Signed-off-by: Matthew Brost <matthew.brost@intel.com

-:41: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 0 warnings, 0 checks, 22 lines checked
d164817fd078 drm/xe: Add ULLS support to LRC
-:49: WARNING:MACRO_ARG_UNUSED: Argument 'lrc' is not used in function-like macro
#49: FILE: drivers/gpu/drm/xe/xe_lrc.c:1227:
+#define semaphore_offset(lrc, seqno) \
+	(sizeof(u32) * (seqno % LRC_MIGRATION_ULLS_SEMAPORE_COUNT))

-:49: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'seqno' may be better as '(seqno)' to avoid precedence issues
#49: FILE: drivers/gpu/drm/xe/xe_lrc.c:1227:
+#define semaphore_offset(lrc, seqno) \
+	(sizeof(u32) * (seqno % LRC_MIGRATION_ULLS_SEMAPORE_COUNT))

total: 0 errors, 1 warnings, 1 checks, 90 lines checked
a9f7855374e5 drm/xe: Add ULLS flags for jobs
9930ad5264c5 drm/xe: Add ULLS migration job support to migration layer
-:98: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#98: FILE: drivers/gpu/drm/xe/xe_migrate.c:794:
+		uint64_t batch_addr[2] = { 0, 0 };

total: 0 errors, 0 warnings, 1 checks, 223 lines checked
2ddbc3ff073e drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
e203487a300a drm/xe: Add ULLS migration job support to ring ops
73470e92d4fb drm/xe: Add ULLS migration job support to GuC submission
-:7: WARNING:TYPO_SPELLING: 'supress' may be misspelled - perhaps 'suppress'?
#7: 
tail for ULLS, set current job sempahore, and supress submit H2G for
                                              ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 76 lines checked
107724472171 drm/xe: Enable ULLS migration jobs when opening LR VM


