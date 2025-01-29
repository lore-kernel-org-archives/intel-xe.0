Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99751C0218A
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 02:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEE710E0D2;
	Wed, 29 Jan 2025 02:20:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E810E2C6;
 Wed, 29 Jan 2025 02:19:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe3=3A_Extend_wa?=
 =?utf-8?q?=5F15015404425_for_xe3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 02:19:59 -0000
Message-ID: <173811719920.2200892.18439470083885203494@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250129005551.106214-1-matthew.s.atwood@intel.com>
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

Series: drm/xe/xe3: Extend wa_15015404425 for xe3
URL   : https://patchwork.freedesktop.org/series/144078/
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
commit 0d1bf351bd3d015a66ec981890b2a7aeb4afa116
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Jan 28 16:55:51 2025 -0800

    drm/xe/xe3: Extend wa_15015404425 for xe3
    
    wa_15015404425 applies to xe3 A0 step as well.
    
    v2: query based off SOC stepping
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 486bb0f2805b5fcc43e7cc609b9dd59ef1ffcd79 drm-intel
0d1bf351bd3d drm/xe/xe3: Extend wa_15015404425 for xe3


