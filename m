Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2350C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 20:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A60E112D42;
	Mon, 22 Apr 2024 20:20:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAD2112D41;
 Mon, 22 Apr 2024 20:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_make_xe=5Fpm=5F?=
 =?utf-8?q?runtime=5Flockdep=5Fmap_a_static_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Apr 2024 20:20:46 -0000
Message-ID: <171381724619.1570262.15297426521831506541@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240422201454.699089-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240422201454.699089-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: make xe_pm_runtime_lockdep_map a static struct
URL   : https://patchwork.freedesktop.org/series/132729/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0b5fd4337b1e54fe7f58120f0cbf6aca5e53bb1f
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Apr 22 16:14:54 2024 -0400

    drm/xe: make xe_pm_runtime_lockdep_map a static struct
    
    Fix the new sparse warning:
    
    >> drivers/gpu/drm/xe/xe_pm.c:72:20: sparse: sparse: symbol
    'xe_pm_runtime_lockdep_map' was not declared. Should it be static?
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202404191329.EZzOTzwK-lkp@intel.com/
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d3410a305a38ffffd42343c3beba610f2ceca377 drm-intel
0b5fd4337b1e drm/xe: make xe_pm_runtime_lockdep_map a static struct


