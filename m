Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0F9CCF9ED
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 19:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278AD10E852;
	Wed, 25 Sep 2024 19:28:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2C210E84E;
 Wed, 25 Sep 2024 19:28:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/query=3A_Refactor_?=
 =?utf-8?q?copy=5Fto=5Fuser=28=29_usage_in_four_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Markus Elfring" <Markus.Elfring@web.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 19:28:55 -0000
Message-ID: <172729253564.1102636.668291779360531574@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
In-Reply-To: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
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

Series: drm/xe/query: Refactor copy_to_user() usage in four functions
URL   : https://patchwork.freedesktop.org/series/138994/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26ef5c27ca83e3ed4ffdd2e1980455a3b158bfab
Author: Markus Elfring <elfring@users.sourceforge.net>
Date:   Wed Sep 18 09:43:07 2024 +0200

    drm/xe/query: Refactor copy_to_user() usage in four functions
    
    Assign return values from copy_to_user() calls to additional local variables
    so that four kfree() calls and return statements can be omitted accordingly.
    
    This issue was transformed by using the Coccinelle software.
    
    Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
26ef5c27ca83 drm/xe/query: Refactor copy_to_user() usage in four functions
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Assign return values from copy_to_user() calls to additional local variables

total: 0 errors, 1 warnings, 0 checks, 64 lines checked


