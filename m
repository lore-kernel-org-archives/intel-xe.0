Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034BCCF9E3
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 02:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628A10E975;
	Fri, 31 Oct 2025 02:09:44 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584B310E975;
 Fri, 31 Oct 2025 02:09:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_sriov=5Fadmin_s?=
 =?utf-8?q?ysfs_tree_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 02:09:43 -0000
Message-ID: <176187658335.2567.9665242048703540251@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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

Series: PF: Add sriov_admin sysfs tree (rev3)
URL   : https://patchwork.freedesktop.org/series/156220/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a414e01d7c447d1898553e46f334d079e5c28643
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Oct 30 23:23:48 2025 +0100

    drm/xe/pf: Add documentation for sriov_admin attributes
    
    Add initial documentation for all recently added Xe driver
    specific SR-IOV sysfs files located under device/sriov_admin.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 31f6cf867833cb67c289427c7cfe00d35d0fd340 drm-intel
85a1245bd093 drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

-:113: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#113: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:38:
+};
+#define to_xe_sriov_kobj(p) container_of_const((p), struct xe_sriov_kobj, base)

-:120: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#120: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:45:
+};
+#define to_xe_sriov_dev_attr(p) container_of_const((p), struct xe_sriov_dev_attr, attr)

-:139: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#139: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:64:
+};
+#define to_xe_sriov_vf_attr(p) container_of_const((p), struct xe_sriov_vf_attr, attr)

total: 0 errors, 1 warnings, 3 checks, 351 lines checked
a4b9c93968d9 drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
73ce7f423eba drm/xe/pf: Add _locked variants of the VF EQ config functions
ed960ce0007b drm/xe/pf: Add _locked variants of the VF PT config functions
b6dab034a1d6 drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
4da156e0a5b8 drm/xe/pf: Relax report helper to accept PF in bulk configs
e22f42915bda drm/xe/pf: Fix signature of internal config helpers
aa4511760f0f drm/xe/pf: Add functions to bulk configure EQ/PT on GT
307b75904a89 drm/xe/pf: Add functions to bulk provision EQ/PT
3dd443266a18 drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
bb9466ff0836 drm/xe/pf: Add functions to provision scheduling priority
f62b3e705d71 drm/xe/pf: Allow bulk change all VFs priority using sysfs
9a60857fee29 drm/xe/pf: Allow change PF scheduling priority using sysfs
6bef54ef7446 drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
3a56efa1d2cf drm/xe/pf: Add sysfs device symlinks to enabled VFs
998e8c7586ec drm/xe/pf: Allow to stop the VF using sysfs
a414e01d7c44 drm/xe/pf: Add documentation for sriov_admin attributes
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 159 lines checked


