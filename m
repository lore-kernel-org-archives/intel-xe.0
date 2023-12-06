Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D293C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 07:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A751D10E695;
	Wed,  6 Dec 2023 07:34:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 022F810E695;
 Wed,  6 Dec 2023 07:34:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EBD75AADD5;
 Wed,  6 Dec 2023 07:34:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 07:34:38 -0000
Message-ID: <170184807896.26425.5217165729897154684@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_RF?=
 =?utf-8?q?C=3A_drm/xe/uapi=3A_Return_correct_error_code_for_xe=5Fwait=5Fu?=
 =?utf-8?q?ser=5Ffence=5Fioctl_=28rev3=29?=
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

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/127365/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f4bb477433958aa461c76cefb2469767c53d8e6
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Wed Dec 6 09:11:30 2023 +0530

    drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
    
    Currently xe_wait_user_fence_ioctl is not checking exec_queue state
    and blocking until timeout, with this patch wakeup the blocking wait
    if exec_queue reset happen and returning proper error code
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
8226818cb drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure
7f4bb4774 drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl


