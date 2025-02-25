Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BAC021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 05:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B5010E108;
	Tue, 25 Feb 2025 05:37:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FEA10E13F;
 Tue, 25 Feb 2025 05:37:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_cancel_pending_?=
 =?utf-8?q?job_timer_before_freeing_scheduler_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 05:37:10 -0000
Message-ID: <174046183094.1851726.5563316744281538965@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225045754.600905-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250225045754.600905-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: cancel pending job timer before freeing scheduler (rev2)
URL   : https://patchwork.freedesktop.org/series/145308/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 721ffdb1939ce9bbd9a580bcfa0c4407a7f4732c
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Feb 25 10:27:54 2025 +0530

    drm/xe: cancel pending job timer before freeing scheduler
    
    Async call to __guc_exec_queue_fini_async frees scheduler
    at the same time when some scheduler submission would have
    timed out and restarted. To handle such small window race
    case, all pending jobs timer should be cancelled before
    freeing scheduler.
    
    V3(MattB):
     - Adjust position of cancel pending job
     - Remove gitlab issue# from commit message
    V2(MattB):
     - Cancel pending jobs before scheduler finish
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9f112b86fd27ff7de2ce09718596cfefd71ee41f drm-intel
721ffdb1939c drm/xe: cancel pending job timer before freeing scheduler


