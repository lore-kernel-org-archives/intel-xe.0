Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA5ED41C12
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 07:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964F710E352;
	Wed, 13 Nov 2024 07:55:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449A10E68C;
 Wed, 13 Nov 2024 07:55:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_BMG_PMT_features_?=
 =?utf-8?q?for_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 07:55:31 -0000
Message-ID: <173148453166.3449415.10679136403935396935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
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

Series: Support BMG PMT features for Xe
URL   : https://patchwork.freedesktop.org/series/141227/
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
commit 1f1eb2ec022b885e451d17f57b7c89b6e5729215
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Nov 12 11:30:35 2024 -0500

    drm/xe/vsec: Support BMG devices
    
    The Battlemage (BMG) discrete graphics card supports the
    Platform, Monitoring Technology (PMT) feature directly
    on the primary PCI device.
    
    Utilize the PMT callback API to add support for the BMG
    devices.
    
    Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 26f5fe99791def93b32e27e79e71dbd0666c117b drm-intel
62ca7269fcc9 platform/x86/intel/pmt: allow user offset for PMT callbacks
1f1eb2ec022b drm/xe/vsec: Support BMG devices
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:263: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#263: FILE: drivers/gpu/drm/xe/xe_vsec.c:152:
+static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count)

total: 0 errors, 2 warnings, 0 checks, 306 lines checked


