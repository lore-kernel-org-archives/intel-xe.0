Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90DCCA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C2910E6B2;
	Tue, 26 Aug 2025 17:56:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6DD10E6B2;
 Tue, 26 Aug 2025 17:56:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Add_err?=
 =?utf-8?q?or_injection_support_to_lock_and_prep?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 17:56:08 -0000
Message-ID: <175623096857.271012.1025409149982360412@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826175051.92563-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250826175051.92563-4-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Add error injection support to lock and prep
URL   : https://patchwork.freedesktop.org/series/153526/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3d03f9c7415eef22222cbd23bd34661d54379252
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 73508b9472631ad184131f484040e68059438b04
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Aug 26 17:50:54 2025 +0000

    drm/xe/xe_vm: Add error injection support to lock and prep
    
    Add error injection support to the function
    vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
    as noinline.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <john.c.harrison@intel.com>
+ /mt/dim checkpatch 4b94f8fef771cb0b1d0131675e2d794ef6464907 drm-intel
dcb2f26d90e7 Revert "drm/xe: Add VM bind IOCTL error injection"
-:96: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#96: FILE: drivers/gpu/drm/xe/xe_vm.c:3464:
+#define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

total: 1 errors, 0 warnings, 0 checks, 121 lines checked
73508b947263 drm/xe/xe_vm: Add error injection support to lock and prep


