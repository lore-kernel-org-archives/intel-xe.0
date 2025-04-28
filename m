Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6505CC36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 08:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475810E3BB;
	Mon, 28 Apr 2025 08:20:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385ED10E3BB;
 Mon, 28 Apr 2025 08:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/tests/mocs=3A_Hold?=
 =?utf-8?q?_XE=5FFORCEWAKE=5FALL_for_LNCF_regs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 08:20:56 -0000
Message-ID: <174582845623.18682.8537782445514737091@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs (rev2)
URL   : https://patchwork.freedesktop.org/series/147446/
State : success

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
commit cc762dd004c1312441a80cd29ea375f4fe6100a9
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Apr 28 13:53:57 2025 +0530

    drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
    
    LNCF registers report wrong values when XE_FORCEWAKE_GT
    only is held. Holding XE_FORCEWAKE_ALL ensures correct
    operations on LNCF regs.
    
    V2(Himal):
     - Use xe_force_wake_ref_has_domain
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999
    Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 2757075e2c11d1dd7cc7890c4d818ccebb38cf2e drm-intel
cc762dd004c1 drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs


