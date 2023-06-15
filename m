Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE3EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E37310E52F;
	Thu, 15 Jun 2023 17:35:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F01210E52F;
 Thu, 15 Jun 2023 17:35:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2C5D4AA01E;
 Thu, 15 Jun 2023 17:35:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 15 Jun 2023 17:35:08 -0000
Message-ID: <168685050817.10727.7280557426354822956@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615173014.258703-1-matthew.brost@intel.com>
In-Reply-To: <20230615173014.258703-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Sc?=
 =?utf-8?q?heduler_changes_for_upstreaming_=28rev5=29?=
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

Series: Scheduler changes for upstreaming (rev5)
URL   : https://patchwork.freedesktop.org/series/118091/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a9585ad2f55c67f982522f0dd06204a2f3bdeb2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 15 10:30:14 2023 -0700

    drm/xe: VM LRU bulk move
    
    Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
    LRU position on every exec.
    
    v2: Bulk move for compute VMs, use WARN rather than BUG
    
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6d2981d42cd891965094ec7d173203520cfa36f7 drm-intel
538db1e42 fixup! drm/sched: Convert drm scheduler to use a work queue rather than kthread
670bfac9f drm/sched: Move schedule policy to scheduler
-:165: WARNING:LONG_LINE: line length of 210 exceeds 100 columns
#165: FILE: drivers/gpu/drm/scheduler/sched_main.c:75:
+MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

total: 0 errors, 1 warnings, 0 checks, 268 lines checked
b7fd3b16c drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
9884a8b4f drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
9c7a328e7 drm/xe: Long running job update
cc85b522a drm/xe: Ensure LR engines are not persistent
5c16af0c8 drm/xe: Only try to lock external BOs in VM bind
9a9585ad2 drm/xe: VM LRU bulk move


