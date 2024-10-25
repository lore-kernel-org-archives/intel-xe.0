Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7301FD116E6
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 03:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10810E9EB;
	Fri, 25 Oct 2024 03:33:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47BF10E9EB;
 Fri, 25 Oct 2024 03:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_derefer?=
 =?utf-8?q?ence_before_NULL_check_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 03:33:49 -0000
Message-ID: <172982722967.1330678.15084707694131528268@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023233356.5479-1-everestkc@everestkc.com.np>
In-Reply-To: <20241023233356.5479-1-everestkc@everestkc.com.np>
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

Series: drm/xe/guc: Fix dereference before NULL check (rev5)
URL   : https://patchwork.freedesktop.org/series/139890/
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
commit aec8ed40e82e38f8611eb0ddd687068984c91f40
Author: Everest K.C. <everestkc@everestkc.com.np>
Date:   Wed Oct 23 17:33:55 2024 -0600

    drm/xe/guc: Fix dereference before NULL check
    
    The pointer list->list is dereferenced before the NULL check.
    Fix this by moving the NULL check outside the for loop, so that
    the check is performed before the dereferencing.
    The list->list pointer cannot be NULL so this has no effect on runtime.
    It's just a correctness issue.
    
    This issue was reported by Coverity Scan.
    https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
    
    Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
    Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
    Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
aec8ed40e82e drm/xe/guc: Fix dereference before NULL check
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


