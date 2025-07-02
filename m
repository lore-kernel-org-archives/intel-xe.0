Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DECC8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 11:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796DD10E19E;
	Wed,  2 Jul 2025 11:13:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E310E19E;
 Wed,  2 Jul 2025 11:13:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_VF_resizable_BAR_?=
 =?utf-8?q?=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 11:13:08 -0000
Message-ID: <175145478824.127980.764073960201454493@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702093522.518099-1-michal.winiarski@intel.com>
In-Reply-To: <20250702093522.518099-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev9)
URL   : https://patchwork.freedesktop.org/series/138887/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7e6589a2333722a6cb74cf67ece2b97b74bfbfc1
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Jul 2 11:35:22 2025 +0200

    PCI: Allow drivers to control VF BAR size
    
    Drivers could leverage the fact that the VF BAR MMIO reservation is
    created for total number of VFs supported by the device by resizing the
    BAR to larger size when smaller number of VFs is enabled.
    
    Add a pci_iov_vf_bar_set_size() function to control the size and a
    pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
    allow up to num_vfs to be successfully enabled with the current
    underlying reservation size.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
+ /mt/dim checkpatch e46fcd77ceacb06a5411cb77b7344d6b82e1ab72 drm-intel
059d3c165659 PCI/IOV: Restore VF resizable BAR state after reset
-:115: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#115: FILE: drivers/pci/pci.h:745:
 }
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)

total: 0 errors, 0 warnings, 1 checks, 106 lines checked
43ae323d2285 PCI: Add a helper to convert between VF BAR number and IOV resource
-:112: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#112: FILE: drivers/pci/pci.h:725:
 }
+static inline int pci_resource_num_from_vf_bar(int resno)

-:116: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#116: FILE: drivers/pci/pci.h:729:
+}
+static inline int pci_resource_num_to_vf_bar(int resno)

-:127: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#127: FILE: drivers/pci/pci.h:761:
 }
+static inline int pci_resource_num_from_vf_bar(int resno)

-:132: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#132: FILE: drivers/pci/pci.h:766:
+}
+static inline int pci_resource_num_to_vf_bar(int resno)

total: 0 errors, 0 warnings, 4 checks, 111 lines checked
00c25094bce9 PCI: Allow IOV resources to be resized in pci_resize_resource()
-:93: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#93: FILE: drivers/pci/pci.h:756:
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,

total: 0 errors, 0 warnings, 1 checks, 127 lines checked
f4165eff7ab7 PCI/IOV: Check that VF BAR fits within the reservation
7e6589a23337 PCI: Allow drivers to control VF BAR size
-:73: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#73: FILE: drivers/pci/iov.c:1348:
+		return -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 105 lines checked


