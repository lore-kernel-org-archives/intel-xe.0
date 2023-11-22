Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4568C61D96
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 08:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBD610E5DA;
	Wed, 22 Nov 2023 08:24:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0FAB10E5F4;
 Wed, 22 Nov 2023 08:24:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9DACCA3ECB;
 Wed, 22 Nov 2023 08:24:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 22 Nov 2023 08:24:10 -0000
Message-ID: <170064145064.4727.7879454944174212061@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_RF?=
 =?utf-8?q?C=3A_drm/xe=3A_Return_correct_error_code_for_xe=5Fwait=5Fuser?=
 =?utf-8?q?=5Ffence=5Fioctl_=28rev2=29?=
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

Series: RFC: drm/xe: Return correct error code for xe_wait_user_fence_ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/126549/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 67fd14e3a52497947fc411e1b35fccdcfb678d4d
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Wed Nov 22 09:51:42 2023 +0530

    RFC: drm/xe: Return correct error code for xe_wait_user_fence_ioctl
    
    return correct error code if exec_queue is reset/engine is hung
    remove the num_engines/instances members from drm_xe_wait_user_fence structure
    and add a exec_queue_id member
    
    v2: Addressed the review comments
    
    Need to validated the changes
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
67fd14e3a RFC: drm/xe: Return correct error code for xe_wait_user_fence_ioctl
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
remove the num_engines/instances members from drm_xe_wait_user_fence structure

-:44: WARNING:TABSTOP: Statements should start on a tabstop
#44: FILE: drivers/gpu/drm/xe/xe_execlist.c:452:
+	 return false;

total: 0 errors, 2 warnings, 0 checks, 178 lines checked


