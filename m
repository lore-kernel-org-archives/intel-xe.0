Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9134CF8854
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 12:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F6410E0F4;
	Thu, 20 Nov 2025 12:59:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4CE10E0F4;
 Thu, 20 Nov 2025 12:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_locking/ww=5Fmutex=2C_dma?=
 =?utf-8?q?-buf/dma-resv=3A_Improve_detection_of_unheld_locks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 12:59:52 -0000
Message-ID: <176364359238.13788.11194643078454624359@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
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

Series: locking/ww_mutex, dma-buf/dma-resv: Improve detection of unheld locks
URL   : https://patchwork.freedesktop.org/series/157838/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4df64eb786b4699192d7484ad4b1d021d280f67a
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Nov 20 12:03:41 2025 +0100

    dma-buf/dma-resv: Improve the dma-resv lockdep checks
    
    Ensure that dma_resv_held() and dma_resv_assert_held() operate
    on individual reservation objects within a WW transaction rather
    than on the reservation WW class.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 13909978d70fc4ded88b778a313b68ad86ba881a drm-intel
acc0c24b346f kernel/locking/ww_mutex: Add per-lock lock-check helpers
4df64eb786b4 dma-buf/dma-resv: Improve the dma-resv lockdep checks
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#25: FILE: include/linux/dma-resv.h:311:
+#define dma_resv_held(obj) (lockdep_is_held(&(obj)->lock.base) && ww_mutex_held(&(obj)->lock))

-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'obj' - possible side-effects?
#26: FILE: include/linux/dma-resv.h:312:
+#define dma_resv_assert_held(obj) do {			\
+		lockdep_assert_held(&(obj)->lock.base); \
+		ww_mutex_assert_held(&(obj)->lock);	\
+	} while (0)

total: 0 errors, 0 warnings, 2 checks, 13 lines checked


