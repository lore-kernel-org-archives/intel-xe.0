Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251ADCD1284
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 02:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95A610F342;
	Fri, 29 Mar 2024 02:00:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321AF10F342;
 Fri, 29 Mar 2024 02:00:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Rework_work_queue_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 02:00:02 -0000
Message-ID: <171167760220.1064930.12689751861483461258@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328182147.4169656-1-matthew.brost@intel.com>
In-Reply-To: <20240328182147.4169656-1-matthew.brost@intel.com>
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

Series: Rework work queue usage
URL   : https://patchwork.freedesktop.org/series/131785/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 14dd1d668e4bef079ece3803810e50d993ea23d0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Mar 28 11:21:47 2024 -0700

    drm/xe: Use ordered WQ for TLB invalidation fences
    
    TLB invalidation fences need to be ordered within an exec queue and if
    an unordered WQ is used TLB invalidation fences could be reordered. Use
    an ordered WQ to fix this.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 98f893b726e1ba5db2680da3f9f53ab2af9780be drm-intel
ba9731a701af drm/xe: Use ordered wq for preempt fence waiting
3f7cb53eec03 drm/xe: Use device, gt ordered work queues for resource cleanup
14dd1d668e4b drm/xe: Use ordered WQ for TLB invalidation fences


