Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7171A606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A71D10F05C;
	Mon, 16 Nov 2026 12:49:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4F10F05C;
 Mon, 16 Nov 2026 12:49:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Do_not_trig?=
 =?utf-8?q?ger_TDR_from_the_memory_CAT_error_handler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 12:49:52 -0000
Message-ID: <179483339242.30722.3497911002821635622@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116102020.1567127-1-arvind.yadav@intel.com>
In-Reply-To: <20261116102020.1567127-1-arvind.yadav@intel.com>
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

Series: drm/xe/guc: Do not trigger TDR from the memory CAT error handler
URL   : https://patchwork.freedesktop.org/series/178669/
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
commit 0420e8b334a6f2cdef2ac9f85f018b204fc7b7c9
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Mon Nov 16 15:50:20 2026 +0530

    drm/xe/guc: Do not trigger TDR from the memory CAT error handler
    
    The memory CAT error handler uses the same cleanup path as the
    context-reset handler. This immediately triggers the TDR, which can
    send a scheduling-disable request before the context-reset notification
    arrives.
    
    On a BMG dGPU, an early disable after a CCS memory CAT error is
    associated with subsequent contexts being enabled but never starting
    work. Recovery occurs later when a scheduling-disable timeout triggers
    a GT reset.
    
    Separate waking user-fence waiters from triggering the TDR. On a memory
    CAT notification, mark the queue reset and wake waiters without starting
    the TDR. Keep the existing cleanup triggered by the context-reset
    notification.
    
    Leave the uncorrectable-error and CGP context-error paths unchanged.
    
    Tested on a BMG dGPU using a standalone SYCL reproducer with two
    separate processes.
    
    The first process submits a kernel that reads an unmapped GPU address,
    causing a page fault followed by a memory CAT error. It then calls
    abort() without waiting for the kernel to finish.
    
    After that process exits, a second process, called "victim", starts.
    It submits a simple kernel that writes 7 to a device allocation,
    copies the value back to the CPU and checks the result.
    
    Without the patch, the victim can hang and reach its 60-second
    userspace timeout. With the patch, the victim completed and returned
    the expected value in all tested rounds where the first process triggered
    the fault.
    
    Recovery without a context-reset notification still needs confirmation,
    particularly for LR queues, which have no normal finite job timeout.
    Independent queue-kill and cleanup paths are unchanged.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Assisted-by: LLM
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 038b4cc7dba91006374b26c220bdad77c5d6bb42 drm-intel
0420e8b334a6 drm/xe/guc: Do not trigger TDR from the memory CAT error handler
-:52: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#52: 
Assisted-by: LLM

-:52: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#52: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 110 lines checked


