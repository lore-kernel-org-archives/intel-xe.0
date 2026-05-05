Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA525CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 17:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC3E10E137;
	Tue,  5 May 2026 17:06:00 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5421110E137;
 Tue,  5 May 2026 17:05:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI/IOV=3A_Restore_initia?=
 =?utf-8?q?l_VF_BAR_sizing_after_VF_ReBAR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 17:05:59 -0000
Message-ID: <177800075934.38316.4169518354059583757@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
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

Series: PCI/IOV: Restore initial VF BAR sizing after VF ReBAR
URL   : https://patchwork.freedesktop.org/series/166011/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 483916a4015a42fcfc4d9d894aa53a52c2abb16d
Author: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Date:   Tue May 5 19:00:10 2026 +0200

    PCI/IOV: Restore initial VF ReBAR sizes on PF release
    
    sriov_disable() and sriov_enable() error paths restore the per-VF BAR
    sizes saved at probe time. They do not cover the case where the PF
    driver is unbound while VF BARs were resized but SR-IOV was never
    enabled (or was already disabled).
    
    On the next bind, sriov_init() re-reads the SR-IOV capability and
    captures the current (inflated) BAR registers as the new initial sizes
    in iov->barsz_orig[]. The restore logic becomes a no-op for that boot
    and the kernel may reserve MMIO for the inflated VF aperture multiplied
    by TotalVFs.
    
    Restore the initial sizes from sriov_release() as well. At this point
    num_VFs is 0 (BUG_ON enforces it) and VF Memory Space is therefore
    disabled, satisfying the precondition of pci_iov_vf_bar_set_size().
    
    Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
+ /mt/dim checkpatch 0642e494a060664ccd22c0dcdd7b34043518f0a7 drm-intel
7f507bed2ac9 PCI/IOV: Remember initial VF BAR sizes
e283ad731ca1 PCI/IOV: Restore initial VF ReBAR sizes on SR-IOV disable/failure
-:109: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#109: FILE: drivers/pci/iov.c:751:
+			rc = -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
483916a4015a PCI/IOV: Restore initial VF ReBAR sizes on PF release


