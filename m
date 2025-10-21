Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB96CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 04:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871CC10E080;
	Tue, 21 Oct 2025 04:35:30 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4110E080;
 Tue, 21 Oct 2025 04:35:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_sriov=5Fadmin_s?=
 =?utf-8?q?ysfs_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 04:35:29 -0000
Message-ID: <176102132936.35862.15008657538469731527@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

Series: PF: Add sriov_admin sysfs tree
URL   : https://patchwork.freedesktop.org/series/156220/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13f05e6c26216162a6efd86b0dc79bbaf0ebde65
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Oct 20 20:24:14 2025 +0200

    drm/xe/pf: Add documentation for sriov_admin attributes
    
    Add initial documentation for all recently added Xe driver
    specific SR-IOV sysfs files located under device/sriov_admin.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch fb865fb539163448d03b35681ea275805a556b96 drm-intel
9aecdc1ff3c9 drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-:111: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#111: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:38:
+};
+#define to_xe_sriov_kobj(p) container_of_const((p), struct xe_sriov_kobj, base)

-:118: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#118: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:45:
+};
+#define to_xe_sriov_dev_attr(p) container_of_const((p), struct xe_sriov_dev_attr, attr)

-:137: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#137: FILE: drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c:64:
+};
+#define to_xe_sriov_vf_attr(p) container_of_const((p), struct xe_sriov_vf_attr, attr)

total: 0 errors, 1 warnings, 3 checks, 359 lines checked
679489b3549b drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
c625cd9787c0 drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
0053259320e8 drm/xe/pf: Relax report helper to accept PF in bulk configs
4d89963f07e1 drm/xe/pf: Add functions to bulk configure EQ/PT on GT
b274b73d482c drm/xe/pf: Add functions to bulk provision EQ/PT
4ce8b6446285 drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
4fe594eac1eb drm/xe/pf: Add functions to provision scheduling priority
47c88211fdb8 drm/xe/pf: Allow bulk change all VFs priority using sysfs
0cab92b9e72f drm/xe/pf: Allow change PF scheduling priority using sysfs
b06bdf8e7e91 drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
0893681ba45e drm/xe/pf: Add sysfs device symlinks to enabled VFs
2b7f0e0c6567 drm/xe/pf: Allow to stop and reset VF using sysfs
13f05e6c2621 drm/xe/pf: Add documentation for sriov_admin attributes
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 164 lines checked


