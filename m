Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978DD606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 09:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D46310E0CC;
	Sun, 15 Nov 2026 09:03:18 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925910E0CC;
 Sun, 15 Nov 2026 09:03:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CI-ONLY_Fix_VM_teardown_a?=
 =?utf-8?q?nd_migration_queue_recovery_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 15 Nov 2026 09:03:16 -0000
Message-ID: <179473339649.26154.7280551399574232372@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261115085518.1135138-1-arvind.yadav@intel.com>
In-Reply-To: <20261115085518.1135138-1-arvind.yadav@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: CI-ONLY Fix VM teardown and migration queue recovery (rev4)
URL   : https://patchwork.freedesktop.org/series/178420/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fed99c9ae88b51301af575a97499992876a8662c
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Sun Nov 15 14:25:18 2026 +0530

    CI-ONLY:Defer VM teardown until exec queue cleanup
    
    Exec queue destruction continues after xe_exec_queue_put() returns.
    User queues can also outlive the VM handle. Closing the VM before
    those queues finish cleanup can remove mappings still in use.
    
    Track user exec queues and user-created bind queues until final queue
    destruction. Add each close count under vm->lock so VM close cannot
    miss a queue being created. Keep the bind queue's user_vm reference
    until final queue destruction.
    
    If tracked queues remain, retain the mappings and defer VM close
    until the last queue is freed. Keep the existing scheduling-disable
    wait on file close without adding a wait for the close count.
    
    VM destroy can therefore return while mappings remain. Userspace
    must destroy the remaining queue handles or close the DRM file
    before those queues can finish cleanup.
    
    Let pending user bind jobs drain during file close and queue destroy.
    Killing these queues can make pending PT bind jobs clear mappings
    while hardware queues still use them.
    
    Exclude the VM-owned bind queue from the close count. Release it
    after xe_vm_close() has waited for DMA_RESV_USAGE_BOOKKEEP fences.
    
    Reject exec requests on closing VMs before userptr pinning, out-sync
    signaling and rebind. Run deferred close on the module-lifetime
    destroy workqueue and hold an extra VM reference until the worker
    has released its runtime-PM reference and unplug guard.
    
    v3:
    - Remove the deadline calculation and use zero wait explicitly on file close.
      (Tejas)
    - Document that internal bind queue cleanup can also defer VM teardown.
      (Sashiko)
    - Clarify that mappings remain until all tracked exec queues finish cleanup.
      (Sashiko)
    
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 419bb0e4cadd214a0847010c02ade95e5fc511f7 drm-intel
33eec497aea8 CI-ONLY Hold a device reference across deferred VM destruction
8f2d2eb836a8 CI-ONLY Mark VMs as closing before queue cleanup
-:158: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#158: FILE: drivers/gpu/drm/xe/xe_pagefault.c:760:
+						 XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 0 errors, 1 warnings, 0 checks, 208 lines checked
fed99c9ae88b CI-ONLY:Defer VM teardown until exec queue cleanup
-:36: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#36: 
- Remove the deadline calculation and use zero wait explicitly on file close.

total: 0 errors, 1 warnings, 0 checks, 353 lines checked


