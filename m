Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454B6C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 00:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379110E249;
	Tue, 27 Aug 2024 00:17:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8F10E249;
 Tue, 27 Aug 2024 00:17:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/oa=3A_Insert_wmb/s?=
 =?utf-8?q?fence_before_enabling_OA_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 00:17:28 -0000
Message-ID: <172471784873.785999.520816561087833597@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826233408.1849936-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240826233408.1849936-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Insert wmb/sfence before enabling OA (rev2)
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
commit a30e00d30a960064e8c057147a56dfb9edb5d256
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Aug 26 16:34:08 2024 -0700

    drm/xe/oa: Insert wmb/sfence before enabling OA
    
    In some simulation environments, we occasionally see warnings such as "OAG
    Buffer register is not programmed (has value 0). Register offset db08".
    This means OA has been enabled before it has been fully configured. Or, the
    register write enabling OA has overtaken previous OA configuration register
    writes.
    
    Therefore, insert a wmb/sfence to preserve OA register write ordering
    before enabling OA.
    
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Reported-by: Guy Zadicario <guy.zadicario@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 94d6fa93a57b0c160fec84046f65a218d7e18bc0 drm-intel
a30e00d30a96 drm/xe/oa: Insert wmb/sfence before enabling OA
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#16: 
Reported-by: Guy Zadicario <guy.zadicario@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


