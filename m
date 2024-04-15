Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C566AC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 14:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809421125D6;
	Mon, 15 Apr 2024 14:05:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0801125D6;
 Mon, 15 Apr 2024 14:05:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/stolen=3A_lower_the_default_alignment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 14:05:00 -0000
Message-ID: <171318990057.1406028.8944420013735291381@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412150301.273344-3-matthew.auld@intel.com>
In-Reply-To: <20240412150301.273344-3-matthew.auld@intel.com>
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

Series: series starting with [1/2] drm/xe/stolen: lower the default alignment
URL   : https://patchwork.freedesktop.org/series/132382/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
04432599dcb1becb52633b02487fe3c638ba5915
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b2b0925f5a815ca0688a90bcbb02ad7bf5dffbbd
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Apr 12 16:03:03 2024 +0100

    drm/xe/stolen: ignore first page for FBC
    
    We have observed underruns on some platforms if the CFB offset is within
    the first page of stolen. Just like i915 skip the first page.
    
    v2 (Maarten)
      - Also align the start.
    
    BSpec: 50214
    Reported-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch a503d0d68ea39792b2740a7af033bd42fb84f4a5 drm-intel
6744980cf12e drm/xe/stolen: lower the default alignment
b2b0925f5a81 drm/xe/stolen: ignore first page for FBC
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


