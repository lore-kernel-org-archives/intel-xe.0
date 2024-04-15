Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB3C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB4C1126A9;
	Mon, 15 Apr 2024 15:35:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712621126AB;
 Mon, 15 Apr 2024 15:35:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_no_need_to_call?=
 =?utf-8?q?_fixup=5Finitial=5Fplane=5Fconfig_in_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 15:35:33 -0000
Message-ID: <171319533338.1406028.14370837558855391175@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412213342.181465-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240412213342.181465-1-vinod.govindapillai@intel.com>
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

Series: drm/xe: no need to call fixup_initial_plane_config in XE
URL   : https://patchwork.freedesktop.org/series/132396/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
04432599dcb1becb52633b02487fe3c638ba5915
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d75286f21fb5f4af5e50e23475a53aa232dea17d
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Sat Apr 13 00:33:42 2024 +0300

    drm/xe: no need to call fixup_initial_plane_config in XE
    
    In XE, the updated fb mapping is already done and updated as
    part of intel_find_initial_plane_obj(). So no need to invoke
    fixup_initial_plane_config() again as it would basically write
    the same data to "PLAN_SURF" again.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch 40c465bb2f01d38693dd2ef3ed84b89f95f493f4 drm-intel
d75286f21fb5 drm/xe: no need to call fixup_initial_plane_config in XE


