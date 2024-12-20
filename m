Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F74E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 22:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919610F083;
	Fri, 20 Dec 2024 22:08:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9C10F08B;
 Fri, 20 Dec 2024 22:08:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Introduce_GuC_PC_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 22:08:28 -0000
Message-ID: <173473250862.930881.18266635860388399933@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220214139.773729-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241220214139.773729-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/xe: Introduce GuC PC debugfs
URL   : https://patchwork.freedesktop.org/series/142894/
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
commit 534b1d64e3d4d84b5a650db9169de1628cae296e
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Dec 20 16:41:39 2024 -0500

    drm/xe/lnl: Enable GuC SLPC DCC task
    
    Enable DCC (Duty Cycle Control) in Lunar Lake.
    
    DCC is the SLPC task that tries to keep
    the GT from operating inefficiently when thermally constrained.
    
    Although the recommendation is to enable it, LNL GuC is leaving
    it disabled by default on LNL.
    
    It would minimize the GT frequency oscillation on throttled
    scenarios, which could potentially reduce latencies.
    
    v2: Move set_policies call after wait for running state, so
        we ensure it is not overwritten. (Vinay)
    v3: Fix English in the commit message (Jonathan)
    
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0eede13975362b755a208b2e2ba322940013f183 drm-intel
c61dc374e14d drm/xe: Introduce GuC PC debugfs
534b1d64e3d4 drm/xe/lnl: Enable GuC SLPC DCC task


