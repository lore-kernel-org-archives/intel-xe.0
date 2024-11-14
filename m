Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6264D41C3A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 04:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9960E10E794;
	Thu, 14 Nov 2024 04:38:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD3710E794;
 Thu, 14 Nov 2024 04:38:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/watermark=3A_Refactor_dpkgc_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 04:38:44 -0000
Message-ID: <173155912464.3944581.16188932359895356139@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114043040.1396947-1-suraj.kandpal@intel.com>
In-Reply-To: <20241114043040.1396947-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/2] drm/i915/watermark: Refactor dpkgc code
URL   : https://patchwork.freedesktop.org/series/141334/
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
commit ef137b8cae2588b57e77b1dd2cfe8543b2cf5ce3
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Nov 14 10:00:41 2024 +0530

    drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY
    
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
+ /mt/dim checkpatch 52166ab72753e6d0d496539d050a5f54d9f2278b drm-intel
4fec9eb3672e drm/i915/watermark: Refactor dpkgc code
ef137b8cae25 drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY


