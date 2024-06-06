Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3B9C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 14:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539A10E97A;
	Thu,  6 Jun 2024 14:35:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AE310E97C;
 Thu,  6 Jun 2024 14:35:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpm=3A_Fixup_Wa?=
 =?utf-8?q?=5F14020756599?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 14:35:57 -0000
Message-ID: <171768455717.22870.6237397566079089584@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606135228.998820-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240606135228.998820-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2lpm: Fixup Wa_14020756599
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
commit 7e91246b6bfd55a745f73817fe6b1f58373da478
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jun 6 19:22:28 2024 +0530

    drm/xe/xe2lpm: Fixup Wa_14020756599
    
    In the current situation, Media 2000 is along with xe2_lpg,
    thus WA is already covered.
    
    https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016
    
    Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 74e12deceaf66575232fc55cdf722a191359e82e drm-intel
7e91246b6bfd drm/xe/xe2lpm: Fixup Wa_14020756599


