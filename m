Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EF7C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 19:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7ED10E08D;
	Wed, 26 Mar 2025 19:21:11 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663C110E08D;
 Wed, 26 Mar 2025 19:21:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_SRIOV_VRAM_provis?=
 =?utf-8?q?ioning_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 19:21:10 -0000
Message-ID: <174301687041.7341.11015451051906144334@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326181908.124082-9-matthew.auld@intel.com>
In-Reply-To: <20250326181908.124082-9-matthew.auld@intel.com>
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

Series: Improve SRIOV VRAM provisioning (rev3)
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bc24c626f1691d44070d6610b634505b20a6a912
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Mar 26 18:19:16 2025 +0000

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
    Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
a7a0148e8b11 drm/xe: use backup object for pinned save/restore
7e50a876eb49 drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
7818b0dc7bae drm/xe/migrate: ignore CCS for kernel objects
44de5a6cb644 drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
834c921fdc53 drm/xe: unconditionally apply PINNED for pin_map()
0eea88d959b2 drm/xe: allow non-contig VRAM kernel BO
bc24c626f169 drm/xe/sriov: support non-contig VRAM provisioning


