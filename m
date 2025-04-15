Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8DC369B4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 13:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417AA10E798;
	Tue, 15 Apr 2025 13:43:29 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3E210E798;
 Tue, 15 Apr 2025 13:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ring=5Fops=5Ftypes?=
 =?utf-8?q?=3A_Increase_MAX=5FJOB=5FSIZE=5FDW?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 13:43:27 -0000
Message-ID: <174472460795.6843.13508621386680797949@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415111523.149214-1-francois.dugast@intel.com>
In-Reply-To: <20250415111523.149214-1-francois.dugast@intel.com>
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

Series: drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
URL   : https://patchwork.freedesktop.org/series/147757/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2ade0000a2abd2cc9e5d3a35d003f202f7c056ae
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Apr 15 13:15:23 2025 +0200

    drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
    
    This limit can be hit, for example when running IGT compute-square on MTL:
    
        [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <= 48` failed!
                       platform: METEORLAKE subplatform: 1
                       graphics: Xe_LPG 12.71 step B0
                       media: Xe_LPM+ 13.00 step C0
                       tile: 0 VRAM 0 B
                       GT: 0 type 1
        [   63.582408] WARNING: CPU: 0 PID: 2439 at drivers/gpu/drm/xe/xe_ring_ops.c:395 __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]
    
    Increase the value to allow this test to pass.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch f031245c01c722de43e8a02c2358140de0685428 drm-intel
2ade0000a2ab drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW


