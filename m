Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92389C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADFD10EAF7;
	Wed, 17 Jul 2024 13:21:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D5A10EAF7;
 Wed, 17 Jul 2024 13:21:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pm=3A_Add_trace_fo?=
 =?utf-8?q?r_pm_functions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 13:21:06 -0000
Message-ID: <172122246630.269472.15224640092934797447@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717125950.9952-1-nirmoy.das@intel.com>
In-Reply-To: <20240717125950.9952-1-nirmoy.das@intel.com>
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

Series: drm/xe/pm: Add trace for pm functions (rev2)
URL   : https://patchwork.freedesktop.org/series/136186/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 53bdad719bb3246ef630e3db3ced52047c4a4fbc
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Jul 17 14:59:50 2024 +0200

    drm/xe/pm: Add trace for pm functions
    
    Add trace for xe pm function for better debuggability.
    
    v2: Fix indentation and add trace for xe_pm_runtime_get_ioctl
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch cf52b34c47ed2a05c46193f0b9807ffd8838dbd8 drm-intel
53bdad719bb3 drm/xe/pm: Add trace for pm functions
-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/xe/xe_trace.h:376:
+		    TP_STRUCT__entry(

-:99: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#99: FILE: drivers/gpu/drm/xe/xe_trace.h:381:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 114 lines checked


