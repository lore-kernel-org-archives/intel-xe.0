Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4293C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7767F10E105;
	Tue,  3 Jun 2025 23:38:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5610E105;
 Tue,  3 Jun 2025 23:38:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enhance_SVM_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 23:38:42 -0000
Message-ID: <174899392227.45504.13138071695346372130@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603233445.2304383-1-matthew.brost@intel.com>
In-Reply-To: <20250603233445.2304383-1-matthew.brost@intel.com>
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

Series: Enhance SVM stats
URL   : https://patchwork.freedesktop.org/series/149811/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2cb8e85f88137dec34f8b1ac68fe87b9b6a4b57f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 3 16:34:45 2025 -0700

    drm/xe: Add more SVM GT stats
    
    Add more SVM GT stats which give visibility to where time is spent in
    the SVM page fault handler. Stats include number of faults at a given
    size, total SVM page fault time, migration time in us, copy time in us,
    copy kb, get pages time in us, and bind time in us. Will help in tuning
    SVM for performance.
    
    v2:
     - Include local changes
    v3:
     - Add tlb invalidation + valid page fault + per size copy size stats
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2d51392d455943d0356d982902ce994f91996d3e drm-intel
f3f1ace1d366 drm/xe: Add clear_stats GT debugfs
2cb8e85f8813 drm/xe: Add more SVM GT stats
-:457: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#457: FILE: drivers/gpu/drm/xe/xe_svm.c:1134:
+		goto out;;

total: 0 errors, 1 warnings, 0 checks, 476 lines checked


