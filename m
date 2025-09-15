Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6AECAC58E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 09:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF0510E3CB;
	Mon, 15 Sep 2025 09:23:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B510E3C9;
 Mon, 15 Sep 2025 09:23:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_Resizable_BAR_impr?=
 =?utf-8?q?ovements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Sep 2025 09:23:01 -0000
Message-ID: <175792818158.333576.10055973077826169683@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
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

Series: PCI: Resizable BAR improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/154361/
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
commit 611e233d78b986dbb28ccb592eaada567a9cb5c8
Author: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Date:   Mon Sep 15 12:13:58 2025 +0300

    PCI: Convert BAR sizes bitmasks to u64
    
    PCIe r6.2 section 7.8.6 defines resizable BAR sizes beyond the
    currently supported maximum of 128TB which will require more than u32
    to store the entire bitmask.
    
    Convert Resizable BAR related functions to use u64 bitmask for BAR
    sizes to make the typing more future-proof.
    
    The support for the larger BAR sizes themselves is not added at this
    point.
    
    Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch dcbce80de08157a4817564fc3db3179b7c87095c drm-intel
5e8cd5c232b8 PCI: Move Resizable BAR code into rebar.c
-:225: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#225: 
new file mode 100644

-:271: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#271: FILE: drivers/pci/rebar.c:42:
+		return -ENOTSUPP;

-:426: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#426: FILE: drivers/pci/rebar.c:197:
+		return -ENOTSUPP;

-:437: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#437: FILE: drivers/pci/rebar.c:208:
+		return -ENOTSUPP;

total: 0 errors, 4 warnings, 0 checks, 501 lines checked
a766d7c00db9 PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
11596c7c58a6 PCI: Move pci_rebar_size_to_bytes() and export it
f9b9403ea72f PCI: Improve Resizable BAR functions kernel doc
76ceaf65b750 PCI: Add pci_rebar_size_supported() helper
f4fd715b7bbb drm/i915/gt: Use pci_rebar_size_supported()
c731e42ec5c1 drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
6630c0a972e6 PCI: Add pci_rebar_get_max_size()
ff897515634d drm/xe/vram: Use pci_rebar_get_max_size()
ba7ed79ec7c5 drm/amdgpu: Use pci_rebar_get_max_size()
611e233d78b9 PCI: Convert BAR sizes bitmasks to u64


