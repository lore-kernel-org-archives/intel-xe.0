Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D48C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F46B10E0B6;
	Mon, 18 Mar 2024 21:57:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DD210E72F;
 Mon, 18 Mar 2024 21:57:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Always_check_fo?=
 =?utf-8?q?rce=5Fwake=5Fget_return_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 21:57:39 -0000
Message-ID: <171079905953.900325.7922119040991865085@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Always check force_wake_get return code (rev2)
URL   : https://patchwork.freedesktop.org/series/131045/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 441d3cb41c0282e3bfb0d6b72299ebb3e4c0ec6d
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Mar 18 08:49:24 2024 -0700

    drm/xe: Always check force_wake_get return code
    
    A force_wake_get failure means that the HW might not be awake for the
    access we're doing; this can lead to an immediate error or it can be a
    more subtle problem (e.g. a register read might return an incorrect
    value that is still valid, leading the driver to make a wrong choice
    instead of flagging an error).
    We avoid an error from the force_wake function because callers might
    handle or tolerate the error, but this only works if all callers
    are checking the error code. The majority already do, but a few are not.
    These are mainly falling into 3 categories, which are each handled
    differently:
    
    1) error capture: in this case we want to continue the capture, but we
       log an info message in dmesg to notify the user that the capture
       might have incorrect data.
    
    2) ioctl: in this case we return a -EIO error to userspace
    
    3) unabortable actions: these are scenarios where we can't simply abort
       and retry and so it's better to just try it anyway because there is a
       chance the HW is awake even with the failure. In this case we throw a
       warning so we know there was a forcewake problem if something fails
       down the line.
    
    v2: use gt_WARN_ON where appropriate
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ce8cc731d53f9197a853b0d00386d7835f2b80e6 drm-intel
441d3cb41c02 drm/xe: Always check force_wake_get return code


