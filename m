Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8060FCA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2010E1BF;
	Mon,  5 Oct 2026 14:51:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECBF10E1BF;
 Mon,  5 Oct 2026 14:51:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Async_RPM_with_shrinker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 14:51:40 -0000
Message-ID: <179121190012.240597.10907507131950351643@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005144059.1569162-5-matthew.auld@intel.com>
In-Reply-To: <20261005144059.1569162-5-matthew.auld@intel.com>
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

Series: Async RPM with shrinker
URL   : https://patchwork.freedesktop.org/series/175561/
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
commit f26082ffe081705f4120b0e6916ca1f796362e40
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Oct 5 15:41:03 2026 +0100

    drm/xe/shrinker: hold a stable RPM ref across scan
    
    Now that we use async RPM get, with the custom worker gone, we can
    eliminate the get/put dance and just always hold a stable ref over the
    entire scan, and just have the inner layer ping the async status with
    if_active(), if required. If it's still not awake we skip just like
    before, but when it does wake up we now don't need to worry about races
    where the device potentially goes back to sleep, since at no point do we
    drop the outer ref.
    
    Assisted-by: LLM
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c1341b7b7cec27ca50f287ec497e41a8cc88f22b drm-intel
0acf38cdff6e drm/xe: Fix runtime PM get helpers for CONFIG_PM=n
-:20: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#20: 
Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Fixes: 3b85b7bcccf4 ("drm/xe: Fix display runtime_pm handling")

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
2e0de5099ff6 drm/xe/shrinker: use async RPM get
f26082ffe081 drm/xe/shrinker: hold a stable RPM ref across scan


