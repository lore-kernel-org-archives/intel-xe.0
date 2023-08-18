Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA56AC71155
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 15:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E3010E53C;
	Fri, 18 Aug 2023 15:12:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5AD310E53C;
 Fri, 18 Aug 2023 15:12:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B217AAADE4;
 Fri, 18 Aug 2023 15:12:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 18 Aug 2023 15:12:49 -0000
Message-ID: <169237156972.12739.5226813117650521530@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Support_optional_pinning_of_userptr_pages?=
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

Series: drm/xe: Support optional pinning of userptr pages
URL   : https://patchwork.freedesktop.org/series/122637/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8baf16a1dcffe185d2cf67ef735f96d3155d57db
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Aug 18 17:08:45 2023 +0200

    drm/xe/uapi: Support pinning of userptr vmas
    
    Support pinning of vmas using XE_VM_BIND_FLAG_PIN, initially for userptr
    only. Pinned memory becomes accounted against RLIMIT_MEMLOCK and processes
    with CAP_IPC_LOCK will not apply the limit. This is pretty similar to
    mlock()'ing userptr memory with the added benefit that the driver is
    aware and can ignore some actions in the MMU invalidation notifier.
    
    This will initially become useful for compute VMs on hardware without
    mid-thread-preemption capability since with pinned pages, the MMU
    invalidation notifier never tries to preempt a running compute kernel.
    
    If that were the only usage we could restrict this to a flag that always
    pins userptr VMAs on compute VMs on such hardware, but there are
    indications that this may become needed in other situations as well.
    
    From a more general point of view, the usage pattern of a system may be
    such that in most cases it only ever runs a single workload per system
    and then the sysadmin would want to configure the system to allow
    extensive pinning for performance reasons.
    
    Hence we might want to extend the pinning capability to bo-backed VMAs
    as well. How that pinning will be accounted remains an open but to build
    on the current drm CGROUP work would be an option.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9112bca10116fdc4c33220478c47aa92f95832fe drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


