Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B1C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 10:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419510E3FE;
	Mon, 10 Mar 2025 10:56:47 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505EC10E3FC;
 Mon, 10 Mar 2025 10:56:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_uninitializ?=
 =?utf-8?q?ed_variable_in_xe=5Fvm=5Fbind=5Fioctl=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 10:56:46 -0000
Message-ID: <174160420632.12909.14894053637131851087@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
In-Reply-To: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
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

Series: drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
URL   : https://patchwork.freedesktop.org/series/146076/
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
commit 2283c98f7d67304307097f9297729ff79f7b8bf2
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Mon Mar 10 13:48:00 2025 +0300

    drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
    
    The error handling assumes that vm_bind_ioctl_check_args() will
    initialize "bind_ops" but there are a couple early returns where that's
    not true.  Initialize "bind_ops" to NULL from the start.
    
    Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
+ /mt/dim checkpatch 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a drm-intel
2283c98f7d67 drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()


