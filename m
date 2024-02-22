Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A34DC54798
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB6810EABB;
	Thu, 22 Feb 2024 23:32:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3654D10EABC;
 Thu, 22 Feb 2024 23:32:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_execlist_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 23:32:55 -0000
Message-ID: <170864477522.217031.8084995049287899832@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222232021.3911545-1-matthew.brost@intel.com>
In-Reply-To: <20240222232021.3911545-1-matthew.brost@intel.com>
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

Series: Fix execlist mode
URL   : https://patchwork.freedesktop.org/series/130289/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c0c66e5ace9f1d36b6c817496d190494838673b0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 22 15:20:21 2024 -0800

    drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
    
    The xe_gt_tlb_invalidation layer implements TLB invalidations for a GuC
    backend. Simply return if in execlists mode. A follow up may properly
    implement the xe_gt_tlb_invalidation layer for both GuC and execlists.
    
    Fixes: a9351846d945 ("drm/xe: Break of TLB invalidation into its own file")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5e139b8dd8049fee9f42fe76c603b5cfc286af7f drm-intel
7f980e3c5d18 drm/xe: Fix execlist splat
0154afd4e055 drm/xe: Cleanup some layering in GGTT
-:149: CHECK:BRACES: Unbalanced braces around else statement
#149: FILE: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:255:
+		} else

total: 0 errors, 0 warnings, 1 checks, 137 lines checked
c0c66e5ace9f drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer


