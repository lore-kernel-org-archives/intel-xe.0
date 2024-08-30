Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC05CA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6510E1A3;
	Fri, 30 Aug 2024 05:18:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4035D10E1A3;
 Fri, 30 Aug 2024 05:18:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 05:18:51 -0000
Message-ID: <172499513125.850418.11027944966983407714@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling
URL   : https://patchwork.freedesktop.org/series/137982/
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
commit be937992f59808fc0bfd1b89726493eac307793f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Aug 30 10:53:26 2024 +0530

    drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
    
    A failure in xe_force_wake_get() no longer increments the domain's
    refcount. Therefore, if xe_force_wake_get() fails during forcewake
    debugfs open, return an error. This ensures there are no valid file
    descriptors to close via forcewake debugfs, preventing refcount
    mismanagement.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch d77e26a2d2f173b7998932b5d76173816ed5e158 drm-intel
39979816afb3 drm/xe: Error handling in xe_force_wake_get()
b0330d70e5f9 drm/xe: Ensure __must_check for xe_force_wake_get() return
f7ba3a369c37 drm/xe/gsc: call xe_force_wake_put() only if xe_force_wake_get() succeeds
7bf57fb33a1b drm/xe/gt: call xe_force_wake_put() only if xe_force_wake_get() succeeds
5a8518e61fc8 drm/xe/guc: call xe_force_wake_put() only if xe_force_wake_get() succeeds
f56d1ef013c2 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
f8c4032ec513 drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put if xe_force_wake_get succeds
83228aadbb85 drm/xe: Change return type to void for xe_force_wake_put
be937992f598 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure


