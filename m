Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108BEC3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 12:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AA010E52B;
	Tue,  9 Jul 2024 12:22:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E61A10E52B;
 Tue,  9 Jul 2024 12:22:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Add_Wa=5F15?=
 =?utf-8?q?015404425_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 12:22:23 -0000
Message-ID: <172052774338.86056.12322238400374599403@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240709114340.2987173-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2: Add Wa_15015404425 (rev4)
URL   : https://patchwork.freedesktop.org/series/135679/
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
commit 4bce2bba4fc40b7935ba3b629b3858650383f7c3
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Jul 9 17:13:40 2024 +0530

    drm/xe/xe2: Add Wa_15015404425
    
    Wa_15015404425 asks us to perform four "dummy" writes to a
    non-existent register offset before every real register read.
    Although the specific offset of the writes doesn't directly
    matter, the workaround suggests offset 0x130030 as a good target
    so that these writes will be easy to recognize and filter out in
    debugging traces.
    
    V4(MattR):
      - Use writel and remove xe_reg usage
    V3(MattR):
      - Define dummy reg local to function
      - Avoid tracing dummy writes
      - Update commit message
    V2:
      - Add WA to 8/16/32bit reads also - MattR
      - Corrected dummy reg address - MattR
      - Use for loop to avoid mental pause - JaniN
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch b517815c3f82589b802e2dccb11c8585fda13979 drm-intel
4bce2bba4fc4 drm/xe/xe2: Add Wa_15015404425


