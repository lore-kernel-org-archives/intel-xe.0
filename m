Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC78CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ADD10E657;
	Tue, 28 Oct 2025 20:04:16 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7F10E657;
 Tue, 28 Oct 2025 20:04:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_sriov=5Fadmin_s?=
 =?utf-8?q?ysfs_tree_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 20:04:14 -0000
Message-ID: <176168185457.64512.5015047025624720899@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

Series: PF: Add sriov_admin sysfs tree (rev2)
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
commit f6141c36cae75be0b1c36528d9fb8468061c86a3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Oct 28 18:58:31 2025 +0100

    drm/xe/pf: Add documentation for sriov_admin attributes
    
    Add initial documentation for all recently added Xe driver
    specific SR-IOV sysfs files located under device/sriov_admin.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5742fc7aea99a1326637a7106eeaeac383a1c76d drm-intel
0667d84d2e7e drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
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
b135a846f302 drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
393647c83584 drm/xe/pf: Add _locked variants of the VF EQ config functions
58b46519d40d drm/xe/pf: Add _locked variants of the VF PT config functions
1e6f55064bea drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
fb6496ce1a70 drm/xe/pf: Relax report helper to accept PF in bulk configs
efd1a6f75dea drm/xe/pf: Fix signature of internal config helpers
4dfa7187b7e5 drm/xe/pf: Add functions to bulk configure EQ/PT on GT
6b77fe60867b drm/xe/pf: Add functions to bulk provision EQ/PT
fa60cb7d7de6 drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
55f66cdfe909 drm/xe/pf: Add functions to provision scheduling priority
e9f8292db5e0 drm/xe/pf: Allow bulk change all VFs priority using sysfs
fd064967c84c drm/xe/pf: Allow change PF scheduling priority using sysfs
475c07951324 drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
abc373ff2aef drm/xe/pf: Add sysfs device symlinks to enabled VFs
d4a9f39b9933 drm/xe/pf: Allow to stop and reset VF using sysfs
f6141c36cae7 drm/xe/pf: Add documentation for sriov_admin attributes
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 160 lines checked


