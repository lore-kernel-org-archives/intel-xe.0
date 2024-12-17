Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247FE77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 11:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6FA10E215;
	Tue, 17 Dec 2024 11:25:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0E610E215;
 Tue, 17 Dec 2024 11:25:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_adding_wait_hel?=
 =?utf-8?q?per_for_gt_async_reset_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maciej Patelczyk" <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 11:25:56 -0000
Message-ID: <173443475616.3774725.2520371445382121952@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
In-Reply-To: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
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

Series: drm/xe: adding wait helper for gt async reset (rev4)
URL   : https://patchwork.freedesktop.org/series/142300/
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
commit b720bbc66f437f24c8c43321cc0c7b14ca8df4ca
Author: Maciej Patelczyk <maciej.patelczyk@intel.com>
Date:   Wed Dec 11 12:17:27 2024 +0100

    drm/xe: make change ccs_mode a synchronous action
    
    If ccs_mode is being modified via
       /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
    the asynchronous reset is triggered and the write returns immediately.
    
    With that some test receive false information about number of CCS engines
    or even fail if they proceed without delay after changing the ccs_mode.
    
    Changing the ccs_mode change from async to sync to prevent failures in
    tests.
    
    Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch ff2d4c1b285a836d28341cdf04adbc811757d4c8 drm-intel
351696b2bd5b drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
b720bbc66f43 drm/xe: make change ccs_mode a synchronous action


