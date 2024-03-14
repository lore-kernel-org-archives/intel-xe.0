Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC9C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C587A10FD8F;
	Thu, 14 Mar 2024 20:45:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB0010FC89;
 Thu, 14 Mar 2024 20:45:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_MMIO_read/write_fu?=
 =?utf-8?q?nctions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 20:45:50 -0000
Message-ID: <171044915038.756190.13301342531092193548@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

Series: Update MMIO read/write functions (rev2)
URL   : https://patchwork.freedesktop.org/series/128835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ebe64ae2b126568f3a1e80672385a4e5097b182
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Mar 14 18:31:30 2024 +0100

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
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c44e29a7b62293355744fd857aad93cbf43e5126 drm-intel
460bba808a67 drm/xe: Assert size of the struct xe_reg
-:29: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#29: FILE: drivers/gpu/drm/xe/regs/xe_reg_defs.h:49:
 };
+static_assert(sizeof(struct xe_reg) == sizeof(u32));

total: 0 errors, 0 warnings, 1 checks, 15 lines checked
904e242b373a drm/xe: Define XE_REG_OPTION_VF
54ffd16769fe drm/xe: Mark VF accessible GuC registers
221c9280c80f drm/xe: Mark VF accessible global registers
a9ddb22b30aa drm/xe: Mark VF accessible interrupt registers
0ebe64ae2b12 drm/xe: Make xe_mmio_read|write() functions non-inline


