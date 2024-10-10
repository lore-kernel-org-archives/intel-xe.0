Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5E2CF11CD
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 10:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84510E8C6;
	Thu, 10 Oct 2024 10:37:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3A10E8C6;
 Thu, 10 Oct 2024 10:37:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_VF_resizable_BAR_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 10:37:58 -0000
Message-ID: <172855667809.1214769.6125667466453690045@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010103203.382898-1-michal.winiarski@intel.com>
In-Reply-To: <20241010103203.382898-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev2)
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
commit a060e15879afd5db953e593f4359ab721ce53db1
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Thu Oct 10 12:32:03 2024 +0200

    drm/xe/pf: Extend the VF LMEM BAR
    
    Opt into extending the VF BAR.
    LMEM is partitioned between multiple VFs, and we expect that the more
    VFs we have, the less LMEM is assigned to each VF.
    This means that we can achieve full LMEM BAR access without the need to
    attempt full VF LMEM BAR resize via pci_resize_resource().
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 40eee4a1af7598f2992f9b69bfea567074d23ea6 drm-intel
04376ecd61ee PCI/IOV: Restore VF resizable BAR state after reset
02be94796c32 PCI: Add a helper to identify IOV resources
-:45: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#45: FILE: drivers/pci/pci.h:606:
 }
+static inline bool pci_resource_is_iov(int resno)

total: 0 errors, 0 warnings, 1 checks, 73 lines checked
362c618c3683 PCI: Allow IOV resources to be resized in pci_resize_resource
-:77: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#77: FILE: drivers/pci/pci.h:587:
 }
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);

-:86: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#86: FILE: drivers/pci/pci.h:612:
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,

total: 0 errors, 0 warnings, 2 checks, 127 lines checked
73212d5690d8 PCI/IOV: Allow extending VF BAR within original resource boundary
-:46: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#46: FILE: drivers/pci/iov.c:192:
+		ret = -ENOTSUPP;

-:87: CHECK:CAMELCASE: Avoid CamelCase: <total_VFs>
#87: FILE: drivers/pci/iov.c:233:
+		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);

-:100: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#100: FILE: drivers/pci/iov.c:246:
+		return -ENOTSUPP;

total: 0 errors, 2 warnings, 1 checks, 140 lines checked
a060e15879af drm/xe/pf: Extend the VF LMEM BAR


