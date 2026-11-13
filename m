Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754F606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 07:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0710E449;
	Fri, 13 Nov 2026 07:02:05 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C05F10E449;
 Fri, 13 Nov 2026 07:02:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Account_for_exe?=
 =?utf-8?q?c_queue_cleanup_after_handle_allocation_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 07:02:04 -0000
Message-ID: <179455332410.18478.10570221018246243628@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113065437.249640-1-arvind.yadav@intel.com>
In-Reply-To: <20261113065437.249640-1-arvind.yadav@intel.com>
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

Series: drm/xe: Account for exec queue cleanup after handle allocation fails
URL   : https://patchwork.freedesktop.org/series/178457/
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
commit b3d1027cda1fef46712dc7ec9727f31d15c78c29
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Fri Nov 13 12:24:36 2026 +0530

    drm/xe: Account for exec queue cleanup after handle allocation fails
    
    xe_exec_queue_create_ioctl() assigns q->xef before allocating the
    userspace handle. If xa_alloc() fails, queue finalization decrements
    pending_removal even though the queue was never removed from the
    xarray and the counter was never incremented.
    
    This can leave pending_removal negative and block fdinfo readers
    waiting for it to reach zero.
    
    Increment pending_removal before unwinding the failed allocation.
    The existing finalization path balances the increment.
    
    Fixes: 0fd4380c050d ("drm/xe: Wait on killed exec queues")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Assisted-by: LLM
    Closes: https://sashiko.dev/#/bug/linux-0e3ad548-c571-43d0-bf6b-00ed4771bd7a
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch 0d65e35f60f0da2e3decb75324a8a979ea2113c9 drm-intel
b3d1027cda1f drm/xe: Account for exec queue cleanup after handle allocation fails
-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#27: 
Assisted-by: LLM

-:27: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#27: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 15 lines checked


