Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18901C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 15:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02D910E670;
	Wed, 14 May 2025 15:36:21 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8710E675;
 Wed, 14 May 2025 15:36:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_use_xe=5Fmmio?=
 =?utf-8?q?=5Fread32=28=29_to_read_mtcfg_register_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 15:36:20 -0000
Message-ID: <174723698026.79350.4733639046415475064@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513035515.3458300-1-shuicheng.lin@intel.com>
In-Reply-To: <20250513035515.3458300-1-shuicheng.lin@intel.com>
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

Series: drm/xe: use xe_mmio_read32() to read mtcfg register (rev2)
URL   : https://patchwork.freedesktop.org/series/148924/
State : success

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
commit 447c467dfb4fa800e89419729da537fed42f0237
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue May 13 15:30:10 2025 +0000

    drm/xe: Use xe_mmio_read32() to read mtcfg register
    
    The mtcfg register is a 32-bit register and should therefore be
    accessed using xe_mmio_read32().
    
    Other 3 changes per codestyle suggestion:
    "
    xe_mmio.c:83: CHECK: Alignment should match open parenthesis
    xe_mmio.c:131: CHECK: Comparison to NULL could be written "!xe->mmio.regs"
    xe_mmio.c:315: CHECK: line length of 103 exceeds 100 columns
    "
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch dd6a856541dd90fa4ef755783898fcfbea3b9961 drm-intel
447c467dfb4f drm/xe: Use xe_mmio_read32() to read mtcfg register


