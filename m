Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90517C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92510E1D1;
	Wed, 28 May 2025 07:15:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446B10E062;
 Wed, 28 May 2025 07:15:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_VF_resizable_BAR_?=
 =?utf-8?q?=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 07:15:54 -0000
Message-ID: <174841655453.26954.4462977691657107286@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527120637.665506-1-michal.winiarski@intel.com>
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev8)
URL   : https://patchwork.freedesktop.org/series/138887/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6a7b6b49fd8ee01c15489d2771e7bbbeeebe8d6f
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Tue May 27 14:06:37 2025 +0200

    drm/xe/pf: Set VF LMEM BAR size
    
    LMEM is partitioned between multiple VFs and we expect that the more
    VFs we have, the less LMEM is assigned to each VF.
    This means that we can achieve full LMEM BAR access without the need to
    attempt full VF LMEM BAR resize via pci_resize_resource().
    
    Always try to set the largest possible BAR size that allows to fit the
    number of enabled VFs and inform the user in case the resize attempt is
    not successful.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
+ /mt/dim checkpatch 07b6736f75df3e60d5e20eda53ecb97f6d9a66c0 drm-intel
f6f31e801e3f PCI/IOV: Restore VF resizable BAR state after reset
-:115: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#115: FILE: drivers/pci/pci.h:723:
 }
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)

total: 0 errors, 0 warnings, 1 checks, 106 lines checked
34da00592228 PCI: Add a helper to convert between VF BAR number and IOV resource
-:112: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#112: FILE: drivers/pci/pci.h:703:
 }
+static inline int pci_resource_num_from_vf_bar(int resno)

-:116: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#116: FILE: drivers/pci/pci.h:707:
+}
+static inline int pci_resource_num_to_vf_bar(int resno)

-:127: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#127: FILE: drivers/pci/pci.h:739:
 }
+static inline int pci_resource_num_from_vf_bar(int resno)

-:132: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#132: FILE: drivers/pci/pci.h:744:
+}
+static inline int pci_resource_num_to_vf_bar(int resno)

total: 0 errors, 0 warnings, 4 checks, 111 lines checked
f2be1ba1e5df PCI: Allow IOV resources to be resized in pci_resize_resource()
-:93: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#93: FILE: drivers/pci/pci.h:734:
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,

total: 0 errors, 0 warnings, 1 checks, 127 lines checked
957fcd5b0b9d PCI/IOV: Check that VF BAR fits within the reservation
f88418655256 PCI: Allow drivers to control VF BAR size
-:72: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#72: FILE: drivers/pci/iov.c:1348:
+		return -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
6a7b6b49fd8e drm/xe/pf: Set VF LMEM BAR size


