Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33087C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 23:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BE110ED2E;
	Thu, 25 Apr 2024 23:35:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86610ED2E;
 Thu, 25 Apr 2024 23:35:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_xe=5Fguc=5Fsubmit_style_c?=
 =?utf-8?q?leanups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 23:35:13 -0000
Message-ID: <171408811390.1668716.11151882945884121229@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425232544.1935578-1-matthew.brost@intel.com>
In-Reply-To: <20240425232544.1935578-1-matthew.brost@intel.com>
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

Series: xe_guc_submit style cleanups (rev3)
URL   : https://patchwork.freedesktop.org/series/126081/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4dafc338c2c0d83bd369f56fee8b5c8823a7c428
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Apr 25 16:25:44 2024 -0700

    drm/xe: Replace engine references with exec queue in xe_guc_submit.c
    
    Exec queue has replaced engine nomenclature.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 92b848b529903fb99d21168491692474aae4872c drm-intel
b8c505dd895b drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
0da805133733 drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
cbbbcda049ef drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
b83df22325fc drm/xe: Fix alignment in GuC exec queue state defines
4dafc338c2c0 drm/xe: Replace engine references with exec queue in xe_guc_submit.c


