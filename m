Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE64C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 13:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3B610E67F;
	Wed, 11 Jun 2025 13:51:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8DD10E661;
 Wed, 11 Jun 2025 13:51:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_WildCat_Lake_support_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 13:51:28 -0000
Message-ID: <174964988812.67768.14284030201256146215@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611134431.2761487-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250611134431.2761487-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support (rev4)
URL   : https://patchwork.freedesktop.org/series/149794/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a52f745011fe0668299a33c076d4682a7db451eb
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Wed Jun 11 19:14:31 2025 +0530

    drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02
    
    wa_16023981245 need to be extended for display version 30.02
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
+ /mt/dim checkpatch c9fa578feb38223f213de42d5c3f7210d2ce094a drm-intel
31de3feeb450 drm/i915/xe3lpd: Add support for display version 30.02
0a40b5da2710 drm/xe/xe3: Add support for graphics IP version 30.03
e5025c494004 drm/xe/xe3: Add support for media IP version 30.02
c107a0791ed9 drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
a8f3d82b02e3 drm/i915: Set max cdclk for display 30.02
30461fe42beb drm/xe: Add Wildcat Lake device IDs to PTL list
e3e4c1de1578 drm/i915/xe3lpd: Extend DMC path for display version 30.02
eca887218d0a drm/i915/wcl: C10 phy connected to port A and B
a52f745011fe drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02


