Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8CCC48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 07:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAA510E14B;
	Thu, 29 Feb 2024 07:12:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D4D10E14B;
 Thu, 29 Feb 2024 07:12:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/arl=3A_Add_Arrow_L?=
 =?utf-8?q?ake_H_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Feb 2024 07:12:46 -0000
Message-ID: <170919076669.393540.2661792711922009584@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe/arl: Add Arrow Lake H support (rev3)
URL   : https://patchwork.freedesktop.org/series/130484/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a88a3ec65cac53e92260e5bfd8eeb6083a6da71f
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Thu Feb 29 12:38:06 2024 +0530

    drm/xe/arl: Add Arrow Lake H support
    
    ARL-H uses the same media and display IP as MTL, and a version 12.74
    graphics IP (referred to as Xe_LPG+). From a driver point of view, we
    should be able to just treat the whole platform as MTL and rely on
    GRAPHICS_VERx100 checks to handle any spots where ARL's Xe_LPG+ needs
    different handling from MTL's Xe_LPG (i.e., workarounds).
    
    v2: Resolve conflict and Reorder PCI ids in sorted order
    v3: Append signed-off-by commiter to this commit
    
    Bspec: 55420
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch eec7a135b960c7b83b13a7c821e30f956074e439 drm-intel
56d7a414f55a drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
d7e7bc42861c drm/xe/xelpg: Extend some workarounds to graphics version 12.74
a88a3ec65cac drm/xe/arl: Add Arrow Lake H support


