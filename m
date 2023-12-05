Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB13C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 17:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048ED10E591;
	Tue,  5 Dec 2023 17:23:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D414B10E591;
 Tue,  5 Dec 2023 17:23:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D0EE8AADD5;
 Tue,  5 Dec 2023 17:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Tue, 05 Dec 2023 17:23:23 -0000
Message-ID: <170179700385.24285.17561696608921940188@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_RF?=
 =?utf-8?q?C=3A_drm/xe/uapi=3A_Return_correct_error_code_for_xe=5Fwait=5Fu?=
 =?utf-8?q?ser=5Ffence=5Fioctl?=
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

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
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
commit 61f52ce4336b991c4b575316a4403811479332c9
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Tue Dec 5 20:07:55 2023 +0530

    drm/xe: Return correct error code for xe_wait_user_fence_ioctl
    
    return correct error code if exec_queue is reset/engine is hung
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ac7b89571d802765762e7c15d78a6dcd5d92c41b drm-intel
2a4a38c2c drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure
61f52ce43 drm/xe: Return correct error code for xe_wait_user_fence_ioctl


