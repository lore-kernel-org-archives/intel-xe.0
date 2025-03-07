Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF00CC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 20:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABBA10E192;
	Fri,  7 Mar 2025 20:52:11 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F73D10E192;
 Fri,  7 Mar 2025 20:52:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Improve_SRIOV_VRAM_provis?=
 =?utf-8?q?ioning_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 20:52:10 -0000
Message-ID: <174138073005.4463.5910950734818720407@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307182856.304850-10-matthew.auld@intel.com>
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
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

Series: Improve SRIOV VRAM provisioning (rev2)
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit efaf4cfd087495177fe825cd473264facd4bfe22
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Mar 7 18:29:05 2025 +0000

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
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
587234afc132 drm/xe: use backup object for pinned save/restore
3089e8bfe654 drm/xe: split pinned save/restore into phases
13417fcc65fe drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
e8a82eb4f8b4 drm/xe/migrate: ignore CCS for kernel objects
d0415311d8f4 drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
3b0578b5099f drm/xe: unconditionally apply PINNED for pin_map()
a2a6c72da0bd drm/xe: allow non-contig VRAM kernel BO
efaf4cfd0874 drm/xe/sriov: support non-contig VRAM provisioning


