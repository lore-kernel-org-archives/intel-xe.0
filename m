Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA745C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 23:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50FD10E193;
	Fri, 25 Sep 2026 23:17:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6376810E193;
 Fri, 25 Sep 2026 23:17:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_focused_VM_?=
 =?utf-8?q?teardown_and_page_fault_tracing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 23:17:42 -0000
Message-ID: <179037826240.208168.14252284968026664867@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925231103.372319-1-daniel.charles@intel.com>
In-Reply-To: <20260925231103.372319-1-daniel.charles@intel.com>
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

Series: drm/xe: Add focused VM teardown and page fault tracing
URL   : https://patchwork.freedesktop.org/series/175023/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 19ca6a6ba1510aef8fa3a52e1c76ddf130d9ae58
Author: Daniel Charles <daniel.charles@intel.com>
Date:   Fri Sep 25 16:11:03 2026 -0700

    drm/xe: Add focused VM teardown and page fault tracing
    
    Trace the start of VM teardown and ASID removal so late page faults can be
    correlated with the VM lifecycle. Emit a single failure event for all page
    fault errors and include the existing page fault reason alongside the errno.
    
    Keep the trace set focused by avoiding separate events for userptr pin
    attempts, individual close phases, ASID lookup rejection, and faults during
    shutdown.
    
    Assisted-by: GitHub Copilot using Claude Sonnet 5
    Signed-off-by: Daniel Charles <daniel.charles@intel.com>
+ /mt/dim checkpatch 54f4f12a67b91ec733ce92716450060001532681 drm-intel
19ca6a6ba151 drm/xe: Add focused VM teardown and page fault tracing
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
fault errors and include the existing page fault reason alongside the errno.

-:102: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#102: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:273:
+	    TP_STRUCT__entry(

-:112: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#112: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:283:
+	    TP_fast_assign(

total: 0 errors, 1 warnings, 2 checks, 116 lines checked


