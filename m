Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B345CEDD97
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 13:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ECF10E2A8;
	Wed,  9 Oct 2024 13:58:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D5210E2A8;
 Wed,  9 Oct 2024 13:58:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Handle_G2H_response_timeo?=
 =?utf-8?q?ut?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 13:58:46 -0000
Message-ID: <172848232692.1210211.8494528081893084357@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
In-Reply-To: <20241009105645.1416588-1-badal.nilawar@intel.com>
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

Series: Handle G2H response timeout
URL   : https://patchwork.freedesktop.org/series/139770/
State : success

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
commit 71dc79434c79db261a147ac454e077e7060b9679
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Oct 9 16:26:45 2024 +0530

    drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout
    
    In case if g2h worker doesn't get opportunity to within specified
    timeout delay then flush the g2h worker explicitly.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 0aaaada7e5cee016cd5c405cc7b2e4669fa9ec5e drm-intel
3d076a600f71 drm/xe/guc/ct: Improve g2h request handling during async gt reset
b4860e949fad drm/xe/guc/ct: Increase wait timeout for g2h response
71dc79434c79 drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout


