Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3099C54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782F310E751;
	Wed,  6 Mar 2024 05:24:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0FA10E751;
 Wed,  6 Mar 2024 05:24:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Spin_of_Reduce_GGTT_displ?=
 =?utf-8?q?ay_pinning_latency=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 05:24:49 -0000
Message-ID: <170970268997.524851.14958037258992845412@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306052002.311196-1-matthew.brost@intel.com>
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
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

Series: Spin of Reduce GGTT display pinning latency.
URL   : https://patchwork.freedesktop.org/series/130786/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c60c694d526f97717965267ec48b652aae9754b
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 5 21:20:02 2024 -0800

    drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
    
    Considering the caller of the GGTT functions should keep the
    backing storage alive before the function completes, it's not
    necessary to invalidate with the GGTT lock held. This just adds
    latency for every user of the GGTT.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch dd08fd912fdc1b72984a39852fdbee49b97b8ce4 drm-intel
4fe2100e4a80 drm/xe: Fix NULL check in xe_ggtt_init()
c8ed0295f52e drm/xe: Drop ggtt invalidate from display code
41524b1289b1 drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
2c60c694d526 drm/xe: Move xe_ggtt_invalidate out from ggtt->lock


