Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA47C47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 17:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7807010EC6B;
	Mon, 22 Jan 2024 17:32:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9960F10EC5F;
 Mon, 22 Jan 2024 17:32:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/9=5D_drm/xe=3A_Remove_double_new_line_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 22 Jan 2024 17:32:31 -0000
Message-ID: <170594475162.664419.17576267289517451857@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122170445.108856-1-jose.souza@intel.com>
In-Reply-To: <20240122170445.108856-1-jose.souza@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/9] drm/xe: Remove double new line in devcoredump
URL   : https://patchwork.freedesktop.org/series/129042/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18c158203af87c6194df2e6599f2f02ce1aa4ed8
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Jan 22 09:04:45 2024 -0800

    drm/xe: Remove addional spaces in devcoredump HW Engines section
    
    I guess the indention was to keep it visually aligned but that
    would require a lot of spaces and was not followed by other registers
    so lets just drop it.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 6c50b86b2afe0f6c5929aa3f48b36b31cd736ab9 drm-intel
789e5cab3 drm/xe: Remove double new line in devcoredump
225f8ee79 drm/xe: Change devcoredump functions parameters to xe_sched_job
dc3718a26 drm/xe: Add functions to convert regular address to canonical address and back
9fd1cffe5 drm/xe: Add batch buffer addresses to devcoredump
a3ea6eba7 drm/xe: Nuke xe from xe_devcoredump
088c2cdba drm/xe: Stash GMD_ID value in xe_gt
2c1077d39 drm/xe: Print more device information in devcoredump
d6f8f52ce drm/xe: Print registers spread in 2 u32 as u64
18c158203 drm/xe: Remove addional spaces in devcoredump HW Engines section
-:4: WARNING:TYPO_SPELLING: 'addional' may be misspelled - perhaps 'additional'?
#4: 
Subject: [PATCH] drm/xe: Remove addional spaces in devcoredump HW Engines
                                ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


