Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CADC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 23:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85B113778;
	Tue, 23 Apr 2024 23:55:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3059113775;
 Tue, 23 Apr 2024 23:55:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_distinct_er?=
 =?utf-8?q?ror_code_in_VM=5FCREATE_for_device_fault_mode_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 23:55:30 -0000
Message-ID: <171391653079.1610190.3651788787219792018@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423234707.6587-1-brian.welty@intel.com>
In-Reply-To: <20240423234707.6587-1-brian.welty@intel.com>
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

Series: drm/xe: Use distinct error code in VM_CREATE for device fault mode checks
URL   : https://patchwork.freedesktop.org/series/132803/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab0b6663758259af0f6858fef224a19768ff3f8d
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Apr 23 16:47:07 2024 -0700

    drm/xe: Use distinct error code in VM_CREATE for device fault mode checks
    
    vm_create_ioctl doesn't allow creating new VM in fault_mode while existing
    VMs are in non-fault mode, and vice-versa.
    This is not necessarily the user doing anything wrong if others are sharing
    the system. Instead of returning -EINVAL which suggests the user provided a
    bad argument, return distinct error code of -EBUSY for this class of errors
    so the user knows they can retry the vm_create when system is idle.
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch b5b592a3902a51cc5747c625aa1898768d4ce79a drm-intel
ab0b66637582 drm/xe: Use distinct error code in VM_CREATE for device fault mode checks


