Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB49CCD187
	for <intel-xe@archiver.kernel.org>; Sun, 12 Oct 2025 12:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538A010E15C;
	Sun, 12 Oct 2025 12:52:03 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6DF10E01F;
 Sun, 12 Oct 2025 12:52:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Avoid_crash_during_dump_w?=
 =?utf-8?q?hen_finding_an_evicted_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 12 Oct 2025 12:52:02 -0000
Message-ID: <176027352203.2972.17246054956467085778@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
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

Series: Avoid crash during dump when finding an evicted BO
URL   : https://patchwork.freedesktop.org/series/155787/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fa4310f9b9f030f08136b1270a2428f6d661d164
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Sun Oct 12 21:45:32 2025 +0900

    drm/ttm: Avoid NULL pointer deref for evicted BOs
    
    It is possible for a BO to exist that is not currently associated with a
    resource, e.g. because it has been evicted.
    
    When devcoredump tries to read the contents of all BOs for dumping, we need
    to expect this as well -- in this case, ENODATA is recorded instead of the
    buffer contents.
    
    Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271
+ /mt/dim checkpatch 8fcdbd2480bd7d0f6ce819561685462e94c4ed48 drm-intel
fa4310f9b9f0 drm/ttm: Avoid NULL pointer deref for evicted BOs
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'Fixes:', use 'Link:' or 'Closes:' instead
#13: 
Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271

-:26: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#26: FILE: drivers/gpu/drm/ttm/ttm_bo_vm.c:439:
+	else switch (bo->resource->mem_type) {

-:29: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 2 errors, 1 warnings, 0 checks, 10 lines checked


