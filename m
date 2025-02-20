Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651DEC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C1E10E9DE;
	Thu, 20 Feb 2025 20:44:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617E10E9DE;
 Thu, 20 Feb 2025 20:43:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fdrm=5Fclient?=
 =?utf-8?q?=3A_Add_per_drm_client_reset_stats_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 20:43:59 -0000
Message-ID: <174008423987.278735.9265158157912336792@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250220203832.130430-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_drm_client: Add per drm client reset stats (rev5)
URL   : https://patchwork.freedesktop.org/series/144903/
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
commit 99b72b4d159df7785acb52b82491715ee0cd5245
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Thu Feb 20 20:38:32 2025 +0000

    drm/xe/xe_query: Add support for per-drm-client reset stat querying
    
    Add support for userspace to query per drm client reset stats via the
    query ioctl.  This includes the number of engine resets the drm client
    has observed, as well as a list of up to the last 50 relevant exec
    queue bans and their associated causal pagefaults (if they exists).
    
    v2: Report EOPNOTSUPP if CONFIG_PROC_FS is not set in the kernel
        config, as it is required to trace the reset count and exec
        queue bans.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 2c2b141845ce906e187d4aa4fee06bcd9d517415 drm-intel
40ddd2ad6d62 drm/xe/xe_exec_queue: Add ID param to exec queue struct
e0593784093c drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
3a2f2b6dee8d drm/xe/xe_drm_client: Add per drm client pagefault info
3ab5a75b30ae drm/xe/xe_drm_client: Add per drm client reset stats
22d256839387 drm/xe/xe_query: Pass drm file to query funcs
99b72b4d159d drm/xe/xe_query: Add support for per-drm-client reset stat querying


