Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C3E106FD60
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 02:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A608610E042;
	Fri, 13 Mar 2026 02:03:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AB610E042;
 Fri, 13 Mar 2026 02:02:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_platform/x86/intel=3A_Add?=
 =?utf-8?q?_ACPI_PMT_discovery_support_and_enable_NVL_PMC_telemetry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Mar 2026 02:02:59 -0000
Message-ID: <177336737970.353510.896194529016441302@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
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

Series: platform/x86/intel: Add ACPI PMT discovery support and enable NVL PMC telemetry
URL   : https://patchwork.freedesktop.org/series/163153/
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
commit c6ad9fd2741bc94906ee853fc5bfcf93dd14a75b
Author: David E. Box <david.e.box@linux.intel.com>
Date:   Thu Mar 12 18:52:01 2026 -0700

    platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery
    
    Add Nova Lake S PMC device IDs to enable binding of the SSRAM telemetry
    driver on NVL platforms, and map them to the ACPI-based discovery policy.
    
    Signed-off-by: David E. Box <david.e.box@linux.intel.com>
+ /mt/dim checkpatch 29044d219ec91738869fef9d445adce5e31df374 drm-intel
66e85e74d93e platform/x86/intel/vsec: Refactor base_addr handling
b8ee9c75b28d platform/x86/intel/vsec: Make driver_data info const
8fe8d86c72aa platform/x86/intel/vsec: Decouple add/link helpers from PCI
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
PCI-specific plumbing where it isn’t strictly required and rely on generic

total: 0 errors, 1 warnings, 0 checks, 64 lines checked
d6e7abba3f2d platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
27a4e3ef33ea platform/x86/intel/vsec: Return real error codes from registration path
ca083ee2b965 platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec
421a6832ed25 platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
bf475653263d platform/x86/intel/pmt/crashlog: Split init into pre-decode
d4bb24f76133 platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
3e6ec039cb06 platform/x86/intel/pmt: Move header decode into common helper
a9a00c4f3404 platform/x86/intel/pmt: Pass discovery index instead of resource
4e5e6947e71e platform/x86/intel/pmt: Unify header fetch and add ACPI source
e741fe7b4d3e platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
a62480cf193c platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
-:89: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#89: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 277 lines checked
42c264b9edc0 platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
-:35: ERROR:MISSING_SENTINEL: missing sentinel in ID array
#35: FILE: drivers/platform/x86/intel/pmc/ssram_telemetry.c:186:
+static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM) },


total: 1 errors, 0 warnings, 0 checks, 35 lines checked
d3fe316e2ff2 platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
-:23: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#23: FILE: drivers/platform/x86/intel/pmc/ssram_telemetry.c:25:
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
[...]
+static struct pmc_ssram_telemetry pmc_ssram_telems[3];

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
d34f0306fb4b platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
0fe34022f206 platform/x86/intel/pmc/ssram: Add PCI platform data
-:21: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#21: FILE: drivers/platform/x86/intel/pmc/ssram_telemetry.c:25:
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
[...]
+enum resource_method {

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
d199b85a74eb platform/x86/intel/pmc/ssram: Refactor memory barrier for reentrant probe
46cbd20ea62e platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
b4539a12438d platform/x86/intel/pmc/ssram: Make PMT registration optional
c6ad9fd2741b platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery


