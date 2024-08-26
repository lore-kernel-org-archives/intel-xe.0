Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A21C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 08:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8310E155;
	Mon, 26 Aug 2024 08:44:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC3310E155;
 Mon, 26 Aug 2024 08:44:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_separate_rp?=
 =?utf-8?q?m_lockdep_map_for_non-d3cold-capable_devices_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 08:44:22 -0000
Message-ID: <172466186249.783343.18204045376637064230@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826083759.98305-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240826083759.98305-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices (rev3)
URL   : https://patchwork.freedesktop.org/series/137730/
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
commit a0af6caf29839e43c172441965e5f47c01ed8eab
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Aug 26 10:37:59 2024 +0200

    drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices
    
    For non-d3cold-capable devices we'd like to be able to wake up the
    device from reclaim. In particular, for Lunar Lake we'd like to be
    able to blit CCS metadata to system at shrink time; at least from
    kswapd where it's reasonable OK to wait for rpm resume and a
    preceding rpm suspend.
    
    Therefore use a separate lockdep map for such devices and prime it
    reclaim-tainted.
    
    v2:
    - Rename lockmap acquire- and release functions. (Rodrigo Vivi).
    - Reinstate the old xe_pm_runtime_lockdep_prime() function and
      rename it to xe_rpm_might_enter_cb(). (Matthew Auld).
    - Introduce a separate xe_pm_runtime_lockdep_prime function
      called from module init for known required locking orders.
    v3:
    - Actually hook up the prime function at module init.
    v4:
    - Rebase.
    
    Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
    Cc: "Auld, Matthew" <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2.
+ /mt/dim checkpatch 16bd1e79da2f0236cc5df0bad83e05dc44a31774 drm-intel
a0af6caf2983 drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices


