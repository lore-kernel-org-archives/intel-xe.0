Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AE5C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 13:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7FC10E217;
	Mon, 12 Aug 2024 13:44:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8354810E217;
 Mon, 12 Aug 2024 13:44:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2hpg=3A_Add_wa?=
 =?utf-8?q?=5F14021821874_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 13:44:33 -0000
Message-ID: <172347027353.595303.9278566375472510011@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812134117.813670-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240812134117.813670-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2hpg: Add wa_14021821874 (rev3)
URL   : https://patchwork.freedesktop.org/series/133007/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c232102ca1ac9c7111fcd1ee429f8ee71a4d2a5b
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Aug 12 19:11:17 2024 +0530

    drm/xe/xe2hpg: Add Wa_14021821874
    
    Wa_14021821874 applies to xe2_hpg
    
    V2(Himal):
      - Use space after define
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 87d7c94569370d9da7d1d3f768d0418e0e0eb286 drm-intel
c232102ca1ac drm/xe/xe2hpg: Add Wa_14021821874


