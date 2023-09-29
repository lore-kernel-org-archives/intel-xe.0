Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A41E7734B
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 23:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6F10E0F7;
	Fri, 29 Sep 2023 23:10:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9BA610E0F7;
 Fri, 29 Sep 2023 23:09:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C84CFAADF1;
 Fri, 29 Sep 2023 23:09:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 29 Sep 2023 23:09:59 -0000
Message-ID: <169602899981.19499.10431783926740586221@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe=3A_Kill_xe=5Fbo=5Fdoc=2Eh?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/3] drm/xe: Kill xe_bo_doc.h
URL   : https://patchwork.freedesktop.org/series/124476/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 288bf7cb5a0ee2cccde14860a6f6c6ee44e0b230
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Sep 29 17:01:28 2023 -0400

    drm/xe: Kill xe_vm_doc.h
    
    Keep the documentation inside the code.
    No update to the documentation itself at this time.
    Let's first ensure that the entire documentation is closer
    to the relevant code, otherwise it will get very easily outdated.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 22fcf2404f56a8e7aea6734298e0b2b265136313 drm-intel
88c056706 drm/xe: Kill xe_bo_doc.h
-:209: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#209: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 184 lines checked
434c41f7d drm/xe: Kill xe_migrate_doc.h
-:116: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#116: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
288bf7cb5 drm/xe: Kill xe_vm_doc.h
-:79: WARNING:TYPO_SPELLING: 'addres' may be misspelled - perhaps 'address'?
#79: FILE: drivers/gpu/drm/xe/xe_vm.c:95:
+ *	update page level 3a PTE[511] to BO2 phys addres (GPU)
   	                                          ^^^^^^

-:80: WARNING:TYPO_SPELLING: 'addres' may be misspelled - perhaps 'address'?
#80: FILE: drivers/gpu/drm/xe/xe_vm.c:96:
+ *	update page level 3b PTE[0] to BO2 phys addres + 0x1000 (GPU)
   	                                        ^^^^^^

-:207: WARNING:TYPO_SPELLING: 'overriden' may be misspelled - perhaps 'overridden'?
#207: FILE: drivers/gpu/drm/xe/xe_vm.c:223:
+ * use). This behavior can be overriden by setting the flag
                               ^^^^^^^^^

-:224: WARNING:TYPO_SPELLING: 'poiter' may be misspelled - perhaps 'pointer'?
#224: FILE: drivers/gpu/drm/xe/xe_vm.c:240:
+ * a user poiter is about to move. The invalidation notifier needs to block
           ^^^^^^

-:571: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#571: 
deleted file mode 100644

total: 0 errors, 5 warnings, 0 checks, 552 lines checked


