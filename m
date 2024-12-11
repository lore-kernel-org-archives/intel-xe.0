Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C58E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 23:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7310EC5F;
	Wed, 11 Dec 2024 23:12:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25CF10EC5F;
 Wed, 11 Dec 2024 23:12:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_fault_on_fd?=
 =?utf-8?q?_close_when_wedged?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 23:12:31 -0000
Message-ID: <173395875198.1364470.3622992639614151148@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211225332.1136152-1-lucas.demarchi@intel.com>
In-Reply-To: <20241211225332.1136152-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Fix fault on fd close when wedged
URL   : https://patchwork.freedesktop.org/series/142444/
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
commit 4d3c796d4d811249d31a1b91658637ee83b02f00
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Dec 11 14:53:32 2024 -0800

    drm/xe: Fix fault on fd close when wedged
    
    If device is wedged, the final run ticks update for the client should be
    skipped as it's already unmapped. Fix this pagefault when forcing a
    wedged state with igt:
    
    <6> [IGT] xe_wedged: exiting, ret=98
    <1> BUG: unable to handle page fault for address: ffffc901bc5e508c
    <1> #PF: supervisor read access in kernel mode
    <1> #PF: error_code(0x0000) - not-present page
    ...
    <4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
    <4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
    <4>   xe_exec_queue_fini+0x16/0xb0 [xe]
    <4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
    <4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
    <4>   guc_exec_queue_fini+0x23/0x40 [xe]
    <4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
    <4>   xe_file_close+0xd4/0x1a0 [xe]
    <4>   drm_file_free+0x210/0x280 [drm]
    <4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
    <4>   drm_release_noglobal+0x20/0x90 [drm]
    
    Fixes: 83db047d9425 ("drm/xe: Stop accumulating LRC timestamp on job_free")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3421
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9b5dff950301bf05d2e76745cacb457a0a82b50f drm-intel
4d3c796d4d81 drm/xe: Fix fault on fd close when wedged


