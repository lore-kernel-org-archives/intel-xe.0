Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E5EC369B5
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 20:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D501410E286;
	Mon, 14 Apr 2025 20:29:51 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB610E286;
 Mon, 14 Apr 2025 20:29:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/guc=3A_Fix_out-of-bound_while_enabling_engine_activi?=
 =?utf-8?q?ty_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 20:29:50 -0000
Message-ID: <174466259059.3369.16398540746734455350@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250414202347.1909-1-michal.wajdeczko@intel.com>
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

Series: series starting with [1/2] drm/xe/guc: Fix out-of-bound while enabling engine activity stats
URL   : https://patchwork.freedesktop.org/series/147717/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 53052ae1c52a83d30759c6675596d7f4298cecf9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Apr 14 22:23:47 2025 +0200

    drm/xe: Use GT oriented message to report engine activity error
    
    We are enabling/disabling engine activity on per-GT basis, so any
    errors should be also reported per GT, like:
    
     [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to enable engine activity function stats (-ENOSPC)
     [ ] xe 0000:00:02.0: [drm] GT1: PF: Failed to enable engine activity function stats (-ENOSPC)
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch ee6ca91bfc76e36e7520d3603772b55fcc3837b8 drm-intel
ea01279937d6 drm/xe/guc: Fix out-of-bound while enabling engine activity stats
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
 [ ] BUG: KASAN: slab-out-of-bounds in xe_guc_engine_activity_function_stats+0x41e/0x4f0 [xe]

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
53052ae1c52a drm/xe: Use GT oriented message to report engine activity error
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
 [ ] xe 0000:00:02.0: [drm] GT0: PF: Failed to enable engine activity function stats (-ENOSPC)

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


