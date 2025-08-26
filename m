Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0A8CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 19:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5410E37F;
	Tue, 26 Aug 2025 19:40:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CC310E37F;
 Tue, 26 Aug 2025 19:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Add_err?=
 =?utf-8?q?or_injection_support_to_lock_and_prep_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 19:40:45 -0000
Message-ID: <175623724521.271012.1451138140357071668@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826185416.94640-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250826185416.94640-4-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Add error injection support to lock and prep (rev2)
URL   : https://patchwork.freedesktop.org/series/153526/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
03e36ca5e79ad27647d45144ad8a876e65878922
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit db0d3677a18ee6066f677be6d9f9a8f26b8e40ec
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Aug 26 18:54:19 2025 +0000

    drm/xe/xe_vm: Add error injection support to lock and prep
    
    Add error injection support to the function
    vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
    as noinline.
    
    v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
    injection is enabled (Brost)
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <john.c.harrison@intel.com>
+ /mt/dim checkpatch 3a2760f3080e5188b19cdb4640cec5eb0926d578 drm-intel
652f14ab820a Revert "drm/xe: Add VM bind IOCTL error injection"
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
db0d3677a18e drm/xe/xe_vm: Add error injection support to lock and prep


