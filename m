Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62354CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CDB10EEFD;
	Wed,  6 May 2026 22:41:08 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4F10EEFD;
 Wed,  6 May 2026 22:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_run_ticks_for_mul?=
 =?utf-8?q?ti-queue_use_case_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 May 2026 22:41:06 -0000
Message-ID: <177810726631.45072.7214892834815110406@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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

Series: Support run ticks for multi-queue use case (rev4)
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
commit 159ec128161a3199d1cf60186422e7f96f125da5
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Wed May 6 15:35:12 2026 -0700

    drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
    
    In a multi-queue use case, when a job is running on the secondary queue,
    the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
    the QUEUE TIMESTAMP to check how long the job ran. For user space to see
    the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
    register.
    
    Compute PR: https://github.com/intel/compute-runtime/pull/923
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 9d4d408c460848efac7cd10f041e7c0a12e7c584 drm-intel
e3d1bd30b91d drm/xe/lrc: Use 64 bit ctx timestamp in the LRC snapshot
7153714516e3 drm/xe: Add timestamp_ms to LRC snapshot
55f0f8ad819b drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic
ff4cdf26fabc drm/xe/multi_queue: Refactor check for multi queue support for engine class
611162926bd8 drm/xe/multi_queue: Store primary LRC and position info in LRC
-:41: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#41: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:281:
+			q->lrc[idx]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
837f9f1a3b51 drm/xe/multi_queue: Add helpers to access CS QUEUE TIMESTAMP from lrc
cbbff952d4b1 drm/xe/lrc: Refactor out engine id to hwe conversion
1545a6c50fad drm/xe/multi_queue: Capture queue run times for active queues
65425ea2de26 drm/xe/multi_queue: Add trace event for the multi queue timestamp
-:43: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#43: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:49:
+	    TP_STRUCT__entry(

-:52: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#52: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:58:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 47 lines checked
c2925e67b228 drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job timestamp for multi-queue
159ec128161a drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register


