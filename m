Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30156D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 21:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012A610E170;
	Fri,  8 Nov 2024 21:52:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091B10E170;
 Fri,  8 Nov 2024 21:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_G2G_communication?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 21:52:23 -0000
Message-ID: <173110274371.1429282.13843183565689648759@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Add support for G2G communication
URL   : https://patchwork.freedesktop.org/series/141119/
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
commit bc761f4a45ed75d19c90d1cf0c6a1260c3f834e1
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri Nov 8 12:22:16 2024 -0800

    drm/xe/guc: Add support for G2G communications
    
    Some features require inter-GuC communication channels on multi-tile
    devices. So allocate and enable such.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 5d94c05a3b9625a569b92a4ed208ce04e241f122 drm-intel
b7089b32d043 drm/xe: Allow bo mapping on multiple ggtts
-:109: CHECK:CAMELCASE: Avoid CamelCase: <XE_BO_FLAG_GGTTx>
#109: FILE: drivers/gpu/drm/xe/xe_bo.c:1527:
+			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))

total: 0 errors, 0 warnings, 1 checks, 285 lines checked
bc761f4a45ed drm/xe/guc: Add support for G2G communications


