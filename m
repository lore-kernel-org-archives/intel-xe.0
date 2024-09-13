Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50326FA3758
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 13:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1C510E272;
	Fri, 13 Sep 2024 13:54:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685AD10E278;
 Fri, 13 Sep 2024 13:54:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vram=3A_fix_ccs_of?=
 =?utf-8?q?fset_calculation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 13:54:56 -0000
Message-ID: <172623569642.996717.6538724895163594088@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913120023.310565-2-matthew.auld@intel.com>
In-Reply-To: <20240913120023.310565-2-matthew.auld@intel.com>
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

Series: drm/xe/vram: fix ccs offset calculation (rev2)
URL   : https://patchwork.freedesktop.org/series/138646/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 34da7405b703ab8a6a458061d599dc60d8c2c2d8
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Sep 13 13:00:24 2024 +0100

    drm/xe/vram: fix ccs offset calculation
    
    Spec says SW is expected to round up to the nearest 128K, if not already
    aligned for the CC unit view of CCS. We are seeing the assert sometimes
    pop on BMG to tell us that there is a hole between GSM and CCS, as well
    as popping other asserts with having a vram size with strange alignment,
    which is likely caused by misaligned offset here.
    
    BSpec: 68023
    Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch ceffbbae8df33f194ae06e0174dfb0a7d726b2f7 drm-intel
34da7405b703 drm/xe/vram: fix ccs offset calculation


