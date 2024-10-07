Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F6C35FE0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 20:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8C10E064;
	Mon,  7 Oct 2024 20:23:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488A910E064;
 Mon,  7 Oct 2024 20:23:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ptl=3A_L3bank_mask?=
 =?utf-8?q?_is_not_available_on_the_media_GT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 20:23:04 -0000
Message-ID: <172833258429.1200443.924791829417726211@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007154143.2021124-2-matthew.d.roper@intel.com>
In-Reply-To: <20241007154143.2021124-2-matthew.d.roper@intel.com>
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

Series: drm/xe/ptl: L3bank mask is not available on the media GT (rev2)
URL   : https://patchwork.freedesktop.org/series/139586/
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
commit 37b15026d2df333f83c8b421cd5868a76543460d
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Mon Oct 7 08:41:44 2024 -0700

    drm/xe/ptl: L3bank mask is not available on the media GT
    
    On PTL platforms with media version 30.00, the fuse registers for
    reporting L3 bank availability to the GT just read out as ~0 and do not
    provide proper values.  Xe does not use the L3 bank mask for anything
    internally; it only passes the mask through to userspace via the GT
    topology query.
    
    Since we don't have any way to get the real L3 bank mask, we don't want
    to pass garbage to userspace.  Passing a zeroed mask or a copy of the
    primary GT's L3 bank mask would also be inaccurate and likely to cause
    confusion for userspace.  The best approach is to simply not include L3
    in the list of masks returned by the topology query in cases where we
    aren't able to provide a meaningful value.  This won't change the
    behavior for any existing platforms (where we can always obtain L3 masks
    successfully for all GTs), it will only prevent us from mis-reporting
    bad information on upcoming platform(s).
    
    There's a good chance this will become a formal workaround in the
    future, but for now we don't have a lineage number so "no_media_l3" is
    used in place of a lineage as the OOB workaround descriptor.
    
    v2:
     - Re-calculate query size to properly match data returned. (Gustavo)
     - Update kerneldoc to clarify that the L3bank mask may not be included
       in the query results if the hardware doesn't make it available.
       (Gustavo)
    
    Cc: Matt Atwood <matthew.s.atwood@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 1f72b793ff063e3519fc58ca3f3e83854b990ee7 drm-intel
37b15026d2df drm/xe/ptl: L3bank mask is not available on the media GT


