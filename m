Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4101CCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20F710E20D;
	Mon, 11 May 2026 21:09:23 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553E10E20D;
 Mon, 11 May 2026 21:09:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hw=5Fengine=3A_Fix?=
 =?utf-8?q?_double-free_of_managed_BO_in_error_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 21:09:22 -0000
Message-ID: <177853376280.58917.16964078544063824598@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511154622.223795-1-shuicheng.lin@intel.com>
In-Reply-To: <20260511154622.223795-1-shuicheng.lin@intel.com>
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

Series: drm/xe/hw_engine: Fix double-free of managed BO in error path
URL   : https://patchwork.freedesktop.org/series/166336/
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
commit 2fab880f0fc5304fb16f28ce4e78e4569aa9408c
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Mon May 11 15:46:22 2026 +0000

    drm/xe/hw_engine: Fix double-free of managed BO in error path
    
    The error path in hw_engine_init() explicitly frees a BO allocated
    with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
    Since the managed BO already has a devm cleanup action registered,
    this causes a double-free when devm unwinds during probe failure.
    
    Remove the explicit free and let devm handle it, consistent with
    all other xe_managed_bo_create_pin_map() callers.
    
    Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 311a7de0a4e360124ba1abb933df42b021ef8b9d drm-intel
2fab880f0fc5 drm/xe/hw_engine: Fix double-free of managed BO in error path
-:14: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '23e939bc8f56', maybe rebased or not pulled?
#14: 
Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


