Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB4AE7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 17:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C5C10E3AD;
	Fri, 20 Dec 2024 17:01:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC9910E3B2;
 Fri, 20 Dec 2024 17:01:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Introduce_GuC_PC_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 17:01:36 -0000
Message-ID: <173471409657.851485.584096162011658620@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220153010.623747-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241220153010.623747-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/142885/
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
commit 32d15f57f1fd060e4677e7f0b88a389cc4161cc4
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Dec 20 10:30:10 2024 -0500

    drm/xe/lnl: Enable GuC SLPC DCC task
    
    Enable DCC (Duty Cycle Control) in Lunar Lake.
    
    DCC is the SLPC task that tries to keep
    the GT from operating inefficiently when thermally constrained.
    
    Although the recommendation is to enable it, LNL GuC is leaving
    it disabled by default on LNL.
    
    It would minimize the GT frequency oscilation on throttled
    scenarios, what could potentially reduce latencies.
    
    v2: Move set_policies call after wait for running state, so
        we ensure it is not overwritten. (Vinay)
    
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch d574310669011e7ef8da6d7e17a2938cae06e077 drm-intel
1dfe0784ea24 drm/xe: Introduce GuC PC debugfs
32d15f57f1fd drm/xe/lnl: Enable GuC SLPC DCC task


