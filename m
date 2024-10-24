Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3196CDDE6A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8A910E253;
	Thu, 24 Oct 2024 09:59:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3E910E253;
 Thu, 24 Oct 2024 09:59:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Increase_def?=
 =?utf-8?q?ault_OA_buffer_size_to_128_M?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 09:59:20 -0000
Message-ID: <172976396003.1325996.14233988722144066230@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023181155.1208100-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241023181155.1208100-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Increase default OA buffer size to 128 M
URL   : https://patchwork.freedesktop.org/series/140390/
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
commit a707d5d69ce28f552b0226f280ac257e221fc6a8
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Oct 23 11:11:55 2024 -0700

    drm/xe/oa: Increase default OA buffer size to 128 M
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 3d45ea06af2c04db741c142380d97001b3cdb5da drm-intel
a707d5d69ce2 drm/xe/oa: Increase default OA buffer size to 128 M
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:48: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#48: FILE: drivers/gpu/drm/xe/xe_oa.c:1094:
+			     XE_OA_BUFFER_SIZE == SZ_128M ? OAG_OA_DEBUG_BUF_SIZE_SELECT: 0);
 			                                                                ^

-:48: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#48: FILE: drivers/gpu/drm/xe/xe_oa.c:1094:
+			     XE_OA_BUFFER_SIZE == SZ_128M ? OAG_OA_DEBUG_BUF_SIZE_SELECT: 0);

total: 1 errors, 2 warnings, 0 checks, 49 lines checked


