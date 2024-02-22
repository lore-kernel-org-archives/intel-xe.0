Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202D8C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C3910EA38;
	Thu, 22 Feb 2024 14:53:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C010EA38;
 Thu, 22 Feb 2024 14:53:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_pointers_in?=
 =?utf-8?q?_trace_events?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 14:53:01 -0000
Message-ID: <170861358137.216122.3033383070204409510@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222144125.2862546-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222144125.2862546-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Use pointers in trace events
URL   : https://patchwork.freedesktop.org/series/130261/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 60e882336220562867aa46e2dfa289ac8ebd895c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 22 06:41:24 2024 -0800

    drm/xe: Use pointers in trace events
    
    Commit a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
    inadvertently reverted commit 8d038f49c1f3 ("drm/xe: Fix cast on trace
    variable"), breaking the build on 32bits.
    
    As noted by Ville, there's no point in converting the pointers to u64
    and add casts everywhere. In fact, it's better to just use %p and let
    the address be hashed. Convert all the cases in xe_trace.h to use
    pointers.
    
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ae1e283133b83b0de46f00b0ac0bca913e159216 drm-intel
60e882336220 drm/xe: Use pointers in trace events


