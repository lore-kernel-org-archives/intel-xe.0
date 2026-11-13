Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6993606A321
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDAA10E781;
	Fri, 13 Nov 2026 07:43:12 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A4D10E763;
 Fri, 13 Nov 2026 07:43:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CI-ONLY_Fix_VM_teardown_a?=
 =?utf-8?q?nd_migration_queue_recovery_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 07:43:11 -0000
Message-ID: <179455579174.18509.7125819717350868552@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113073549.352746-1-arvind.yadav@intel.com>
In-Reply-To: <20261113073549.352746-1-arvind.yadav@intel.com>
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

Series: CI-ONLY Fix VM teardown and migration queue recovery (rev2)
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
commit a978e29bddfd6dbf8e3362c17c136d2fe576e8af
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Fri Nov 13 13:05:49 2026 +0530

    CI-ONLY:Defer VM teardown until exec queue cleanup
    
    Exec queue destruction is asynchronous. Closing a VM immediately after
    killing its queues can remove mappings before GuC cleanup has finished.
    
    Track the queues using each VM and keep the bind queue's user_vm
    reference until final queue destruction. Start queue cleanup before
    removing the VM mappings.
    
    The count includes VM-owned bind queues. Release the VM's references
    to these queues before waiting for their asynchronous cleanup.
    
    During file close, use one five-second wait budget across all VMs.
    If queues remain, defer VM close until the last queue is removed.
    The existing runtime-PM reference remains held during this wait.
    
    VM destroy does not wait for queue cleanup. If user exec queues still
    reference the VM, its mappings remain after the ioctl returns until
    those queues finish cleanup. Userspace must destroy the remaining queue
    handles or close the DRM file to release them.
    
    Run deferred VM close on the module-lifetime destroy workqueue.
    Hold an extra VM reference until the close worker has released its
    runtime-PM reference and unplug guard.
    
    File close and VM destroy do not wait for queue cleanup. If tracked
    queues remain, retain the VM mappings and defer teardown until the
    last queue is removed.
    
    This also applies to internal bind queues, so VM destroy may return
    before mappings are released even when no user exec queues remain.
    User queue handles must be destroyed, or the DRM file closed, before
    those queues can complete cleanup.
    
    v3:
    - Remove the deadline calculation and use zero wait explicitly on file close.
      (Tejas)
    - Document that internal bind queue cleanup can also defer VM teardown.
      (Sashiko)
    - Clarify that mappings remain until all tracked exec queues finish cleanup.
      (Sashiko)
    
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 0d65e35f60f0da2e3decb75324a8a979ea2113c9 drm-intel
6e0e72e968c8 CI_ONLY: Hold a device reference across deferred VM
adbfdfc963ae CI_ONLY Mark VMs as closing before queue cleanup
-:156: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#156: FILE: drivers/gpu/drm/xe/xe_pagefault.c:758:
+						 XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 0 errors, 1 warnings, 0 checks, 206 lines checked
a978e29bddfd CI-ONLY:Defer VM teardown until exec queue cleanup
-:39: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#39: 
- Remove the deadline calculation and use zero wait explicitly on file close.

total: 0 errors, 1 warnings, 0 checks, 325 lines checked


