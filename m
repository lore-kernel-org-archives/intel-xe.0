Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55380C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 00:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB1710E504;
	Tue, 25 Feb 2025 00:08:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D112B10E504;
 Tue, 25 Feb 2025 00:08:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VRAM_Self_Refresh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 00:08:10 -0000
Message-ID: <174044209085.1770899.2603216762803157329@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224164849.3746751-1-anshuman.gupta@intel.com>
In-Reply-To: <20250224164849.3746751-1-anshuman.gupta@intel.com>
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

Series: VRAM Self Refresh
URL   : https://patchwork.freedesktop.org/series/145342/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 85df9e260df2e80b85847f9127dffd1fd9006312
Author: Anshuman Gupta <anshuman.gupta@intel.com>
Date:   Mon Feb 24 22:18:49 2025 +0530

    drm/xe/vrsr: Enable VRSR
    
    Enabling VRSR in runtime suspend and also in System wide suspend.
    Also fix couple of typo in xe_pm.c.
    
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 0bd853a9790bbe9c4ccf3bf2c521958d1df41d54 drm-intel
9b0cd6391d03 PCI/ACPI: Implement PCI FW _DSM method
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Current assumption is only one PCIe Endpoint driver (XeKMD for Battlemage GPU)

-:91: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#91: FILE: drivers/pci/pci-acpi.c:1484:
+				 "D3cold Aux Power request needs retry. Interval: %d seconds.\n", retry_interval);

-:95: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#95: FILE: drivers/pci/pci-acpi.c:1488:
+			dev_err(&dev->dev, "D3cold Aux Power: Reserved or unsupported response: 0x%x.\n", result);

-:133: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#133: FILE: drivers/pci/pci-acpi.c:1526:
+					  DSM_PCI_PERST_ASSERTION_DELAY, &in_obj, ACPI_TYPE_INTEGER);

-:146: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#146: FILE: drivers/pci/pci-acpi.c:1539:
+			 "PERST# Assertion Delay request failed. Previous valid delay: %u microseconds.\n", result);

total: 0 errors, 5 warnings, 0 checks, 158 lines checked
90567f1f2c5a drm/xe/vrsr: Detect vrsr capability
46b8052151f6 drm/xe/vrsr: Apis to init and enable VRSR feature
-:87: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#87: FILE: drivers/gpu/drm/xe/xe_pm.c:118:
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+			    PCODE_D3_VRSR_SC_AUX_PL_AND_PERST_DELAY, 0),

-:136: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#136: FILE: drivers/gpu/drm/xe/xe_pm.c:167:
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_ENABLE, 0), uval);

-:139: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#139: FILE: drivers/gpu/drm/xe/xe_pm.c:170:
+		ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3_VRAM_SELF_REFRESH,
+				     PCODE_D3_VRSR_SC_DISABLE, 0), uval);

total: 0 errors, 0 warnings, 3 checks, 137 lines checked
c27067331201 drm/xe/vrsr: Refactor d3cold.allowed to a enum
675eae51fcb4 drm/xe/pm: D3Cold target state
85df9e260df2 drm/xe/vrsr: Enable VRSR


