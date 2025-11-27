Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12F2CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 10:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26A10E7ED;
	Thu, 27 Nov 2025 10:31:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B58010E7F3;
 Thu, 27 Nov 2025 10:31:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_vfio/xe=3A_Add_driver_var?=
 =?utf-8?q?iant_for_Xe_VF_migration_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 10:31:14 -0000
Message-ID: <176423947463.33971.8326006712817383761@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
In-Reply-To: <20251127093934.1462188-1-michal.winiarski@intel.com>
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

Series: vfio/xe: Add driver variant for Xe VF migration (rev7)
URL   : https://patchwork.freedesktop.org/series/155785/
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
commit 88caa003e8a0a8a330275b25d6d28d02f5cfd302
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Thu Nov 27 10:39:34 2025 +0100

    vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
    
    In addition to generic VFIO PCI functionality, the driver implements
    VFIO migration uAPI, allowing userspace to enable migration for Intel
    Graphics SR-IOV Virtual Functions.
    The driver binds to VF device and uses API exposed by Xe driver to
    transfer the VF migration data under the control of PF device.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
+ /mt/dim checkpatch e7a767430515c3a6e8aee91c2a68cba8b06fe884 drm-intel
3b3e7b6d7c45 drm/xe/pf: Enable SR-IOV VF migration
3de494b2269e drm/xe/pci: Introduce a helper to allow VF access to PF xe_device
1783ca2944e7 drm/xe/pf: Export helpers for VFIO
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

-:65: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#65: FILE: drivers/gpu/drm/xe/xe_sriov_vfio.c:30:
+#define DEFINE_XE_SRIOV_VFIO_FUNCTION(_type, _func, _impl)			\
+_type xe_sriov_vfio_##_func(struct xe_device *xe, unsigned int vfid)		\
+{										\
+	if (!IS_SRIOV_PF(xe))							\
+		return -EPERM;							\
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))			\
+		return -EINVAL;							\
+										\
+	guard(xe_pm_runtime_noresume)(xe);					\
+										\
+	return xe_sriov_pf_##_impl(xe, vfid);					\
+}										\
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_##_func, "xe-vfio-pci")

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

total: 1 errors, 1 warnings, 0 checks, 233 lines checked
88caa003e8a0 vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 612 lines checked


