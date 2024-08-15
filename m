Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592CC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 19:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55D810E533;
	Thu, 15 Aug 2024 19:40:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44D810E533;
 Thu, 15 Aug 2024 19:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_debugfs_to_dump_GuC=27s_hwconfig?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Aug 2024 19:40:23 -0000
Message-ID: <172375082373.634935.15641357294068133592@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
In-Reply-To: <20240815172602.2729146-3-matthew.d.roper@intel.com>
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

Series: series starting with [1/2] drm/xe: Add debugfs to dump GuC's hwconfig
URL   : https://patchwork.freedesktop.org/series/137350/
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
commit 2a393b64da6622a39911ca7705c5a6da7b04c7ec
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Aug 15 10:26:04 2024 -0700

    drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes
    
    When steering MCR register ranges of type "DSS," the group_id and
    instance_id values are calculated by dividing the DSS pool according to
    the size of a gslice or cslice, depending on the platform.  These values
    haven't changed much on past platforms, so we've been able to hardcode
    the proper divisor so far.  However the layout may not be so fixed on
    future platforms so the proper, future-proof way to determine this is by
    using some of the attributes from the GuC's hwconfig table.  The
    hwconfig has two attributes reflecting the architectural maximum slice
    and subslice counts (i.e., before any fusing is considered) that can be
    used for the purposes of calculating MCR steering targets.
    
    If the hwconfig is lacking the necessary values (which should only be
    possible on older platforms before these attributes were added), we can
    still fall back to the old hardcoded values.  Going forward the hwconfig
    is expected to always provide the information we need on newer
    platforms, and any failure to do so will be considered a bug in the
    firmware that will prevent us from switching to the buggy firmware
    release.
    
    It's worth noting that over time GuC's hwconfig has provided a couple
    different keys with similar-sounding descriptions.  For our purposes
    here, we only trust the newer key "70" which has supplanted the
    similarly-named key "2" that existed on older platforms.
    
    Bspec: 73210
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 770743bfee094dc88b4513221aa08773e69a1bb9 drm-intel
5946a58e81fb drm/xe: Add debugfs to dump GuC's hwconfig
2a393b64da66 drm/xe/mcr: Try to derive dss_per_grp from hwconfig attributes


