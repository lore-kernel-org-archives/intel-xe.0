Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A2FC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 10:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9569F10E776;
	Thu, 31 Jul 2025 10:50:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592C310E775;
 Thu, 31 Jul 2025 10:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_more_xe=5Fmigrate=5F?=
 =?utf-8?q?access=5Fmemory_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 10:50:27 -0000
Message-ID: <175395902735.201961.12772194002538523150@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731093807.207572-5-matthew.auld@intel.com>
In-Reply-To: <20250731093807.207572-5-matthew.auld@intel.com>
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

Series: Some more xe_migrate_access_memory fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/152297/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 93e348d767e58a20b3bfc784f534e4eb8482d109
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jul 31 10:38:11 2025 +0100

    drm/xe/migrate: prevent potential UAF
    
    If we hit the error path, the previous fence (if there is one) has
    already been put() prior to this, so doing a fence_wait could lead to
    UAF. Tweak the flow to do to the put() until after we do the wait.
    
    Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 7f74ca5c75dd28bc57d5ea1be165919bc70609d8 drm-intel
50aeca156e40 drm/xe/migrate: prevent infinite recursion
b028279263c7 drm/xe/migrate: don't overflow max copy size
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
xe 0000:03:00.0: [drm] Assertion `size / pitch <= ((s16)(((u16)~0U) >> 1))` failed!

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
93e348d767e5 drm/xe/migrate: prevent potential UAF


