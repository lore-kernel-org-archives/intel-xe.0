Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA57C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 10:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A1710E0F3;
	Tue, 18 Mar 2025 10:22:09 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C9710E0F3;
 Tue, 18 Mar 2025 10:22:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fgt=5Fpagefaul?=
 =?utf-8?q?t=3A_Remove_pagefault_vfid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Mar 2025 10:22:07 -0000
Message-ID: <174229332766.47987.4584109202797185214@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317152656.66069-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250317152656.66069-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_gt_pagefault: Remove pagefault vfid
URL   : https://patchwork.freedesktop.org/series/146404/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d28d87bbbf570e7ca206e2c64c4879a60e038453
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Mar 17 15:26:56 2025 +0000

    drm/xe/xe_gt_pagefault: Remove pagefault vfid
    
    The VFID will always be zero according to the GuC ABI, at least with
    respect to pagefault reporting.  So, stop storing and reporting it.
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Matt Brost <matthew.brost@intel.com>
    CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
d28d87bbbf57 drm/xe/xe_gt_pagefault: Remove pagefault vfid


