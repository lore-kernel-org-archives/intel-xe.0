Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA0D1F9BE
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 11:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FFE10E8FF;
	Thu,  4 Dec 2025 11:17:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7710E1D0;
 Thu,  4 Dec 2025 11:17:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe=3A_fix_drm=5Fgpusvm=5F?=
 =?utf-8?q?init=28=29_arguments?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 11:17:47 -0000
Message-ID: <176484706783.56855.13025272003417784049@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204094704.1030933-1-arnd@kernel.org>
In-Reply-To: <20251204094704.1030933-1-arnd@kernel.org>
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

Series: xe: fix drm_gpusvm_init() arguments
URL   : https://patchwork.freedesktop.org/series/158484/
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
commit 0b5b120138bdf3fb11d3d105aaed1ec706c35da5
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Dec 4 10:46:58 2025 +0100

    xe: fix drm_gpusvm_init() arguments
    
    The Xe driver fails to build when CONFIG_DRM_XE_GPUSVM is disabled
    but CONFIG_DRM_GPUSVM is turned on, jdue to the clash of two commits:
    
    In file included from drivers/gpu/drm/xe/xe_vm_madvise.c:8:
    drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_init':
    include/linux/stddef.h:8:14: error: passing argument 5 of 'drm_gpusvm_init' makes integer from pointer without a cast [-Wint-conversion]
    drivers/gpu/drm/xe/xe_svm.h:217:38: note: in expansion of macro 'NULL'
      217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
          |                                      ^~~~
    In file included from drivers/gpu/drm/xe/xe_bo_types.h:11,
                     from drivers/gpu/drm/xe/xe_bo.h:11,
                     from drivers/gpu/drm/xe/xe_vm_madvise.c:11:
    include/drm/drm_gpusvm.h:254:35: note: expected 'long unsigned int' but argument is of type 'void *'
      254 |                     unsigned long mm_start, unsigned long mm_range,
          |                     ~~~~~~~~~~~~~~^~~~~~~~
    In file included from drivers/gpu/drm/xe/xe_vm_madvise.c:14:
    drivers/gpu/drm/xe/xe_svm.h:216:16: error: too many arguments to function 'drm_gpusvm_init'; expected 10, have 11
      216 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
          |                ^~~~~~~~~~~~~~~
      217 |                                NULL, NULL, 0, 0, 0, NULL, NULL, 0);
          |                                                                 ~
    include/drm/drm_gpusvm.h:251:5: note: declared here
    
    Adapt the caller to the new argument list by removing the extraneous
    NULL argument.
    
    Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
    Fixes: 10aa5c806030 ("drm/gpusvm, drm/xe: Fix userptr to not allow device private pages")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 4eb27c4b4b45606c79769918ab8736249f94035a drm-intel
0b5b120138bd xe: fix drm_gpusvm_init() arguments
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  216 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


