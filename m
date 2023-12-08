Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F87C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB7D10E9D7;
	Fri,  8 Dec 2023 05:01:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE58310E9D6;
 Fri,  8 Dec 2023 05:01:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B7A17A47DF;
 Fri,  8 Dec 2023 05:01:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_RFC=3A_drm/xe/uapi=3A_Ret?=
 =?utf-8?q?urn_correct_error_code_for_xe=5Fwait=5Fuser=5Ffence=5Fioctl_=28re?=
 =?utf-8?q?v5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Fri, 08 Dec 2023 05:01:57 -0000
Message-ID: <170201171774.7326.7557901055015282876@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
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

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl (rev5)
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
commit 1ea4104718313e6ac3c8ce807e231355562e8ef1
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Fri Dec 8 09:47:16 2023 +0530

    drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
    
    Currently xe_wait_user_fence_ioctl is not checking exec_queue state
    and blocking until timeout, with this patch wakeup the blocking wait
    if exec_queue reset happen and returning proper error code
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
739090f7d drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure
1ea410471 drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl


