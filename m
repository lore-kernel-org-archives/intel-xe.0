Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2121CCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6949010E679;
	Tue, 14 Oct 2025 18:15:22 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844D10E679;
 Tue, 14 Oct 2025 18:15:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_a_couple_of_wedge_cor?=
 =?utf-8?q?ner-case_memory_leaks_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 18:15:21 -0000
Message-ID: <176046572122.12447.7401523077723171920@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014180927.105077-1-stuart.summers@intel.com>
In-Reply-To: <20251014180927.105077-1-stuart.summers@intel.com>
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

Series: Fix a couple of wedge corner-case memory leaks (rev4)
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
commit 7dca74be19df880ce535eaba7e7f812bdda44ed5
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Tue Oct 14 18:09:27 2025 +0000

    drm/xe: Clean up GuC software state after a wedge
    
    Comments also added to the code, but in the event of
    a wedge or a hardware failure while communication with
    GuC is outstanding (e.g. during a schedule disable or
    context deregistration), the driver doesn't automatically
    reset the software state as it would in a typical GT reset
    since we are trying to save the state for debug. However
    once the user unbinds the driver we still need to go through
    and clean everything up for these exec queues so we don't
    leak memory on the DRM side (e.g. LRC or LRC BO).
    
    Add a kick start to the DRM scheduler to handle any outstanding
    messages on hold during the wedge and go through the GuC stop
    flow to simulate that reset on teardown.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb drm-intel
9f4ca149a4b3 drm/xe: Add additional trace points for LRCs
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
6e9df4be708f drm/xe: Add a trace point for VM close
dfaebdbef041 drm/xe: Add the BO pointer info to the BO trace
17f5a52f02ee drm/xe: Add new exec queue trace points
54505468da3c drm/xe: Correct migration VM teardown order
7dca74be19df drm/xe: Clean up GuC software state after a wedge


