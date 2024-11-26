Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7CED65551
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 19:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB2A10E9AE;
	Tue, 26 Nov 2024 19:27:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6202F10E9AE;
 Tue, 26 Nov 2024 19:27:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/migrate=3A_fix_pat_index_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 19:27:46 -0000
Message-ID: <173264926639.3459849.11694060514406266430@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126181259.159713-3-matthew.auld@intel.com>
In-Reply-To: <20241126181259.159713-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe/migrate: fix pat index usage
URL   : https://patchwork.freedesktop.org/series/141805/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 10003ea3baeb9f54c881cc2d059ac9cd70bfb7cd
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Nov 26 18:13:01 2024 +0000

    drm/xe/migrate: use XE_BO_FLAG_PAGETABLE
    
    On some HW we want to avoid the host caching PTEs, since access from GPU
    side can be incoherent. However here the special migrate object is
    mapping PTEs which are written from the host and potentially cached. Use
    XE_BO_FLAG_PAGETABLE to ensure that non-cached mapping is used, on
    platforms where this matters.
    
    Fixes: 7a060d786cc1 ("drm/xe/mtl: Map PPGTT as CPU:WC")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 739a2506c44a0be22cc842d2c625a05ed21c1198 drm-intel
b2dfda7d7e4b drm/xe/migrate: fix pat index usage
10003ea3baeb drm/xe/migrate: use XE_BO_FLAG_PAGETABLE


