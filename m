Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957CCFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357E910E066;
	Tue,  5 May 2026 23:51:53 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B55510E066;
 Tue,  5 May 2026 23:51:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_run_ticks_for_mul?=
 =?utf-8?q?ti-queue_use_case_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 May 2026 23:51:52 -0000
Message-ID: <177802511217.41733.979720020135812779@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

Series: Support run ticks for multi-queue use case (rev3)
URL   : https://patchwork.freedesktop.org/series/164654/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49b32612190e93bdd2c71e637e613616e3405922
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue May 5 16:44:20 2026 -0700

    drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
    
    In a multi-queue use case, when a job is running on the secondary queue,
    the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
    the QUEUE TIMESTAMP to check how long the job ran. For user space to see
    the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
    register.
    
    Compute PR: https://github.com/intel/compute-runtime/pull/923
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch f95f99492a2826e042e114c91504a3216c42adbd drm-intel
bff14686f275 drm/xe/lrc: Use 64 bit ctx timestamp in the LRC snapshot
988de792d635 drm/xe: Add timestamp_ms to LRC snapshot
4303ee05999c drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic
c4cb94f36075 drm/xe/multi_queue: Refactor check for multi queue support for engine class
59747380d02a drm/xe/multi_queue: Store primary LRC and position info in LRC
690f2e503e4f drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
e1dc3424d7ef drm/xe/lrc: Refactor out engine id to hwe conversion
30ccdc788606 drm/xe/multi_queue: Capture queue run times for active queues
1a65d24a2374 drm/xe/multi_queue: Add trace event for the multi queue timestamp
-:43: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#43: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:49:
+	    TP_STRUCT__entry(

-:53: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#53: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:59:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 49 lines checked
4fe3dbad2802 drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for multi-queue
49b32612190e drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register


