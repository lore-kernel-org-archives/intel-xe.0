Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6960CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 19:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280910E302;
	Mon,  2 Sep 2024 19:13:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F22F10E302;
 Mon,  2 Sep 2024 19:13:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_redundan?=
 =?utf-8?q?t_=5Bdrm=5D_tag_from_xe=5Fassert=28=29_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 19:13:21 -0000
Message-ID: <172530440137.908159.12591452274221045270@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902190726.1748-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240902190726.1748-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Remove redundant [drm] tag from xe_assert() message
URL   : https://patchwork.freedesktop.org/series/138111/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f34453e4d369da925df251b8ef8dbc82efe5e80
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Sep 2 21:07:26 2024 +0200

    drm/xe: Remove redundant [drm] tag from xe_assert() message
    
    Since commit 178c0a33c421 ("drm/print: Add generic drm dev printk
    function") the output from drm_WARN() includes previously missing
    the [drm] tag, so now xe_assert() is printing it twice:
    
      [ ] xe 0000:00:02.0: [drm] [drm] Assertion `false` failed!
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30 drm-intel
0f34453e4d36 drm/xe: Remove redundant [drm] tag from xe_assert() message


