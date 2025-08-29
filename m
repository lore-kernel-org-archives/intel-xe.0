Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D5CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 19:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78310EC34;
	Fri, 29 Aug 2025 19:39:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD610EC34;
 Fri, 29 Aug 2025 19:39:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enhance_SVM_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 19:39:45 -0000
Message-ID: <175649638522.286105.5428211541311455697@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829172232.1308004-1-matthew.brost@intel.com>
In-Reply-To: <20250829172232.1308004-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/153727/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec5c8319ce2a975e7b869659d5b366b7c1bb1d1e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 29 10:22:32 2025 -0700

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
    v4:
     - Ensure gt not NULL when incrementing SVM copy stats
     - Normalize stats names
     - Use magic macros to generate increment functions for ranges
    v7:
     - Use DEF_STAT_STR (Michal)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 94efba53a792987b3649b6370e69f772c2210412 drm-intel
011e9941acac drm/xe: Add clearing stats to GT debugfs
ec5c8319ce2a drm/xe: Add more SVM GT stats
-:34: ERROR:BRACKET_SPACE: space prohibited before open square bracket '['
#34: FILE: drivers/gpu/drm/xe/xe_gt_stats.c:29:
+#define DEF_STAT_STR(ID, name) [XE_GT_STATS_ID_##ID] = name

total: 1 errors, 0 warnings, 0 checks, 428 lines checked


