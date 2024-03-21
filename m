Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECC8C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 12:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226910E820;
	Thu, 21 Mar 2024 12:06:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB410E820;
 Thu, 21 Mar 2024 12:06:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/query=3A_fix_gt=5F?=
 =?utf-8?q?id_bounds_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 12:06:22 -0000
Message-ID: <171102278292.940404.13644894176181792659@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321110629.334701-2-matthew.auld@intel.com>
In-Reply-To: <20240321110629.334701-2-matthew.auld@intel.com>
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

Series: drm/xe/query: fix gt_id bounds check
URL   : https://patchwork.freedesktop.org/series/131418/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c2ed174f2cdbef62d35dc55f4a06426291004eb5
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Mar 21 11:06:30 2024 +0000

    drm/xe/query: fix gt_id bounds check
    
    The user provided gt_id should always be less than the
    XE_MAX_GT_PER_TILE.
    
    Fixes: 7793d00d1bf5 ("drm/xe: Correlate engine and cpu timestamps with better accuracy")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 971a18d8ed1d2022dcd268b5bb27b54bf450baa2 drm-intel
c2ed174f2cdb drm/xe/query: fix gt_id bounds check


