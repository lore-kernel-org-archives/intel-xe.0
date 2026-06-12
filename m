Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80014CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 06:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B2A10F26E;
	Fri, 12 Jun 2026 06:18:36 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB210F26E;
 Fri, 12 Jun 2026 06:18:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_Handle_unprocessed_messages_in_guc=5Fexec=5F?=
 =?utf-8?q?queue=5Ffini?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 06:18:35 -0000
Message-ID: <178124511521.72090.6340511376047042205@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612060120.3795183-1-matthew.brost@intel.com>
In-Reply-To: <20260612060120.3795183-1-matthew.brost@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: Handle unprocessed messages in guc_exec_queue_fini
URL   : https://patchwork.freedesktop.org/series/168404/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4a2c55108ac3db1fed23953c8d8fffe802a88c1a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 11 23:01:20 2026 -0700

    drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
    
    When an FD is closed with many exec queues, teardown relies on the TDR
    path to clean up scheduling. However, the TDR handling is serialized
    (i.e., only one exec queue is processed at a time), which can make it
    too slow compared to GuC scheduling activity.
    
    In this window, GuC may continue to schedule contexts backed by
    invalid page tables, leading to a cascade of CAT errors and repeated
    engine resets. This significantly increases recovery time and can
    degrade system stability.
    
    To mitigate this, eagerly disable scheduling by sending a self-message
    outside of the TDR path. This prevents further scheduling of invalid
    contexts and avoids the CAT error/reset cascade.
    
    This change improves robustness and reduces recovery latency in
    multiple queue teardown scenarios.
    
    Cc: Wang Xin <x.wang@intel.com>
    Cc: Jia Yao <jia.yao@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9ce63e3d9903982c053b125686abcb7a84357ed4 drm-intel
e5e0da48ec9d drm/xe: Handle unprocessed messages in guc_exec_queue_fini
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 71e7d7e81d6a ("drm/xe/multi_queue: Add support for multi queue dynamic priority change")

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
4a2c55108ac3 drm/xe: Disable scheduling early on FD close to avoid CAT error cascade


