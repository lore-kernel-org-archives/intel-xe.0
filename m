Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD61D64086
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 03:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2BF10E03F;
	Sat,  9 Nov 2024 03:25:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133D510E03F;
 Sat,  9 Nov 2024 03:25:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Fix_=22Missi?=
 =?utf-8?q?ng_outer_runtime_PM_protection=22_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Nov 2024 03:25:49 -0000
Message-ID: <173112274907.1545706.10582081937881113374@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241109032003.3093811-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241109032003.3093811-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Fix "Missing outer runtime PM protection" warning
URL   : https://patchwork.freedesktop.org/series/141123/
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
commit 62df8387b962570977bd6489f7284107abe3eb39
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Nov 8 19:20:03 2024 -0800

    drm/xe/oa: Fix "Missing outer runtime PM protection" warning
    
    Fix the following drm_WARN:
    
    [953.586396] xe 0000:00:02.0: [drm] Missing outer runtime PM protection
    ...
    <4> [953.587090]  ? xe_pm_runtime_get_noresume+0x8d/0xa0 [xe]
    <4> [953.587208]  guc_exec_queue_add_msg+0x28/0x130 [xe]
    <4> [953.587319]  guc_exec_queue_fini+0x3a/0x40 [xe]
    <4> [953.587425]  xe_exec_queue_destroy+0xb3/0xf0 [xe]
    <4> [953.587515]  xe_oa_release+0x9c/0xc0 [xe]
    
    Suggested-by: John Harrison <john.c.harrison@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Cc: stable@vger.kernel.org
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 00976833a8b163cfcad247ba2d22ea4819fd749c drm-intel
62df8387b962 drm/xe/oa: Fix "Missing outer runtime PM protection" warning


