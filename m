Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13579CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABADA10E06A;
	Thu,  2 Oct 2025 23:11:04 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC0510E06A;
 Thu,  2 Oct 2025 23:11:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_a_couple_of_wedge_cor?=
 =?utf-8?q?ner-case_memory_leaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 23:11:03 -0000
Message-ID: <175944666323.1380.18358694171460474522@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002230444.313505-1-stuart.summers@intel.com>
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
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

Series: Fix a couple of wedge corner-case memory leaks
URL   : https://patchwork.freedesktop.org/series/155352/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit de31da9099313aab3b3cc0baba9ea05a43dfafcc
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Thu Oct 2 23:04:44 2025 +0000

    drm/xe: Check for GuC responses on disabling scheduling
    
    In the event the GuC becomes unresponsive during a scheduling
    disable event, we still want the driver to be able to recover.
    This patch follows the same methodology we already have in place
    for TLB invalidation requests, where we send a request to GuC
    and wait for that invalidation done response. If the response
    doesn't come back in time we then at least print a message
    indicating the invalidation failed for some reason.
    
    In this case, we send the schedule disable and the expectation
    is that GuC will respond with a schedule done response. The KMD
    then catches that response and in turn sends a context deregistration
    response. So in the event GuC becomes unresponsive after we send
    the schedule disable, we actually have two g2h responses that
    have been reserved but never received.
    
    To handle this, make sure the pending disable event in the
    exec queue gets cleared (i.e. we received that response from
    GuC). If it doesn't in a reasonable amount of time, assume
    GuC is dead: ban the exec queue, queue up a GT reset, and
    manually call the schedule done handler. Then in the schedule
    done handler, in turn, check whether the context had been
    banned. If so, manually call the deregistration done handler
    to ensure all resources related to that exec queue get
    cleaned up properly. Without this, if the device becomes
    wedged after an exec queue has been created, the attached
    resources like the LRC will not get feed properly resulting
    in a memory leak.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 drm-intel
4b91a6dcfe12 drm/xe: Add additional trace points for LRCs
-:78: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#78: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:45:
+DECLARE_EVENT_CLASS(xe_lrc,
+	    TP_PROTO(struct xe_lrc *lrc),

-:81: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#81: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:48:
+	    TP_STRUCT__entry(

-:87: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#87: FILE: drivers/gpu/drm/xe/xe_trace_lrc.h:54:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 3 checks, 91 lines checked
d50ab269d91b drm/xe: Add a trace point for VM close
c3be85cb82de drm/xe: Add the BO pointer info to the BO trace
24397ed525d4 drm/xe: Add new exec queue trace points
20f5efc635fe drm/xe: Handle missing migration VM on VM creation
0e538d3bb166 drm/xe: Don't send a CLEANUP message on sched pause
de31da909931 drm/xe: Check for GuC responses on disabling scheduling


