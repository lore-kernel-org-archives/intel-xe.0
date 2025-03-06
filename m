Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E5C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 12:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ABC10E1AA;
	Thu,  6 Mar 2025 12:58:13 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4761710E1AA;
 Thu,  6 Mar 2025 12:58:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Release_gud_ids?=
 =?utf-8?q?_before_cancelling_work?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 12:58:12 -0000
Message-ID: <174126589227.67450.9220699086279930549@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306125459.975071-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250306125459.975071-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: Release gud ids before cancelling work
URL   : https://patchwork.freedesktop.org/series/145907/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 409cf59568b375093a9145f3f7227adff1cdd727
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Mar 6 18:24:59 2025 +0530

    drm/xe: Release gud ids before cancelling work
    
    A GT reset can be occuring in parallel while cancelling
    work in async call  which can requeue these workers.
    To avoid that lets first release guc ids and then cancle
    work so they dont requeued.
    
    Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
    Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing scheduler")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch f2e11e8d7c76352a82d73307e16a8d8d662e05b4 drm-intel
409cf59568b3 drm/xe: Release gud ids before cancelling work
-:6: WARNING:TYPO_SPELLING: 'occuring' may be misspelled - perhaps 'occurring'?
#6: 
A GT reset can be occuring in parallel while cancelling
                  ^^^^^^^^

-:8: WARNING:TYPO_SPELLING: 'cancle' may be misspelled - perhaps 'cancel'?
#8: 
To avoid that lets first release guc ids and then cancle
                                                  ^^^^^^

total: 0 errors, 2 warnings, 0 checks, 12 lines checked


