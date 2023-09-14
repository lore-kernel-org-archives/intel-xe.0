Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ED9EEAA78
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 22:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FA610E12D;
	Thu, 14 Sep 2023 22:22:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 064F210E12D;
 Thu, 14 Sep 2023 22:22:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 06AA2AADE3;
 Thu, 14 Sep 2023 22:22:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 14 Sep 2023 22:22:34 -0000
Message-ID: <169473015402.29165.5244814095274655014@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914204053.2220281-1-matthew.brost@intel.com>
In-Reply-To: <20230914204053.2220281-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_changes_to_align_with_async_binds?=
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

Series: uAPI changes to align with async binds
URL   : https://patchwork.freedesktop.org/series/123729/
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
commit 8e719a98c037cefe27fbb1bac9ab6ff397dbcde2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Sep 14 13:40:53 2023 -0700

    drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
    
    The idea being out-syncs can signal indicating all previous operations
    on the exec queue are complete. An example use case of this would be
    support for implementing vkQueueWaitForIdle easily.
    
    v2: Don't add last_fence for VM's that do not support dma fences
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch aeac46cfaebff413254ac07837b97370c7ed3957 drm-intel
1d0cef8fc drm/xe/uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
06a193283 drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
532d174b3 drm/xe: Remove async worker and rework sync binds
-:93: ERROR:TRAILING_WHITESPACE: trailing whitespace
#93: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:667:
+^I$

-:1206: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthew Brost <mattthew.brost@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 1094 lines checked
53ffd3ba5 drm/xe: Fix VM bind out-sync signaling ordering
5f3b4116c drm/xe: Allow num_binds == 0 in VM bind IOCTL
-:52: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#52: FILE: drivers/gpu/drm/xe/xe_vm.c:2859:
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
8e719a98c drm/xe: Allow num_batch_buffer == 0 in exec IOCTL


