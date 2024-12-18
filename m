Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735BE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E183910E267;
	Wed, 18 Dec 2024 12:55:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C91B10E267;
 Wed, 18 Dec 2024 12:55:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_SRIOV_VRAM_provis?=
 =?utf-8?q?ioning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 12:55:29 -0000
Message-ID: <173452652924.47295.1785826175765616950@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218121837.226393-9-matthew.auld@intel.com>
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
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

Series: Improve SRIOV VRAM provisioning
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8734ab44ca425a52d56af83ed55fca285c630d5a
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Dec 18 12:18:45 2024 +0000

    drm/xe/sriov: support non-contig VRAM provisioning
    
    Currently we can run into issues with provisioning VRAM region, due to
    requiring contig VRAM BO underneath. We sometimes see that allocation
    (multiple GB) can fail even when there is enough free space.  We don't
    need CPU access to the buffer in the first place, so can forgo pin_map
    and therefore also the contig requirement. Keep the same behavior with
    save and restore during suspend/resume (which can now be done with
    blitter).  We also need the VRAM to occupy the same pages so we don't
    need to re-program the LMTT, so should still remain pinned (also we
    don't want something to try evict it). With that covert over to plain
    pinned kernel object.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1d0ef0c9b38ec3433a841e26e6fb553d820ba32c drm-intel
e873c194f75e drm/xe: use backup object for pinned save/restore
92537e2a213d drm/xe: split pinned save/restore into phases
687d01c4c3f5 drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
d9748e596900 drm/xe: add XE_BO_FLAG_PINNED_EARLY_RESTORE
42ff6a043506 drm/xe: unconditionally apply PINNED for pin_map()
fe02bbf9d15a drm/xe: allow non-contig VRAM kernel BO
8734ab44ca42 drm/xe/sriov: support non-contig VRAM provisioning


