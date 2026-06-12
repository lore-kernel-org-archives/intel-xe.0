Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFA7CD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 03:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536E810E916;
	Fri, 12 Jun 2026 03:34:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AC410E916;
 Fri, 12 Jun 2026 03:33:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_make_CTX=5FTIME?=
 =?utf-8?q?STAMP_TOCTOU-safe_and_handle_sentinels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 03:33:58 -0000
Message-ID: <178123523885.71835.9904261578566669866@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
In-Reply-To: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
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

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels
URL   : https://patchwork.freedesktop.org/series/168394/
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
commit 6e180180fb5907cc2c8f9c783ff5a9bc73886965
Author: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
Date:   Fri Jun 12 03:27:48 2026 +0000

    drm/xe/guc: treat sentinel timestamps as no elapsed time to avoid false TDR
    
    Problem: Using LRC ctx_timestamp values 0 or the CONTEXT_ACTIVE
    sentinel in time-delta calculations can produce a large wrap-around
    result, which can trigger a false TDR.
    
    Fix: Detect the sentinel values and treat them as "no elapsed time"
    (return false). Compute the delta with wrap handling when
    ctx_timestamp < ctx_job_timestamp by adding U32_MAX, ensuring
    correct diff calculation across the 32-bit wrap. Runtime logic is
    otherwise unchanged.
    
    Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
+ /mt/dim checkpatch d931e7b381f9d86766f3a971a9376e4312745af8 drm-intel
bd11c584a2b5 drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
6e180180fb59 drm/xe/guc: treat sentinel timestamps as no elapsed time to avoid false TDR
-:39: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#39: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1409:
+	if (ctx_timestamp < ctx_job_timestamp) {
[...]
+	} else {
[...]

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


