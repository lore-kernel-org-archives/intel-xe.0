Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723FC47DA2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48C310E37C;
	Tue, 16 Jan 2024 14:59:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645DF10E37C;
 Tue, 16 Jan 2024 14:59:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_MMIO_read/write_fu?=
 =?utf-8?q?nctions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 16 Jan 2024 14:59:22 -0000
Message-ID: <170541716241.502240.16335183766482728199@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Update MMIO read/write functions
URL   : https://patchwork.freedesktop.org/series/128835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5c236713dbd0bf77f8683edbff1024faf6df93da
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jan 16 15:56:17 2024 +0100

    drm/xe: Make xe_mmio_read|write() functions non-inline
    
    Shortly we will updating xe_mmio_read|write() functions with SR-IOV
    specific features making those functions less suitable for inline.
    Convert now those functions into regular ones, lowering driver
    footprint, according to scripts/bloat-o-meter, by 6%
    
    add/remove: 18/18 grow/shrink: 31/603 up/down: 2719/-79663 (-76944)
    Function                                     old     new   delta
    Total: Before=1276633, After=1199689, chg -6.03%
    add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
    Data                                         old     new   delta
    Total: Before=48990, After=48990, chg +0.00%
    add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
    RO Data                                      old     new   delta
    Total: Before=115680, After=115680, chg +0.00%
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c4796d784fcc0a8b72cd8fdc8c3f6f9bc2552242 drm-intel
17cc06c79 drm/xe: Assert size of the struct xe_reg
-:28: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#28: FILE: drivers/gpu/drm/xe/regs/xe_reg_defs.h:49:
 };
+static_assert(sizeof(struct xe_reg) == sizeof(u32));

total: 0 errors, 0 warnings, 1 checks, 15 lines checked
7b4ddbb4e drm/xe: Define XE_REG_OPTION_VF
2c6f319b1 drm/xe: Mark VF accessible GuC registers
c41efd91c drm/xe: Mark VF accessible global registers
8cabd7f43 drm/xe: Mark VF accessible GT registers
5c236713d drm/xe: Make xe_mmio_read|write() functions non-inline


