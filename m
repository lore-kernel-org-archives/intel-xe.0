Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F15EC30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 13:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5794D10E1AD;
	Fri,  5 Jul 2024 13:07:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9A310E1AD;
 Fri,  5 Jul 2024 13:07:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Add_Wa=5F15?=
 =?utf-8?q?015404425_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 13:07:34 -0000
Message-ID: <172018485463.30803.17146085266478155736@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705130324.2769481-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240705130324.2769481-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2: Add Wa_15015404425 (rev3)
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
commit 3791313b923f5f201761807772e2506a313fb86d
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Jul 5 18:33:24 2024 +0530

    drm/xe/xe2: Add Wa_15015404425
    
    Wa_15015404425 asks us to perform four "dummy" writes to a
    non-existent register offset before every real register read.
    Although the specific offset of the writes doesn't directly
    matter, the workaround suggests offset 0x130030 as a good target
    so that these writes will be easy to recognize and filter out in
    debugging traces.
    
    V3(MattR):
      - Define dummy reg local to function
      - Avoid tracing dummy writes
      - Update commit message
    V2:
      - Add WA to 8/16/32bit reads also - MattR
      - Corrected dummy reg address - MattR
      - Use for loop to avoid mental pause - JaniN
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch cdd1a80a2d16d5213af20a29eb7570a7651db7dc drm-intel
3791313b923f drm/xe/xe2: Add Wa_15015404425


