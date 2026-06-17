Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13577CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 14:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27A610EA2D;
	Wed, 17 Jun 2026 14:16:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1299910EA2D;
 Wed, 17 Jun 2026 14:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Return_error_on?=
 =?utf-8?q?_non-migratable_faults_requiring_devmem?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 14:16:01 -0000
Message-ID: <178170576107.90144.316059152132490666@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617135101.1245574-1-matthew.brost@intel.com>
In-Reply-To: <20260617135101.1245574-1-matthew.brost@intel.com>
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

Series: drm/xe: Return error on non-migratable faults requiring devmem
URL   : https://patchwork.freedesktop.org/series/168716/
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
commit 7d9f6561f809e910bb115790d8adc8dba5baea84
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jun 17 06:51:01 2026 -0700

    drm/xe: Return error on non-migratable faults requiring devmem
    
    Non-migratable faults that require devmem incorrectly jump to the 'out'
    label, which squashes the error code intended to be returned to the
    upper layers. Fix this by returning -EACCES instead.
    
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Fixes: ("4208fac3dce5 drm/xe: Add more SVM GT stats")
    Cc: stable@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 drm-intel
7d9f6561f809 drm/xe: Return error on non-migratable faults requiring devmem
-:11: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#11: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: ("4208fac3dce5 drm/xe: Add more SVM GT stats")

-:32: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 12 lines checked


