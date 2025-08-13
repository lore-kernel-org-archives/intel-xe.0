Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942ECC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 19:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A80410E7C1;
	Wed, 13 Aug 2025 19:53:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D842310E7C1;
 Wed, 13 Aug 2025 19:53:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_serialize_store?=
 =?utf-8?q?=5Fdata_and_user=5Finterrupt_for_ufence_wait_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Aug 2025 19:53:16 -0000
Message-ID: <175511479687.234804.4384720272873105139@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250812182846.1608209-1-fei.yang@intel.com>
In-Reply-To: <20250812182846.1608209-1-fei.yang@intel.com>
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

Series: drm/xe: serialize store_data and user_interrupt for ufence wait (rev2)
URL   : https://patchwork.freedesktop.org/series/152847/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3aca4152a2cce49748c02f641047bab24cff585c
Author: Fei Yang <fei.yang@intel.com>
Date:   Tue Aug 12 11:28:46 2025 -0700

    drm/xe: serialize store_data and user_interrupt for ufence wait
    
    Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation with
    command execution proceeding normally. Although the write operation is
    guaranteed to complete eventually, there is no mechanism to synchronize
    command execution with the completion (or even initiation) of these
    operations."
    The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT consecutively
    to implement user fence. However, according to the BSpec, the data write
    operation is not guaranteed to be completed when triggering the interrupt,
    that would cause the xe_wait_user_fence_ioctl to wait until the full user
    specified timeout is reached before checking the fence value again. Great
    performance degradation has been observed in IGT xe_exec_fault_mode test
    cases due to this unnecessary wait. The worst case is that if user set the
    timeout to MAX_INT32, the wait could end up being a hang until some other
    random program triggers a user interrupt to wake it up.
    A semaphore wait is added right after the data write to avoid the unexpected
    wait.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
+ /mt/dim checkpatch b6d374ca303d7b9f6456bc6db0cfe6e4d30bf472 drm-intel
3aca4152a2cc drm/xe: serialize store_data and user_interrupt for ufence wait
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT consecutively

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


