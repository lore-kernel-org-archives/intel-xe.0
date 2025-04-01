Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11609C36014
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 15:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42010E5F6;
	Tue,  1 Apr 2025 15:42:24 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA9510E5F6;
 Tue,  1 Apr 2025 15:42:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VRAM_Self_Refresh_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Apr 2025 15:42:23 -0000
Message-ID: <174352214377.23500.1663672760430015319@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401153225.96379-1-anshuman.gupta@intel.com>
In-Reply-To: <20250401153225.96379-1-anshuman.gupta@intel.com>
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

Series: VRAM Self Refresh (rev2)
URL   : https://patchwork.freedesktop.org/series/145342/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab1c592bbcdc021074954cf236dd2fa24641fb41
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Apr 1 21:02:25 2025 +0530

    drm/xe/vrsr: Introduce a debugfs node named vrsr_capable
    
    Add a debugfs node named vrsr_capable to check if the device supports
    VRSR
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 075a54ae88695f050fb8baef7e98dee9dfd489df drm-intel
16a13737be22 PCI/ACPI: Add D3cold Aux Power Limit_DSM method
617cc8039d32 PCI/ACPI: Add PERST# Assertion Delay _DSM method
-:64: WARNING:MISSING_SPACE: break quoted strings at a space character
#64: FILE: drivers/pci/pci-acpi.c:1547:
+			 "PERST# Assertion Delay request failed"
+			 "Previous valid delay: %u microseconds\n", result);

total: 0 errors, 1 warnings, 0 checks, 84 lines checked
f5c35285f625 PCI/ACPI: Add aux power grant notifier
4822e43abc6d drm/xe/vrsr: Introduce flag has_vrsr
423e85554df1 drm/xe/vrsr: Detect VRSR Capability
52417d71d2a1 drm/xe/vrsr: Initialize VRSR feature
-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/xe/xe_pm.c:280:
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+			    PCODE_D3_VRSR_SC_AUX_PL_AND_PERST_DELAY, 0),

-:140: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#140: FILE: drivers/gpu/drm/xe/xe_pm.c:346:
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_ENABLE, 0), uval);

-:143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#143: FILE: drivers/gpu/drm/xe/xe_pm.c:349:
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_DISABLE, 0), uval);

total: 0 errors, 0 warnings, 3 checks, 136 lines checked
203aff741da0 drm/xe/vrsr: Enable VRSR on default VGA boot device
656e063b1c66 drm/xe: Add PCIe ACPI Aux Power notifier
d32bae784227 drm/xe/vrsr: Refactor d3cold.allowed to a enum
ae4578e9578f drm/xe/pm: D3Cold target state
eeee16a5db81 drm/xe/vrsr: Enable VRSR
ab1c592bbcdc drm/xe/vrsr: Introduce a debugfs node named vrsr_capable
-:20: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#20: FILE: drivers/gpu/drm/xe/xe_debugfs.c:195:
+static ssize_t vrsr_capable_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)

total: 0 errors, 0 warnings, 1 checks, 32 lines checked


