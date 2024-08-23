Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5767AC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 18:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20E10EC9D;
	Fri, 23 Aug 2024 18:12:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B1F10EC9D;
 Fri, 23 Aug 2024 18:12:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_separate_rp?=
 =?utf-8?q?m_lockdep_map_for_non-d3cold-capable_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 18:12:21 -0000
Message-ID: <172443674109.747671.9021756884633861112@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices
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
commit a456725735ac29af020589bfcc036419c1f10854
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Aug 23 18:58:17 2024 +0200

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
    
    Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
    Cc: "Auld, Matthew" <matthew.auld@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 96041621daaf71059d790a2ddbaa60114371eada drm-intel
a456725735ac drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices


