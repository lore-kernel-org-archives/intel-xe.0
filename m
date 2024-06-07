Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3FFC27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB29C10E079;
	Fri,  7 Jun 2024 12:30:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5F10E079;
 Fri,  7 Jun 2024 12:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpm=3A_Fixup_Wa?=
 =?utf-8?q?=5F14020756599_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 12:30:27 -0000
Message-ID: <171776342719.26249.5252893731024794631@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2lpm: Fixup Wa_14020756599 (rev2)
URL   : https://patchwork.freedesktop.org/series/134571/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4a06f013aa44bc15c8e5c6fb2ef319705f749cb1
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Jun 7 17:55:28 2024 +0530

    drm/xe/xe2lpm: Fixup Wa_14020756599
    
    This WA needs to be applied to graphics GT when the media version
    is 2000. Currently, media version 2000 is always paired with
    graphics version 2004 which will result in writing same register
    with same bits twice. We can't add optional rule in rtp
    framework and also writing same register with same bits gives
    warning.
    
    Currently, media version 2000 is always paired with graphics version
    2004, so just checking the latter is sufficient.
    
    V2(Lucas):
      - Add more detail in commit message
      - Improve code comment to follow guideline
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016
    Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch d9550a18e990d5709c4bc33073842a3c0a8bcaea drm-intel
4a06f013aa44 drm/xe/xe2lpm: Fixup Wa_14020756599


