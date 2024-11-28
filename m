Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA1D70DEE
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 20:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31A610E20D;
	Thu, 28 Nov 2024 20:52:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD54110E27D;
 Thu, 28 Nov 2024 20:52:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Avoid_evicting_?=
 =?utf-8?q?object_of_the_same_vm_in_none_fault_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 20:52:35 -0000
Message-ID: <173282715590.42538.9875441714927406115@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128210103.1820743-1-oak.zeng@intel.com>
In-Reply-To: <20241128210103.1820743-1-oak.zeng@intel.com>
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

Series: drm/xe: Avoid evicting object of the same vm in none fault mode
URL   : https://patchwork.freedesktop.org/series/141898/
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
commit ad83a79abb17067b57fae06555d8f8b6228005d1
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Thu Nov 28 16:01:03 2024 -0500

    drm/xe: Avoid evicting object of the same vm in none fault mode
    
    BO validation during vm_bind could trigger memory eviction when
    system runs under memory pressure. Right now we blindly evict
    BOs of all VMs. This scheme has a problem when system runs in
    none recoverable page fault mode: even though the vm_bind could
    be successful by evicting BOs, the later the rebinding of the
    evicted BOs would fail. So it is better to report an out-of-
    memory failure at vm_bind time than at time of rebinding where
    xekmd currently doesn't have a good mechanism to report error
    to user space.
    
    This patch implemented a scheme to only evict objects of other
    VMs during vm_bind time. Object of the same VM will skip eviction.
    If we failed to find enough memory for vm_bind, we report error
    to user space at vm_bind time.
    
    This scheme is not needed for recoverable page fault mode under
    what we can dynamically fault-in pages on demand.
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 2ad46928583b63ad6dc40ef74dfdac2d3125f3c8 drm-intel
ad83a79abb17 drm/xe: Avoid evicting object of the same vm in none fault mode


