Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D80C3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 14:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42510E23D;
	Mon, 12 Aug 2024 14:31:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E0A10E23D;
 Mon, 12 Aug 2024 14:31:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_fix_engine=5Fcl?=
 =?utf-8?q?ass_bounds_check_again?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 14:31:05 -0000
Message-ID: <172347306540.595375.3897543528099698985@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812141331.729843-2-matthew.auld@intel.com>
In-Reply-To: <20240812141331.729843-2-matthew.auld@intel.com>
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

Series: drm/xe: fix engine_class bounds check again
URL   : https://patchwork.freedesktop.org/series/137189/
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
commit 22ed3a58006bef783397e6d44d2808e268db9f15
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Aug 12 15:13:32 2024 +0100

    drm/xe: fix engine_class bounds check again
    
    This was fixed in commit b7dce525c4fc ("drm/xe/queue: fix engine_class
    bounds check"), but then re-introduced in commit 6f20fc09936e ("drm/xe:
    Move and export xe_hw_engine lookup.") which should only be simple code
    movement of the existing function.
    
    Fixes: 6f20fc09936e ("drm/xe: Move and export xe_hw_engine lookup.")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 87d7c94569370d9da7d1d3f768d0418e0e0eb286 drm-intel
22ed3a58006b drm/xe: fix engine_class bounds check again


