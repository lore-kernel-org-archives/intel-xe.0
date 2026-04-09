Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BCBF364B6
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F6610E052;
	Thu,  9 Apr 2026 20:42:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E8110E052;
 Thu,  9 Apr 2026 20:42:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_run_ticks_for_mul?=
 =?utf-8?q?ti-queue_use_case?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 20:42:58 -0000
Message-ID: <177576737808.448419.7666659297381913408@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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

Series: Support run ticks for multi-queue use case
URL   : https://patchwork.freedesktop.org/series/164654/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a6d0859ef29e0d8874c6f00e9264f7f07ad639c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Apr 9 13:37:20 2026 -0700

    drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
    
    In a multi-queue use case, when a job is running on the secondary queue,
    the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
    the QUEUE TIMESTAMP to check how long the job ran. For user space to see
    the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
    register.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 9b74368dca168b577da3ae4d3fda612807a86132 drm-intel
4b0dd9045487 drm/xe/multi_queue: Store primary queue and position info in LRC
964f23ed0ea5 drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
eaafa1502cef drm/xe/multi_queue: Capture queue run times for active queues
-:203: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#203: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:49:
+	    TP_STRUCT__entry(

-:212: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#212: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:58:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 198 lines checked
6425bf0714c5 drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for multi-queue
2a6d0859ef29 drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register


