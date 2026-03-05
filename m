Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B4F513E6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322D10EC61;
	Thu,  5 Mar 2026 22:47:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058E810EC61;
 Thu,  5 Mar 2026 22:47:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Skip_media_GT_T?=
 =?utf-8?q?LB_invalidation_when_VM_has_no_queues_mapped?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Mar 2026 22:47:33 -0000
Message-ID: <177275085300.322779.11667668956578090291@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304233728.926378-1-matthew.brost@intel.com>
In-Reply-To: <20260304233728.926378-1-matthew.brost@intel.com>
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

Series: drm/xe: Skip media GT TLB invalidation when VM has no queues mapped
URL   : https://patchwork.freedesktop.org/series/162614/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit de687fdaf7eda54bda2557b65b75eb1b018ea8e2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Mar 4 15:37:28 2026 -0800

    drm/xe: Skip media GT TLB invalidation when VM has no queues mapped
    
    If no exec queues from a VM are mapped on the media GT, issuing a
    PPGTT TLB invalidation for that GT requires an rc6 wake which is
    expensive.
    
    Skip the media GT TLB invalidation when the VM has no exec queues
    mapped on it. If TLB invalidations are already in-flight on that GT
    we can't break fence ordering, so issue a dummy GGTT invalidation
    instead to maintain seqno ordering.
    
    This optimization is particularly impactful for SVM workloads which
    may or may not use the media GT. Average TLB invalidation time drops
    from ~75us to ~18us in such benchmarks.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 0173caacd7e64feb97afe9bd5dcd51ad20c9f77a drm-intel
de687fdaf7ed drm/xe: Skip media GT TLB invalidation when VM has no queues mapped
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#20: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6 # Documentation only.'
#20: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.

total: 1 errors, 1 warnings, 0 checks, 55 lines checked


