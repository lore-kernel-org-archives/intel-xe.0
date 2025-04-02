Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E34AC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB80C10E743;
	Wed,  2 Apr 2025 10:40:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0819A10E742;
 Wed,  2 Apr 2025 10:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_SRIOV_VRAM_provis?=
 =?utf-8?q?ioning_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 10:40:19 -0000
Message-ID: <174359041902.26680.11891522336306999838@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402092921.79918-9-matthew.auld@intel.com>
In-Reply-To: <20250402092921.79918-9-matthew.auld@intel.com>
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

Series: Improve SRIOV VRAM provisioning (rev4)
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
commit a7ad6f4a07bce64e97d724a01532ed5804e12521
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Apr 2 10:29:29 2025 +0100

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
+ /mt/dim checkpatch f0fd77956987f035c79d08c812343a27a655a57b drm-intel
f003bcbb259d drm/xe: use backup object for pinned save/restore
908bf09674af drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
ae46fd67eab1 drm/xe/migrate: ignore CCS for kernel objects
dd42b146e528 drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
231ec7721f97 drm/xe: unconditionally apply PINNED for pin_map()
945239a1693b drm/xe: allow non-contig VRAM kernel BO
a7ad6f4a07bc drm/xe/sriov: support non-contig VRAM provisioning


