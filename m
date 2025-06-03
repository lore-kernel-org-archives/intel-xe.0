Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B33C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762010E0F2;
	Tue,  3 Jun 2025 18:51:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16310E0CB;
 Tue,  3 Jun 2025 18:51:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enhance_SVM_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 18:51:52 -0000
Message-ID: <174897671219.45422.12686108729667840732@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603184522.2218192-1-matthew.brost@intel.com>
In-Reply-To: <20250603184522.2218192-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/149796/
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
commit f46f5068aabbbc1439d4795ca509d40943b13790
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 3 11:45:22 2025 -0700

    drm/xe: Add more SVM GT stats
    
    Add more SVM GT stats which give visibility to where time is spent in
    the SVM page fault handler. Stats include number of faults at a given
    size, total SVM page fault time, migration time in us, copy time in us,
    copy kb, get pages time in us, and bind time in us. Will help in tuning
    SVM for performance.
    
    v2:
     - Include local changes
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
21ceb6a2cd86 drm/xe: Add clear_stats GT debugfs
f46f5068aabb drm/xe: Add more SVM GT stats
-:322: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#322: FILE: drivers/gpu/drm/xe/xe_svm.c:1062:
+		goto out;;

total: 0 errors, 1 warnings, 0 checks, 348 lines checked


