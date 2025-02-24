Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EA5C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 14:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512A10E3C1;
	Mon, 24 Feb 2025 14:28:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739910E3C1;
 Mon, 24 Feb 2025 14:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_cancel_pending_?=
 =?utf-8?q?job_timer_before_freeing_scheduler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 14:28:54 -0000
Message-ID: <174040733454.1618220.4877984374163452483@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224122237.576893-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250224122237.576893-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: cancel pending job timer before freeing scheduler
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
commit e5129831e106671216aa85a425a35109db624a81
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Feb 24 17:52:37 2025 +0530

    drm/xe: cancel pending job timer before freeing scheduler
    
    Async call to __guc_exec_queue_fini_async frees scheduler
    at the same time when some scheduler submission would have
    timed out and restarted. To handle such small window race
    case, all pending jobs timer should be cancelled before
    freeing scheduler.
    
    It will help to solve below which is not easily reproducible,
    https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
    
    V2(MattB):
     - Cancel pending jobs before scheduler finish
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch be5a404c3344b7d794766f045b8f94aa93c42069 drm-intel
e5129831e106 drm/xe: cancel pending job timer before freeing scheduler


