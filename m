Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752C6E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 02:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4377D10E837;
	Tue, 17 Dec 2024 02:30:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B810E837;
 Tue, 17 Dec 2024 02:30:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_MI=5FREPORT=5FP?=
 =?utf-8?q?ERF=5FCOUNT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 02:30:54 -0000
Message-ID: <173440265431.3564238.5448153275084861283@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
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

Series: Fixes for MI_REPORT_PERF_COUNT (rev2)
URL   : https://patchwork.freedesktop.org/series/141811/
State : warning

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
commit 4fc1690fa74aadb3421baf53dd20471692b9f138
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Mon Dec 16 16:58:18 2024 -0800

    xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
    
    To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
    Setting this bit cause the context image size to change and if not done
    correct, can cause undesired hangs.
    
    Current code uses a separate exec_queue to modify this bit and is
    error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
    the target hardware context to modify the relevant bit.
    
    In v2 version, an attempt to submit everything to the user-queue was
    made, but it failed the unprivileged-single-ctx-counters test. It
    appears that the OACTXCONTROL must be modified from a remote context.
    
    In summary,
    - the OACTXCONTROL is always modified from the k_exec_q
    - the LRI registers are always modified from the user-queue
    - emit_oa_config picks user-queue if available, else it uses k_exec_q.
    
    v2:
    (Matt)
    - set job->ggtt to true if create job is successful
    - unlock vm on job error
    
    (Ashutosh)
    - don't wait on job submission
    - use kernel exec queue where possible
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e7c9466eaad2e3e60e6dbd2725a648b58c717fb0 drm-intel
8689a8176f92 xe: Allow a GGTT mapped batch to be submitted to user exec queue
4fc1690fa74a xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
-:204: ERROR:CODE_INDENT: code indent should use tabs where possible
#204: FILE: drivers/gpu/drm/xe/xe_oa.c:843:
+       ^I};$

-:204: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#204: FILE: drivers/gpu/drm/xe/xe_oa.c:843:
+       ^I};$

-:204: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#204: FILE: drivers/gpu/drm/xe/xe_oa.c:843:
+       ^I};$

total: 1 errors, 2 warnings, 0 checks, 183 lines checked


