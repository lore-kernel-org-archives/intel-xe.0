Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F705D149F6
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E416D10E076;
	Fri, 25 Oct 2024 23:16:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6466B10E076;
 Fri, 25 Oct 2024 23:16:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_VF_resizable_BAR_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 23:16:47 -0000
Message-ID: <172989820740.1334319.17540077919145317509@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev3)
URL   : https://patchwork.freedesktop.org/series/138887/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea23840eb5d4050fd2506de21d298c35cc25fd11
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Oct 25 23:50:38 2024 +0200

    drm/xe/pf: Set VF LMEM BAR size
    
    LMEM is partitioned between multiple VFs and we expect that the more
    VFs we have, the less LMEM is assigned to each VF.
    This means that we can achieve full LMEM BAR access without the need to
    attempt full VF LMEM BAR resize via pci_resize_resource().
    
    Always set the largest possible BAR size that allows to fit the number
    of enabled VFs.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 3ec61d11c7429a65dcc3ac46b9e845f13891a306 drm-intel
7ddd31b396a8 PCI/IOV: Restore VF resizable BAR state after reset
dd214bc6c423 PCI: Add a helper to identify IOV resources
-:48: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#48: FILE: drivers/pci/pci.h:607:
 }
+static inline bool pci_resource_is_iov(int resno)

total: 0 errors, 0 warnings, 1 checks, 76 lines checked
1691328ccbec PCI: Add a helper to convert between standard and IOV resources
-:104: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#104: FILE: drivers/pci/pci.h:587:
 }
+static inline int pci_resource_to_iov(int resno)

-:120: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#120: FILE: drivers/pci/pci.h:620:
 }
+static inline int pci_resource_to_iov(int resno)

total: 0 errors, 0 warnings, 2 checks, 104 lines checked
9b2614734e2f PCI: Allow IOV resources to be resized in pci_resize_resource()
-:93: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#93: FILE: drivers/pci/pci.h:619:
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,

total: 0 errors, 0 warnings, 1 checks, 138 lines checked
10f81da01c05 PCI/IOV: Check that VF BAR fits within the reservation
1018b52ddec7 PCI: Allow drivers to control VF BAR size
-:57: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#57: FILE: drivers/pci/iov.c:1313:
+		return -ENOTSUPP;

total: 0 errors, 1 warnings, 0 checks, 101 lines checked
ea23840eb5d4 drm/xe/pf: Set VF LMEM BAR size


