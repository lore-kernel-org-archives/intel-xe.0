Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AE5CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F59B10E7C1;
	Fri,  1 Sep 2023 13:09:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41E4210E7C1;
 Fri,  1 Sep 2023 13:09:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3E773AADF2;
 Fri,  1 Sep 2023 13:09:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Fri, 01 Sep 2023 13:09:14 -0000
Message-ID: <169357375425.9814.3786468774694619586@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230901125950.76088-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230901125950.76088-1-vinod.govindapillai@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fb?=
 =?utf-8?q?c_on_any_plane_=28rev3=29?=
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

Series: fbc on any plane (rev3)
URL   : https://patchwork.freedesktop.org/series/122957/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1dcfd1d78d7f7a0614ec4b25551fcb7d23a48a81
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Fri Sep 1 15:59:50 2023 +0300

    drm/i915/lnl: possibility to enable FBC on first three planes
    
    In LNL onwards, FBC can be associated to the first three planes.
    FBC will be enabled on planes first come first served basis
    until the userspace can select one of these FBC capable plane
    explicitly. FBC can be supported in planes with per pixel alpha
    
    v2:
     - avoid fbc->state.plane check in intel_fbc_check_plane (Ville)
     - simplify plane binding register writes (Matt)
     - Update the subject to reflect that fbc can be enabled only in
       the first three planes (Matt)
    
    Bspec: 69560
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch e4a0387635ffa6ccbc6207c9195896bcc4e59de2 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


