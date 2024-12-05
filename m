Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD64E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 15:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64C310EEC7;
	Thu,  5 Dec 2024 15:03:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477110EEC7;
 Thu,  5 Dec 2024 15:03:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_Use_non-interruptible_wait_when_moving_BO_to?=
 =?utf-8?q?_system?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 15:03:51 -0000
Message-ID: <173341103134.2994774.16906827776414163980@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
In-Reply-To: <20241205120253.2015537-1-nirmoy.das@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: Use non-interruptible wait when moving BO to system
URL   : https://patchwork.freedesktop.org/series/142171/
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
commit e55b1049c87e10543812e5ba8da9e469c05c7281
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Dec 5 13:02:53 2024 +0100

    drm/xe: Wait for migration job before unmapping pages
    
    There could be still migration job going on while doing
    xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
    waiting for the migration job to finish.
    
    v2: Use intr=false(Matt A)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
    Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.11+
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 320bf1795129fe4fb8127717e92289cd09ce0bfd drm-intel
b218baeb2edc drm/xe: Use non-interruptible wait when moving BO to system
e55b1049c87e drm/xe: Wait for migration job before unmapping pages


