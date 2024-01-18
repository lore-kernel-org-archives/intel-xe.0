Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B1C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 05:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03FF10E14A;
	Thu, 18 Jan 2024 05:52:13 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468EC10E14A;
 Thu, 18 Jan 2024 05:52:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Set_PTE=5FAE_fo?=
 =?utf-8?q?r_xe2_dgfx_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 18 Jan 2024 05:52:13 -0000
Message-ID: <170555713328.537693.4257479747380725091@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117144851.22952-1-nirmoy.das@intel.com>
In-Reply-To: <20240117144851.22952-1-nirmoy.das@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Set PTE_AE for xe2 dgfx platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/128887/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3b5a814e68846c717f64308bc6899af276e1c331
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Jan 17 15:48:51 2024 +0100

    drm/xe: Set PTE_AE for xe2 dgfx platforms
    
    Atomics on XE2 works for both type of memory so
    extend setting PTE_AE for dgfx platforms as well.
    
    Cc: Fei Yang <fei.yang@intel.com>
    Cc: Jose Souza <jose.souza@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 2d422dec58e0dfd61d6c9842de7f83289803dccb drm-intel
3b5a814e6 drm/xe: Set PTE_AE for xe2 dgfx platforms


