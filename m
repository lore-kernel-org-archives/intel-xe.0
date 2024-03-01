Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ECAC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 22:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596310ED70;
	Fri,  1 Mar 2024 22:53:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E3610ED79;
 Fri,  1 Mar 2024 22:53:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe=5Fsync_and_ufence_rewo?=
 =?utf-8?q?rk_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 22:53:52 -0000
Message-ID: <170933363240.453379.1072124167614404319@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301224919.271153-1-matthew.brost@intel.com>
In-Reply-To: <20240301224919.271153-1-matthew.brost@intel.com>
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

Series: xe_sync and ufence rework (rev3)
URL   : https://patchwork.freedesktop.org/series/130418/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 445cdb330e08a81b258cbf89c71538f6faea8fa4
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Mar 1 14:49:19 2024 -0800

    drm/xe: Use get_user / put_user with memory barriers for ufence
    
    Better aligns with atomic semantics than copy to/from user.
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5f60548dd58e2ad93005c933fd2633d98db60de4 drm-intel
fbc941b4cd5f drm/xe: Remove used xe_sync_entry_wait
f4c8ba4649ae drm/xe: Validate user fence during creation
64c8290a9f33 drm/xe: Get page on user fence creation
445cdb330e08 drm/xe: Use get_user / put_user with memory barriers for ufence
-:28: WARNING:MEMORY_BARRIER: memory barrier without comment
#28: FILE: drivers/gpu/drm/xe/xe_sync.c:121:
+			smp_mb();

-:46: WARNING:MEMORY_BARRIER: memory barrier without comment
#46: FILE: drivers/gpu/drm/xe/xe_wait_user_fence.c:25:
+	smp_mb();

total: 0 errors, 2 warnings, 0 checks, 26 lines checked


