Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60161C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 14:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297F310E05A;
	Fri, 10 Nov 2023 14:13:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CDE310E05A;
 Fri, 10 Nov 2023 14:13:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B160AADE8;
 Fri, 10 Nov 2023 14:13:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 10 Nov 2023 14:13:28 -0000
Message-ID: <169962560810.31677.2053398799437416672@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/vm=2C_drm/xe/uapi=3A_Use_LR_abbrev_for_long-running_vms?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/vm, drm/xe/uapi: Use LR abbrev for long-running vms
URL   : https://patchwork.freedesktop.org/series/126273/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62288c33d2f87645252a448dcaaa71b8c9b8e4f1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Nov 10 14:59:13 2023 +0100

    drm/xe/vm, drm/xe/uapi: Use LR abbrev for long-running vms
    
    Currently we're using "compute mode" for long running VMs using
    using preempt-fences for memory management, and "fault mode" for long
    running VMs using page faults. Internally the driver uses "no_dma_fences"
    for long-running vms which is a bit misleading since dma-fences are only
    disallowed as out-fences.
    
    Change this to use the terminology "long-running" abbreviated as LR for
    long-running VMs. These VMs can then either be in preempt-fence mode or
    fault mode. The user can force fault mode at creation time, but otherwise
    the driver can choose to use fault- or preempt-fence mode for long-running
    vms depending on the device capabilities. Initially unless fault-mode is
    specified, the driver uses preempt-fence mode.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch b3890fb4386dcef68a96888141c4cc773f6241ce drm-intel
62288c33d drm/xe/vm, drm/xe/uapi: Use LR abbrev for long-running vms


