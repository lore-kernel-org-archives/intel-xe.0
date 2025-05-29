Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE87C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5851A10E109;
	Thu, 29 May 2025 20:31:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234910E228;
 Thu, 29 May 2025 20:31:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_debugfs_node_to_expos?=
 =?utf-8?q?e_pcie_link_state_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 20:31:06 -0000
Message-ID: <174855066666.33093.16623780127082589800@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529192620.1227468-1-soham.purkait@intel.com>
In-Reply-To: <20250529192620.1227468-1-soham.purkait@intel.com>
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

Series: Add debugfs node to expose pcie link state residency
URL   : https://patchwork.freedesktop.org/series/149660/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 236d658fd524e1b9f165113d20deefd6a407a7a3
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Fri May 30 00:56:20 2025 +0530

    drm/xe/xe_debugfs: Exposure of pcie link state residency counters through debugfs
    
    Add a debugfs node named dgfx_link_state_residencys in order to
    obtain the pcie link state residency counter values for L0,
    L1, L1.2
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
+ /mt/dim checkpatch 901190a062301f01d432d9cf164a6b013df3e745 drm-intel
5db328d98d7c Utility function and macro for telemetry reading
-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/xe/xe_vsec.c:153:
+int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
 			     u32 count)

-:57: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 1 checks, 32 lines checked
ce2dafadfd1b drm/xe/regs/xe_pmt: Macros for pcie link state residency offset
236d658fd524 drm/xe/xe_debugfs: Exposure of pcie link state residency counters through debugfs
-:22: ERROR:CODE_INDENT: code indent should use tabs where possible
#22: FILE: drivers/gpu/drm/xe/xe_debugfs.c:189:
+                                  u64 *dst, u32 offset, char *name)$

-:22: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#22: FILE: drivers/gpu/drm/xe/xe_debugfs.c:189:
+                                  u64 *dst, u32 offset, char *name)$

-:23: ERROR:TRAILING_WHITESPACE: trailing whitespace
#23: FILE: drivers/gpu/drm/xe/xe_debugfs.c:190:
+{^I$

-:27: WARNING:BRACES: braces {} are not necessary for single statement blocks
#27: FILE: drivers/gpu/drm/xe/xe_debugfs.c:194:
+	if (ret != sizeof(u64)) {
+		drm_warn(&xe->drm, "%s residency counter failed to read, ret %d\n", name, ret);
+	}

-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/xe/xe_debugfs.c:201:
+static ssize_t dgfx_link_state_residencys_show(struct file *f, char __user *ubuf,
+				 size_t size, loff_t *pos)

-:44: ERROR:TRAILING_WHITESPACE: trailing whitespace
#44: FILE: drivers/gpu/drm/xe/xe_debugfs.c:211:
+^Immio = xe_root_tile_mmio(xe);^I$

-:56: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#56: FILE: drivers/gpu/drm/xe/xe_debugfs.c:223:
+	len += scnprintf(buf + len, sizeof(buf) - len, "PCIE LINK L1.2 RESIDENCY : %llu\n", link_res);

total: 3 errors, 3 warnings, 1 checks, 67 lines checked


