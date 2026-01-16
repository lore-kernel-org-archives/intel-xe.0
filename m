Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCCC98306
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC0F10E0F4;
	Fri, 16 Jan 2026 22:31:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AD310E0F4;
 Fri, 16 Jan 2026 22:31:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_multi=5Fqueue_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jan 2026 22:31:50 -0000
Message-ID: <176860271001.163695.13964220496542581860@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260116220333.861850-1-matthew.brost@intel.com>
In-Reply-To: <20260116220333.861850-1-matthew.brost@intel.com>
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

Series: Enable multi_queue (rev3)
URL   : https://patchwork.freedesktop.org/series/159992/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c780147df940015e53c7854f96d912ad82ca2be1
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri Jan 16 14:03:33 2026 -0800

    drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
    
    xe3p_xpc supports multi_queue, enable it.
    
    v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
        (Matt Brost)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 0f3aa82816dce3da347333a317ea112d16e5d237 drm-intel
764837c84282 drm/xe: Ban entire multi-queue group on any job timeout
-:57: WARNING:TYPO_SPELLING: 'stoppped' may be misspelled - perhaps 'stopped'?
#57: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:572:
+	 * Stop all future queues being from executing while group is stoppped.
 	                                                              ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 211 lines checked
c780147df940 drm/xe/multi_queue: Enable multi_queue on xe3p_xpc


