Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52252CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008210F206;
	Thu,  7 May 2026 16:31:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B2B10F206;
 Thu,  7 May 2026 16:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_run_ticks_for_mul?=
 =?utf-8?q?ti-queue_use_case_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 16:31:01 -0000
Message-ID: <177817146188.47093.15595740811834280423@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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

Series: Support run ticks for multi-queue use case (rev5)
URL   : https://patchwork.freedesktop.org/series/164654/
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
commit ca9f6fd6ae6a19deb5a89a4a1ed6a4e26a7a5eca
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu May 7 09:20:28 2026 -0700

    drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
    
    In a multi-queue use case, when a job is running on the secondary queue,
    the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
    the QUEUE TIMESTAMP to check how long the job ran. For user space to see
    the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
    register.
    
    Compute PR: https://github.com/intel/compute-runtime/pull/923
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch ca078d725c0fa0a78c4cfcbc73dcd0845589535a drm-intel
b5e60c1deb7f drm/xe/lrc: Use 64 bit ctx timestamp in the LRC snapshot
a3671f957bd2 drm/xe: Add timestamp_ms to LRC snapshot
d7a38500f4aa drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic
02ab44f81b8a drm/xe/multi_queue: Refactor check for multi queue support for engine class
0dd7afe210fd drm/xe/multi_queue: Store primary LRC and position info in LRC
2141970532a9 drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
6663405f0bd7 drm/xe/lrc: Refactor out engine id to hwe conversion
d692e6c7636a drm/xe/multi_queue: Capture queue run times for active queues
34b33e8e25fe drm/xe/multi_queue: Add trace event for the multi queue timestamp
-:44: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#44: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:49:
+	    TP_STRUCT__entry(

-:53: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#53: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:58:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 47 lines checked
46e0c6509116 drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for multi-queue
ca9f6fd6ae6a drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register


