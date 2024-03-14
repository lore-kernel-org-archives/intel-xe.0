Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B771CC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 21:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B59E10FE1D;
	Thu, 14 Mar 2024 21:41:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8B510FE29;
 Thu, 14 Mar 2024 21:41:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/mocs=3A_Determine_MCR_separately_for_primary/media_G?=
 =?utf-8?q?T_in_kunit_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 21:41:49 -0000
Message-ID: <171045250938.756190.13507443597700948614@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314195825.3226856-3-matthew.d.roper@intel.com>
In-Reply-To: <20240314195825.3226856-3-matthew.d.roper@intel.com>
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

Series: series starting with [1/2] drm/xe/mocs: Determine MCR separately for primary/media GT in kunit test
URL   : https://patchwork.freedesktop.org/series/131151/
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
commit e8621fee2d9ff1bf119f21e4bd23d7eee7d82976
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Mar 14 12:58:27 2024 -0700

    drm/xe/mocs: Clarify which GT is being operated on
    
    Switch the MOCS-related debug messages to use a GT-specific logging
    function and add ID/type output to the beginning of the MOCS kunit test
    to assist with debug when problems arise.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c44e29a7b62293355744fd857aad93cbf43e5126 drm-intel
4fe471d54177 drm/xe/mocs: Determine MCR separately for primary/media GT in kunit test
e8621fee2d9f drm/xe/mocs: Clarify which GT is being operated on


