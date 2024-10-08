Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF846CF0421
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 20:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF310E5BA;
	Tue,  8 Oct 2024 20:51:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A9C10E5BC;
 Tue,  8 Oct 2024 20:51:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_Xe3_and_Panther_Lake_?=
 =?utf-8?q?support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 20:51:31 -0000
Message-ID: <172842069141.1205478.6562964999335139715@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008204626.55802-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241008204626.55802-1-matthew.s.atwood@intel.com>
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

Series: Add Xe3 and Panther Lake support (rev4)
URL   : https://patchwork.freedesktop.org/series/138349/
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
commit f6a7dc7266cd0ccd31408e0e126f28a0f0bef33b
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Oct 8 13:46:26 2024 -0700

    drm/xe/xe3: Add initial set of workarounds
    
    Implement the initial set of workarounds for Xe3 IPs.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 8752b50cc6ea4e90f3caa68dd1cc169112ac4b34 drm-intel
f6a7dc7266cd drm/xe/xe3: Add initial set of workarounds
-:83: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_wa.c:602:
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),

total: 0 errors, 1 warnings, 0 checks, 88 lines checked


