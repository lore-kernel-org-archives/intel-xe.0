Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FBCCFA10
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 01:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F5310E87B;
	Thu, 26 Sep 2024 01:48:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA2610E0C4;
 Thu, 26 Sep 2024 01:48:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fsubmit=3A_ad?=
 =?utf-8?q?d_missing_locking_in_wedged=5Ffini?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 01:48:00 -0000
Message-ID: <172731528004.1103645.11093476749660436209@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924150947.118433-2-matthew.auld@intel.com>
In-Reply-To: <20240924150947.118433-2-matthew.auld@intel.com>
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

Series: drm/xe/guc_submit: add missing locking in wedged_fini
URL   : https://patchwork.freedesktop.org/series/139055/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a3349abc863d50aad3f21c4df576cc2c365a6a4
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Sep 24 16:09:48 2024 +0100

    drm/xe/guc_submit: add missing locking in wedged_fini
    
    Any non-wedged queue can have a zero refcount here and can be running
    concurrently with an async queue destroy, therefore dereferencing the
    queue ptr to check wedge status after the lookup can trigger UAF if
    queue is not wedged.  Fix this by keeping the submission_state lock held
    around the check to postpone the free and make the check safe, before
    dropping again around the put() to avoid the deadlock.
    
    Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
1a3349abc863 drm/xe/guc_submit: add missing locking in wedged_fini


