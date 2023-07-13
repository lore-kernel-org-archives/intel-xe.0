Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EF3EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 02:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591BB10E161;
	Thu, 13 Jul 2023 02:03:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96A2110E161;
 Thu, 13 Jul 2023 02:03:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 927BEA0093;
 Thu, 13 Jul 2023 02:03:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Thu, 13 Jul 2023 02:03:34 -0000
Message-ID: <168921381459.14983.6445095354804829600@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713020105.21570-1-brian.welty@intel.com>
In-Reply-To: <20230713020105.21570-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_lockdep_warning_from_xe=5Fvm=5Fmadvise?=
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

Series: drm/xe: Fix lockdep warning from xe_vm_madvise
URL   : https://patchwork.freedesktop.org/series/120645/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 329721780c1322703f7ab9a137ab7fbeb9451a6a
Author: Brian Welty <brian.welty@intel.com>
Date:   Wed Jul 12 19:01:05 2023 -0700

    drm/xe: Fix lockdep warning from xe_vm_madvise
    
    We need to hold vm->lock before the xe_vm_is_closed_or_banned().
    
    Else we get this splat:
    [  802.555227] ------------[ cut here ]------------
    [  802.555234] WARNING: CPU: 33 PID: 3122 at drivers/gpu/drm/xe/xe_vm.h:60 xe_vm_madvise_ioctl+0x2de/0x440 [xe]
    [  802.555515] CPU: 33 PID: 3122 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
    ...
    [  802.555709] Call Trace:
    [  802.555714]  <TASK>
    [  802.555720]  ? __warn+0x81/0x170
    [  802.555737]  ? xe_vm_madvise_ioctl+0x2de/0x440 [xe]
    
    Fixes: 627d78b9d038 ("drm/xe: Ban a VM if rebind worker hits an error")
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
329721780 drm/xe: Fix lockdep warning from xe_vm_madvise
-:18: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '627d78b9d038', maybe rebased or not pulled?
#18: 
Fixes: 627d78b9d038 ("drm/xe: Ban a VM if rebind worker hits an error")

total: 0 errors, 1 warnings, 0 checks, 22 lines checked


