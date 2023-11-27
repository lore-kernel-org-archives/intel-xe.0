Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEBFC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 12:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CBE10E25E;
	Mon, 27 Nov 2023 12:36:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A70510E25E;
 Mon, 27 Nov 2023 12:36:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C64EA47E9;
 Mon, 27 Nov 2023 12:36:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 27 Nov 2023 12:36:43 -0000
Message-ID: <170108860330.3003.10587015122963552956@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127123349.23698-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231127123349.23698-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Internally_change_the_compute=5Fmode_and_no=5Fdma=5Ffen?=
 =?utf-8?q?ce_mode_naming?=
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

Series: drm/xe: Internally change the compute_mode and no_dma_fence mode naming
URL   : https://patchwork.freedesktop.org/series/126913/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f0a4f371af99996bfda4e8f9e1069b2f344b9a81
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Nov 27 13:33:49 2023 +0100

    drm/xe: Internally change the compute_mode and no_dma_fence mode naming
    
    The name "compute_mode" can be confusing since compute uses either this
    mode or fault_mode to achieve the long-running semantics, and compute_mode
    can, moving forward, enable fault_mode under the hood to work around
    hardware limitations.
    
    Also the name no_dma_fence_mode really refers to what we elsewhere call
    long-running mode and the mode contrary to what its name suggests allows
    dma-fences as in-fences.
    
    So in an attempt to be more consistent, rename
    no_dma_fence_mode -> lr_mode
    compute_mode      -> preempt_fence_mode
    
    And adjust flags so that
    
    preempt_fence_mode sets XE_VM_FLAG_LR_MODE
    fault_mode sets XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE
    
    v2:
    - Fix a typo in the commit message (Oak Zeng)
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 742c5e2bbe41df0e79309e7d601e3a52ef0a4e59 drm-intel
f0a4f371a drm/xe: Internally change the compute_mode and no_dma_fence mode naming


