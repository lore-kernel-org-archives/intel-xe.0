Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE28D37491
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 13:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162D10E84A;
	Thu, 17 Oct 2024 13:57:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4680510E84C;
 Thu, 17 Oct 2024 13:57:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/lspcon=3A_do_not?=
 =?utf-8?q?_hardcode_settle_timeout_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 13:57:36 -0000
Message-ID: <172917345628.1279145.4051754001774846221@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241017075725.207384-1-giedriuswork@gmail.com>
In-Reply-To: <20241017075725.207384-1-giedriuswork@gmail.com>
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

Series: drm/i915/lspcon: do not hardcode settle timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/139997/
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
commit b464eec2b4951d40e41fa2b64b6a04f3115ca867
Author: Giedrius Statkevičius <giedriuswork@gmail.com>
Date:   Thu Oct 17 10:57:24 2024 +0300

    drm/i915/lspcon: do not hardcode settle timeout
    
    Avoid hardcoding the LSPCON settle timeout because it takes a longer
    time on certain chips made by certain vendors. Use the function that
    already exists to determine the timeout.
    
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
+ /mt/dim checkpatch 3f39185434041f7c44e28efeb1521ad3dc43da96 drm-intel
b464eec2b495 drm/i915/lspcon: do not hardcode settle timeout


