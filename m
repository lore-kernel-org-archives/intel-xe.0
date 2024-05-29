Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A4C25B7E
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 23:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE16810E3AA;
	Wed, 29 May 2024 23:23:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F1710E3AA;
 Wed, 29 May 2024 23:23:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_missing_run?=
 =?utf-8?q?time_outer_protection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 23:23:27 -0000
Message-ID: <171702500732.2236415.17512663287880804885@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529215603.105082-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240529215603.105082-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Add missing runtime outer protection
URL   : https://patchwork.freedesktop.org/series/134211/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 80bc3caadc742fab95770aef0f25a0e8575afe08
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed May 29 17:56:03 2024 -0400

    drm/xe: Add missing runtime outer protection
    
    TTM BO destroy is called unlocked as a ref count worker when it
    gets 0 users. When that happens we could be runtime suspended,
    and waking up from inner locked places like ggtt_remove_node,
    could potentially lead to deadlocks. Our warning system against
    this case hit this case:
    
    [ 2295.891269] xe 0000:03:00.0: Missing outer runtime PM protection
    [snip]
    [ 2295.891604]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
    [ 2295.891717]  ? report_bug+0x18d/0x1c0
    [ 2295.891722]  ? handle_bug+0x3c/0x80
    [ 2295.891724]  ? exc_invalid_op+0x13/0x60
    [ 2295.891726]  ? asm_exc_invalid_op+0x16/0x20
    [ 2295.891730]  ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
    [ 2295.891816]  xe_ggtt_remove_node+0x93/0xf0 [xe]
    [ 2295.891870]  xe_ttm_bo_destroy+0xe9/0xf0 [xe]
    [ 2295.891935]  process_one_work+0x225/0x730
    [ 2295.891940]  worker_thread+0x1d8/0x3c0
    
    Add this outer protection to avoid any potential deadlock.
    
    Reported-by: Paulo Zanoni <paulo.zanoni@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
80bc3caadc74 drm/xe: Add missing runtime outer protection
-:30: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#30: 
Reported-by: Paulo Zanoni <paulo.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


