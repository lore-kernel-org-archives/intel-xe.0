Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F23D6CFB2
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 03:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B49A10EA64;
	Fri, 23 Jan 2026 03:01:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5339E10EA64;
 Fri, 23 Jan 2026 03:01:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_platform/x86/intel/vsec?=
 =?utf-8?q?=3A_Prep_for_ACPI_PMT_discovery_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 03:01:56 -0000
Message-ID: <176913731632.186033.17549868328525930275@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123025108.3772255-1-david.e.box@linux.intel.com>
In-Reply-To: <20260123025108.3772255-1-david.e.box@linux.intel.com>
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

Series: platform/x86/intel/vsec: Prep for ACPI PMT discovery (rev4)
URL   : https://patchwork.freedesktop.org/series/159716/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c0590aa47bea09c3fe3ea9c0ee900d2a37dc12d2
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Thu Jan 22 18:51:07 2026 -0800

    platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec
    
    Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
    generic discovery source flag and carry ACPI discovery entries alongside
    the existing PCI resource path so PMT clients can consume either.
    
    Changes:
      - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
      - Extend intel_vsec_platform_info and intel_vsec_device with source enum
        and ACPI discovery table pointer/
      - When src==ACPI, skip BAR resource setup and copy the ACPI discovery
        entries into the aux device.
    
    No user-visible behavior change yet; this only wires ACPI data through vsec
    in preparation for ACPI-enumerated PMT clients.
    
    Signed-off-by: David E. Box <david.e.box@linux.intel.com>
+ /mt/dim checkpatch f20afcc51cabf38938961caf0e634144aa21b6a3 drm-intel
4e0b5459f91e platform/x86/intel/vsec: Refactor base_addr handling
2c8a08b4aab6 platform/x86/intel/vsec: Make driver_data info const
4fdd1da67bd3 platform/x86/intel/vsec: Decouple add/link helpers from PCI
902693c3538f platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
e44f3437869a platform/x86/intel/vsec: Return real error codes from registration path
c0590aa47bea platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec
-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/platform/x86/intel/vsec.c:357:
+		if (check_mul_overflow(intel_vsec_dev->num_resources,
+			sizeof(*info->acpi_disc), &bytes))

total: 0 errors, 0 warnings, 1 checks, 98 lines checked


