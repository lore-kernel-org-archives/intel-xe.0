Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088DE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 09:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157510E571;
	Mon, 16 Dec 2024 09:48:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58A10E571;
 Mon, 16 Dec 2024 09:48:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3=3A_do_not_co?=
 =?utf-8?q?nfigure_auto_min_dbuf_for_cursor_WMs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 09:48:26 -0000
Message-ID: <173434250612.3228891.1570658905412074295@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213120357.300584-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241213120357.300584-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/xe3: do not configure auto min dbuf for cursor WMs (rev2)
URL   : https://patchwork.freedesktop.org/series/142558/
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
commit c3b6b7b277a3e34cb852f20db224a936866f0b89
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Dec 13 14:03:57 2024 +0200

    drm/i915/xe3: do not configure auto min dbuf for cursor WMs
    
    Cursor planes do not have the minimum dbuf confguation. The
    ddb allocation and registration routines handle this correctly.
    But the plane wm handling for cursor need to be differentiated
    for this case. Auto minimum buf enable flag should not be
    enabled for cursor wm registers in xe3.
    
    Fixes: a831920c370c ("drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip")
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 drm-intel
c3b6b7b277a3 drm/i915/xe3: do not configure auto min dbuf for cursor WMs


