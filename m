Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EFAC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 01:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9CF10E4FD;
	Tue, 19 Mar 2024 01:00:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48010E4FD;
 Tue, 19 Mar 2024 01:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/queue=3A_fix_engine=5Fclass_bounds_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 01:00:36 -0000
Message-ID: <171081003637.900422.3596315517900059369@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318180532.57522-4-matthew.auld@intel.com>
In-Reply-To: <20240318180532.57522-4-matthew.auld@intel.com>
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

Series: series starting with [1/3] drm/xe/queue: fix engine_class bounds check
URL   : https://patchwork.freedesktop.org/series/131280/
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
commit fd0882e4989e7b3e398ee9ce93995db18feaf404
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Mar 18 18:05:35 2024 +0000

    drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
    
    Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
    index should always be less than.
    
    v2 (Lucas):
      - Add fixes tag.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 drm-intel
fb30ac3dd077 drm/xe/queue: fix engine_class bounds check
d6a2093a6242 drm/xe/device: fix XE_MAX_GT_PER_TILE check
fd0882e4989e drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check


