Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BF1CCD185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 01:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EA110E179;
	Tue, 14 Oct 2025 01:04:05 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B2410E179;
 Tue, 14 Oct 2025 01:04:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_a_couple_of_wedge_cor?=
 =?utf-8?q?ner-case_memory_leaks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 01:04:03 -0000
Message-ID: <176040384400.8914.4397635277246739114@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013223135.189357-1-stuart.summers@intel.com>
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
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

Series: Fix a couple of wedge corner-case memory leaks (rev3)
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
commit 69f5300c9f271ba5369dae362ed165bb72423162
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Mon Oct 13 22:31:35 2025 +0000

    drm/xe: Check for GuC responses on disabling scheduling
    
    Currently if the GuC becomes unresponsive during a schedule
    disable event, after we send the CT request, the driver
    doesn't have a good way to recover. In most other cases,
    we explicitly wait for GuC to respond by checking either
    pending_enable, pending_disable, or some other state change
    that we expect to be set after the response from GuC is
    received for that particular request. Add a similar check
    on the schedule disable side and make sure the queue state
    for the queue being disabled is reset properly in that case.
    
    v2: Only call the deregistration sequence since in this
        case the scheduling handler should be reset during
        the GT reset.
        By doing that, we don't need a way to track the scheduling
        disable request handler for that queue, making this sequence
        simpler. As a result, don't mark the queue as banned.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch c917f7d11493984be9f381ca0a7667bd3e587ada drm-intel
ee6969f4a46f drm/xe: Add additional trace points for LRCs
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
bd2cf772c9c8 drm/xe: Add a trace point for VM close
227f27fcd6b8 drm/xe: Add the BO pointer info to the BO trace
c273a5d1d3e9 drm/xe: Add new exec queue trace points
e577b27aead0 drm/xe: Correct migration VM teardown order
d1adf34919a6 drm/xe: Kick start GPU scheduler on teardown
69f5300c9f27 drm/xe: Check for GuC responses on disabling scheduling


