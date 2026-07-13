Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77736C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 19:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521810E653;
	Mon, 13 Jul 2026 19:50:56 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E5910E653;
 Mon, 13 Jul 2026 19:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Reject_PXP_usag?=
 =?utf-8?q?e_on_multi-queue_exec_queues_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 19:50:54 -0000
Message-ID: <178397225448.185203.5874367867118571812@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <3fe42f29f4216bf9e7de4dbf582ace608e6d30eb.1783971737.git.jagmeet.randhawa@intel.com>
In-Reply-To: <3fe42f29f4216bf9e7de4dbf582ace608e6d30eb.1783971737.git.jagmeet.randhawa@intel.com>
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

Series: drm/xe: Reject PXP usage on multi-queue exec queues (rev2)
URL   : https://patchwork.freedesktop.org/series/170147/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf660d54cb8a9ef7e6dff3c00c43dffff13fd2cb
Author: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Date:   Tue Jul 14 03:44:49 2026 +0800

    drm/xe: Reject PXP usage on multi-queue exec queues
    
    HWDRM is currently the only supported PXP type, and it is display
    related, so it cannot be combined with multi-queue exec queue groups.
    Reject exec queue creation that requests both multi-queue and PXP,
    returning -EINVAL.
    
    The secondary queue path already rejects any PXP property, so this
    adds the missing check for the multi-queue primary,
    which would otherwise allow the combination.
    
    Validated with igt@xe_exec_multi_queue@sanity, which exercises both
    the PXP-unsupported (-ENODEV) and PXP-supported (-EINVAL) paths.
    
    Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
+ /mt/dim checkpatch b4ff3505d3eacce720d43e24651ce84f2a0d7f56 drm-intel
cf660d54cb8a drm/xe: Reject PXP usage on multi-queue exec queues
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:1075:
+	if (XE_IOCTL_DBG(xe, (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)) &&
+				(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))

total: 0 errors, 0 warnings, 1 checks, 23 lines checked


