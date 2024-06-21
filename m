Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F9AC2BA1A
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 07:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187610EB23;
	Fri, 21 Jun 2024 07:20:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8301510EB23;
 Fri, 21 Jun 2024 07:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?1=2C1/1=5D_drm/xe/bo=3A_Fix_fixed_placement_ggtt_pinning_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 07:20:26 -0000
Message-ID: <171895442653.130958.15663923995492334195@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20240621071506.912055-1-alan.previn.teres.alexis@intel.com>
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

Series: series starting with [v1,1/1] drm/xe/bo: Fix fixed placement ggtt pinning code
URL   : https://patchwork.freedesktop.org/series/135161/
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
commit 20b4f0a8c8ed58668dc4bd163990927d8c39dd85
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Fri Jun 21 00:15:06 2024 -0700

    drm/xe/bo: Fix fixed placement ggtt pinning code
    
    When calling xe_bo_create_pin_map_at, use the correct
    starting offset provided by caller at xe_ggtt_insert_bo_at.
    
    Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 40deb379b103746ee4c9df5f0f1919bd4703c9cc drm-intel
20b4f0a8c8ed drm/xe/bo: Fix fixed placement ggtt pinning code


