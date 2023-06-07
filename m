Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34515C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 16:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09C10E0A1;
	Wed,  7 Jun 2023 16:16:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6188D10E0A1;
 Wed,  7 Jun 2023 16:16:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5D456AADDD;
 Wed,  7 Jun 2023 16:16:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 07 Jun 2023 16:16:17 -0000
Message-ID: <168615457737.21181.9458596128930142726@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607160334.4111289-1-matthew.brost@intel.com>
In-Reply-To: <20230607160334.4111289-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Sc?=
 =?utf-8?q?heduler_changes_for_upstreaming_=28rev4=29?=
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

Series: Scheduler changes for upstreaming (rev4)
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
commit 5016ef86fafc2ddbf09bd35d7a72b1702649d2e2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jun 7 09:03:34 2023 -0700

    drm/xe: VM LRU bulk move
    
    Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
    LRU position on every exec.
    
    v2: Bulk move for compute VMs, use WARN rather than BUG
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch dc8094ef1ae1faa7bff0a2a3d510a38ba557302a drm-intel
bc39f78ce fixup! drm/sched: Convert drm scheduler to use a work queue rather than kthread
af688d9e0 drm/sched: Move schedule policy to scheduler
5037911cc drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
-:35: ERROR:SPACING: space required before the open parenthesis '('
#35: FILE: drivers/gpu/drm/scheduler/sched_entity.c:94:
+	if(num_sched_list) {

total: 1 errors, 0 warnings, 0 checks, 360 lines checked
c85cd2cd2 drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
2763b0bb8 drm/xe: Long running job update
591e828bf drm/xe: Ensure LR engines are not persistent
89ded2108 drm/xe: Only try to lock external BOs in VM bind
5016ef86f drm/xe: VM LRU bulk move
-:37: CHECK:LINE_SPACING: Please don't use multiple blank lines
#37: FILE: drivers/gpu/drm/xe/xe_bo.c:1011:
+
+

total: 0 errors, 0 warnings, 1 checks, 111 lines checked


