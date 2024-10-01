Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA87CE7CF7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D6C10E5F9;
	Tue,  1 Oct 2024 08:51:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79DB10E5F9;
 Tue,  1 Oct 2024 08:51:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/4=5D_drm/xe/ct=3A_prevent_UAF_in_send=5Frecv=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 08:51:35 -0000
Message-ID: <172777269568.1141085.8354133924030812636@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001084346.98516-5-matthew.auld@intel.com>
In-Reply-To: <20241001084346.98516-5-matthew.auld@intel.com>
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

Series: series starting with [v2,1/4] drm/xe/ct: prevent UAF in send_recv()
URL   : https://patchwork.freedesktop.org/series/139375/
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
commit 520f5a6d96bdbf5551811024bb0b8d16ed1e89c8
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Oct 1 09:43:50 2024 +0100

    drm/xe/ct: drop irq usage of xa_erase()
    
    Unclear why disabling interrupts is needed here. Nothing seems to be
    touching fence_lookup and its corresponding lock from an irq so there
    should be no risk of deadlock.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 126b085652ff525948f88b62128ec9d95e00e281 drm-intel
36a689d62d24 drm/xe/ct: prevent UAF in send_recv()
c95fe95435b1 drm/xe/ct: fix xa_store() error checking
59f94950b6f1 drm/xe/guc_submit: fix xa_store() error checking
520f5a6d96bd drm/xe/ct: drop irq usage of xa_erase()


