Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74575F5A8AA
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 19:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F1B10EB2D;
	Mon, 20 Apr 2026 19:02:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48B10EB2D;
 Mon, 20 Apr 2026 19:02:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_double-free?=
 =?utf-8?q?_of_managed_BOs_in_error_paths?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 19:02:12 -0000
Message-ID: <177671173222.478721.2144123215289393384@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417161901.3416021-1-shuicheng.lin@intel.com>
In-Reply-To: <20260417161901.3416021-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix double-free of managed BOs in error paths
URL   : https://patchwork.freedesktop.org/series/165082/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit db305d3119dce2771e682f1b64f47d2bdbba4ae2
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Fri Apr 17 16:19:01 2026 +0000

    drm/xe/hw_engine: Fix double-free of managed BO in error path
    
    The error path in hw_engine_init() explicitly frees a BO allocated
    with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
    Since the managed BO already has a devm cleanup action registered,
    this causes a double-free when devm unwinds during probe failure.
    
    Remove the explicit free and let devm handle it, consistent with
    all other xe_managed_bo_create_pin_map() callers.
    
    Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch da91cb4e6137507f74e4da41c39d0260b4cd1201 drm-intel
4f644a945f3c drm/xe/gsc: Fix double-free of managed BO in error path
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: Claude:claude-opus-4.6

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#17: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 17 lines checked
db305d3119dc drm/xe/hw_engine: Fix double-free of managed BO in error path
-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '23e939bc8f56', maybe rebased or not pulled?
#17: 
Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")

-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: Claude:claude-opus-4.6

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#19: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 2 warnings, 0 checks, 16 lines checked


