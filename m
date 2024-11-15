Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C2BD68BCB
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 16:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282E10E89E;
	Fri, 15 Nov 2024 16:07:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F29410E2D8;
 Fri, 15 Nov 2024 16:07:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/i915/wm=3A_Initialize_max=5Flatency_variable_to_appropr?=
 =?utf-8?q?iate_value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Nov 2024 16:07:56 -0000
Message-ID: <173168687618.285105.14813313936445753437@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115160116.1436521-1-suraj.kandpal@intel.com>
In-Reply-To: <20241115160116.1436521-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/6] drm/i915/wm: Initialize max_latency variable to appropriate value
URL   : https://patchwork.freedesktop.org/series/141412/
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
commit 989c215d8e7f8dd282ea14b29634c6bc33d439a1
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Nov 15 21:31:16 2024 +0530

    drm/i915/wm: Modify latency programmed into PKG_C_LATENCY
    
    Increase the latency programmed into PKG_C_LATENCY latency to be
    a multiple of line time which is written into WM_LINETIME.
    
    --v2
    -Fix commit subject line [Sai Teja]
    -Use individual DISPLAY_VER checks instead of range [Sai Teja]
    -Initialize max_linetime [Sai Teja]
    
    --v3
    -take into account the scenario when adjusted_latency is 0 [Vinod]
    
    --v4
    -rename adjusted_latency to latency [Mitul]
    -fix the condition in which dpkgc is disabled [Vinod]
    
    --v5
    -Add check to see if max_linetime is 0 [Vinod]
    
    WA: 22020299601
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c43ac257e8f2dfe3a5f56d3565472cb8051ca32d drm-intel
8b62708482d3 drm/i915/wm: Initialize max_latency variable to appropriate value
bce8de51c2b2 drm/i915/wm: Refactor dpkgc value prepration
04172b889ca4 drm/i915/wm: Rename enable_dpkgc variable
6814300dedc5 drm/i915/wm: Use intel_display structure in DPKGC code
8ffa6532de4b drm/i915/display: Refactor DPKGC code to call it from atomic_commit_tail
989c215d8e7f drm/i915/wm: Modify latency programmed into PKG_C_LATENCY


