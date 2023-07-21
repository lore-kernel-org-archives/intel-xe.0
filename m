Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC5BC001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 17:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041AE10E6DD;
	Fri, 21 Jul 2023 17:58:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABEE910E6DF;
 Fri, 21 Jul 2023 17:58:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AAA1DA7DFF;
 Fri, 21 Jul 2023 17:58:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 21 Jul 2023 17:58:51 -0000
Message-ID: <168996233169.22545.15692758690532199637@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230721175557.1513250-3-matthew.d.roper@intel.com>
In-Reply-To: <20230721175557.1513250-3-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe/mtl=3A_Map_PPGTT_as_CPU=3AW?=
 =?utf-8?q?C?=
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

Series: series starting with [1/2] drm/xe/mtl: Map PPGTT as CPU:WC
URL   : https://patchwork.freedesktop.org/series/121148/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 86ca568c0a00f932f1f49a11efd10ea2277a27a5
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Jul 21 10:55:59 2023 -0700

    drm/xe: xe_engine_create_ioctl should check gt_count, not tile_count
    
    Platforms like MTL only have a single tile, but multiple GTs.
    Ensure XE_ENGINE_CREATE accepts engine creation on gt1 on such
    platforms.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 786d2a4f30e168368b4d19d3e1d2f57d18ebecf8 drm-intel
f1b85f78b drm/xe/mtl: Map PPGTT as CPU:WC
-:11: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#11: 
   xe 0000:00:02.0: [drm:__xe_pt_bind_vma [xe]] Preparing bind, with range [1a0000...1a0fff) engine 0000000000000000.

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
86ca568c0 drm/xe: xe_engine_create_ioctl should check gt_count, not tile_count


