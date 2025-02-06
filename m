Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A8CC02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 17:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0210E8EF;
	Thu,  6 Feb 2025 17:18:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3707D10E8F5;
 Thu,  6 Feb 2025 17:18:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_uninitializ?=
 =?utf-8?q?ed_pointer_read_in_xe=5Fvm=5Fbind=5Fkernel=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dheeraj Reddy Jonnalagadda" <dheeraj.linuxdev@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 17:18:06 -0000
Message-ID: <173886228622.2143846.16815809936758772814@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
In-Reply-To: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
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

Series: drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
URL   : https://patchwork.freedesktop.org/series/144428/
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
commit c139ae6efee92b9c748c76882559134f067da647
Author: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Date:   Thu Feb 6 19:17:06 2025 +0530

    drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo
    
    xe_vm_bind_kernel_bo() declares the variable fence without initializing
    it. If an error occurs before fence is assigned a valid value, the
    function may return an uninitialized pointer.
    
    Specifically, this can happen if:
    
    - vm_bind_ioctl_ops_create() fails, leading to release_vm_lock error
      path
    
    Initialize fence to NULL at declaration.
    
    Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
    Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
+ /mt/dim checkpatch 68225b9bc1d285bd2ab63355e94f9e661d2f895e drm-intel
c139ae6efee9 drm/xe: Fix uninitialized pointer read in xe_vm_bind_kernel_bo


