Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5543E9A026
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 17:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BA910E1C2;
	Tue, 17 Feb 2026 17:47:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D2510E1C2;
 Tue, 17 Feb 2026 17:46:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_bridges_without_VGA_suppo?=
 =?utf-8?q?rt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 17:46:58 -0000
Message-ID: <177135041872.260407.10682664616080856256@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217170419.236739-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260217170419.236739-1-Simon.Richter@hogyros.de>
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

Series: bridges without VGA support
URL   : https://patchwork.freedesktop.org/series/161722/
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
commit 778e63d100f001fd5fd9534a2defa31b9ea59b9b
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Wed Feb 18 02:04:19 2026 +0900

    pci: mark return value of pci_set_vga_state as __must_check
    
    This function can return an error, which should be checked.
    
    The only caller so far is __vga_tryget in vgaarb, which did not check.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
+ /mt/dim checkpatch e66c64e4f12e55cad35c680f1e328a7c7ee92cab drm-intel
47f637fc4b80 vgaarb: pass vga_get errors to userspace
-:28: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#28: FILE: drivers/pci/vgaarb.c:1170:
+		if (unlikely(err))
+		{

total: 1 errors, 0 warnings, 0 checks, 20 lines checked
9f7e28bdecf3 vgaarb: pass errors from pci_set_vga_state up
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
pci_set_vga_state returns an error code, which so far has been ignored. Pass

-:49: ERROR:OPEN_BRACE: that open brace { should be on the previous line
#49: FILE: drivers/pci/vgaarb.c:463:
+		if (IS_ERR(conflict))
+		{

total: 1 errors, 1 warnings, 0 checks, 38 lines checked
2de0bad5367d vgaarb: mark vga_get family as __must_check
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
These functions can return an error, but some callers expect they don't, and

-:21: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#21: FILE: include/linux/vgaarb.h:31:
+int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
+		int interruptible);

-:30: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#30: FILE: include/linux/vgaarb.h:43:
 };
+static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,

-:31: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#31: FILE: include/linux/vgaarb.h:44:
+static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,
 		int interruptible)

-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: include/linux/vgaarb.h:79:
+static inline int __must_check vga_get_interruptible(struct pci_dev *pdev,
 					unsigned int rsrc)

-:49: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#49: FILE: include/linux/vgaarb.h:94:
+static inline int __must_check vga_get_uninterruptible(struct pci_dev *pdev,
 					  unsigned int rsrc)

total: 0 errors, 1 warnings, 5 checks, 33 lines checked
cde677910267 pci: check if VGA decoding was really activated
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
PCI bridges are allowed to refuse activating VGA decoding, by simply ignoring

-:25: ERROR:SPACING: space required before the open parenthesis '('
#25: FILE: drivers/pci/pci.c:6133:
+				if(!(cmd & PCI_BRIDGE_CTL_VGA))

total: 1 errors, 1 warnings, 0 checks, 12 lines checked
778e63d100f0 pci: mark return value of pci_set_vga_state as __must_check
-:22: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#22: FILE: include/linux/pci.h:1701:
+int __must_check pci_set_vga_state(struct pci_dev *pdev, bool decode,
 		      unsigned int command_bits, u32 flags);

total: 0 errors, 0 warnings, 1 checks, 8 lines checked


