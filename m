Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED374CA0EC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 22:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A631010E1B8;
	Mon, 11 Sep 2023 22:15:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 863ED10E1B8;
 Mon, 11 Sep 2023 22:15:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 83E72AADE0;
 Mon, 11 Sep 2023 22:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 11 Sep 2023 22:15:32 -0000
Message-ID: <169447053253.31366.4560382147164018887@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911211829.2049126-1-matthew.brost@intel.com>
In-Reply-To: <20230911211829.2049126-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_fence_reservation_accouting_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix fence reservation accouting (rev2)
URL   : https://patchwork.freedesktop.org/series/123044/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e2e3ee3bdf6fcb90f2426e0f904d526221fb4355
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Sep 11 14:18:29 2023 -0700

    drm/xe: Fix fence reservation accouting
    
    Both execs and the preempt rebind worker can issue rebinds. Rebinds
    require a fence, per tile, inserted into dma-resv slots of the VM and
    BO (if external). The fence reservation accouting did not take into
    account the number of fences required for rebinds, fix this.
    
    v2: Rebase
    
    Reported-by: Christopher Snowhill <kode54@gmail.com>
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/518
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b4ddac861881e66a4af06531a7a72345c086bac1 drm-intel
e2e3ee3bd drm/xe: Fix fence reservation accouting
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Christopher Snowhill <kode54@gmail.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/518

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


