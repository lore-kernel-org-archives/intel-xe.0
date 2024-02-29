Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB63C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 06:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4B10E039;
	Thu, 29 Feb 2024 06:18:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3DD10E039;
 Thu, 29 Feb 2024 06:18:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/arl=3A_Add_Arrow_L?=
 =?utf-8?q?ake_H_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Feb 2024 06:18:57 -0000
Message-ID: <170918753720.393540.15857863535625249752@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe/arl: Add Arrow Lake H support (rev2)
URL   : https://patchwork.freedesktop.org/series/130484/
State : warning

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
commit c1b7f4497c26b6b2ce42abfd50e6788ed21e8d89
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Thu Feb 29 11:43:31 2024 +0530

    drm/xe/arl: Add Arrow Lake H support
    
    ARL-H uses the same media and display IP as MTL, and a version 12.74
    graphics IP (referred to as Xe_LPG+). From a driver point of view, we
    should be able to just treat the whole platform as MTL and rely on
    GRAPHICS_VERx100 checks to handle any spots where ARL's Xe_LPG+ needs
    different handling from MTL's Xe_LPG (i.e., workarounds).
    
    v2: Resolve confict and reorder PCI ids in sorted order
    
    Bspec: 55420
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch eec7a135b960c7b83b13a7c821e30f956074e439 drm-intel
a3e9d8d68721 drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
4acaed884eca drm/xe/xelpg: Extend some workarounds to graphics version 12.74
c1b7f4497c26 drm/xe/arl: Add Arrow Lake H support
-:34: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>'

total: 1 errors, 0 warnings, 0 checks, 13 lines checked


