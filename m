Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF6CF3973
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 22:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9333710E03A;
	Thu, 19 Sep 2024 22:47:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFB110E03A;
 Thu, 19 Sep 2024 22:47:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_VF_resizable_BAR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 22:47:33 -0000
Message-ID: <172678605317.1048260.1561675833259548098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
In-Reply-To: <20240919223557.1897608-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR
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
commit eeea64c1161a4ead64491d9101d97754cb2a28d5
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Sep 20 00:35:57 2024 +0200

    drm/xe/pf: Extend the VF LMEM BAR
    
    Opt into extending the VF BAR.
    LMEM is partitioned between multiple VFs, and we expect that the more
    VFs we have, the less LMEM is assigned to each VF.
    This means that we can achieve full LMEM BAR access without the need to
    attempt full VF LMEM BAR resize via pci_resize_resource().
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch d4340c1de6d417c7b3edac187c3af011b146701a drm-intel
88a4e10f9904 PCI: Add support for VF Resizable Bar extended cap
-:141: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#141: FILE: drivers/pci/pci.h:574:
 }
+static inline bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)

-:145: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#145: FILE: drivers/pci/pci.h:578:
+}
+static inline bool pci_resource_is_iov(struct pci_dev *dev, int resno)

-:149: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#149: FILE: drivers/pci/pci.h:582:
+}
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,

total: 0 errors, 0 warnings, 3 checks, 202 lines checked
c646791a080e PCI: Allow extending VF BAR within original resource boundary
-:45: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#45: FILE: drivers/pci/iov.c:199:
+		ret = -ENOTSUPP;

-:86: CHECK:CAMELCASE: Avoid CamelCase: <total_VFs>
#86: FILE: drivers/pci/iov.c:240:
+		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);

-:99: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#99: FILE: drivers/pci/iov.c:253:
+		return -ENOTSUPP;

total: 0 errors, 2 warnings, 1 checks, 140 lines checked
eeea64c1161a drm/xe/pf: Extend the VF LMEM BAR


