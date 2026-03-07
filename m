Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABA8F55103
	for <intel-xe@archiver.kernel.org>; Sat,  7 Mar 2026 17:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A55210E1CD;
	Sat,  7 Mar 2026 17:41:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97AD10E1C6;
 Sat,  7 Mar 2026 17:41:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_bridges_without_VGA_suppo?=
 =?utf-8?q?rt_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Mar 2026 17:41:50 -0000
Message-ID: <177290531067.330226.1658519913562376781@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
In-Reply-To: <20260307173538.763188-1-Simon.Richter@hogyros.de>
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

Series: bridges without VGA support (rev2)
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
commit 74c1c8b2f0de55ba3d0d4548bab05e81adc9f7b2
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sun Mar 8 02:35:38 2026 +0900

    pci: mark pci_set_vga_state() as __must_check
    
    This function can return an error, usually on non-x86 or virtualized
    environments.
    
    The only caller so far is __vga_tryget() in vgaarb.
    
    Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
+ /mt/dim checkpatch fce8d7fb2107068c269b868d51aba5f9cf85998a drm-intel
af2e6b6418c4 vgaarb: pass vga_get_uninterruptible() errors to userspace
a54ae961928d vgaarb: pass errors from pci_set_vga_state() up
4b7c76df4ff5 vgaarb: mark vga_get() and wrappers as __must_check
-:33: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#33: FILE: include/linux/vgaarb.h:43:
 };
+static inline int __must_check vga_get(struct pci_dev *pdev, unsigned int rsrc,

total: 0 errors, 0 warnings, 1 checks, 39 lines checked
1edb6ab28940 pci: check if VGA decoding was really activated
-:27: ERROR:SPACING: space required before the open parenthesis '('
#27: FILE: drivers/pci/pci.c:6203:
+				if(!(cmd & PCI_BRIDGE_CTL_VGA))

total: 1 errors, 0 warnings, 0 checks, 12 lines checked
74c1c8b2f0de pci: mark pci_set_vga_state() as __must_check


