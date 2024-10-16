Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF09D206A2
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 07:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C456C10E5DA;
	Wed, 16 Oct 2024 07:06:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151C010E5DA;
 Wed, 16 Oct 2024 07:06:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/lspcon=3A_do_not?=
 =?utf-8?q?_hardcode_settle_timeout_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 07:06:04 -0000
Message-ID: <172906236407.1272310.1643707509317195967@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014093914.109162-1-giedriuswork@gmail.com>
In-Reply-To: <20241014093914.109162-1-giedriuswork@gmail.com>
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

Series: drm/i915/lspcon: do not hardcode settle timeout (rev2)
URL   : https://patchwork.freedesktop.org/series/139997/
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
commit 192754195a42b6e15985db16b6ea5e9acf3869f7
Author: Giedrius Statkevičius <giedriuswork@gmail.com>
Date:   Mon Oct 14 12:39:12 2024 +0300

    drm/i915/lspcon: do not hardcode settle timeout
    
    Avoid hardcoding the LSPCON settle timeout because it takes a longer
    time on certain chips made by certain vendors. Use the function that
    already exists to determine the timeout.
    
    Signed-off-by: Giedrius Statkevičius <giedriuswork@gmail.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 0bebd793802b4eae14c71400e833cda8f91b0557 drm-intel
192754195a42 drm/i915/lspcon: do not hardcode settle timeout
-:42: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#42: FILE: drivers/gpu/drm/i915/display/intel_lspcon.c:214:
+	err = drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode, lspcon_get_mode_settle_timeout(lspcon));

total: 0 errors, 1 warnings, 0 checks, 26 lines checked


