Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B6AC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 19:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A6010E87A;
	Tue, 20 Aug 2024 19:07:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41CE10E87A;
 Tue, 20 Aug 2024 19:07:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Driver_load_failure_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 19:07:54 -0000
Message-ID: <172418087466.700411.1943403517187467155@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820172958.1095143-1-matthew.brost@intel.com>
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Series: Driver load failure fixes
URL   : https://patchwork.freedesktop.org/series/137531/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d472bc6fe559c84ea75256dd4ff18e6656d4e4e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 20 10:29:58 2024 -0700

    drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map
    
    Preferred way to create kernel BOs is xe_managed_bo_create_pin_map, use
    it.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch aadc820a10ab50bd57179c0feb238bedde6a9d3b drm-intel
4d617fd5fa0d drm/xe: Move ggtt_fini to devm managed
b3f2be9582c1 drm/xe: Set firmware state to loadable before registering guc_fini_hw
d953594eb972 drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
11138ce669d0 drm/xe: Move hw_engine_fini to devm managed
c7ca353102f4 drm/xe: Move HuC init before GuC init
2d472bc6fe55 drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map


