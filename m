Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698B7C61DB8
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 16:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3192F10E4A7;
	Wed, 28 Aug 2024 16:02:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366D10E4A7;
 Wed, 28 Aug 2024 16:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Insert_wmb/s?=
 =?utf-8?q?fence_before_enabling_OA_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 16:02:05 -0000
Message-ID: <172486092579.828151.15287520335245247225@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828155552.1917844-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240828155552.1917844-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Insert wmb/sfence before enabling OA (rev3)
URL   : https://patchwork.freedesktop.org/series/137816/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 439964f02d55c4d72d261e067b6e585989fca2db
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Wed Aug 28 08:55:52 2024 -0700

    drm/xe/oa: Insert wmb/sfence before enabling OA
    
    In some simulation environments, we occasionally see warnings such as "OAG
    Buffer register is not programmed (has value 0). Register offset db08".
    This means OA has been enabled before it has been fully configured. Or, the
    register write enabling OA has overtaken previous OA configuration register
    writes.
    
    Therefore, insert a wmb/sfence to preserve OA register write ordering
    before enabling OA.
    
    v2: s/wmb()/xe_device_wmb()/
    
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Reported-by: Guy Zadicario <guy.zadicario@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch da0e5d5784bc90f24d02e5944051f2e8a3f53b56 drm-intel
439964f02d55 drm/xe/oa: Insert wmb/sfence before enabling OA
-:18: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#18: 
Reported-by: Guy Zadicario <guy.zadicario@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


