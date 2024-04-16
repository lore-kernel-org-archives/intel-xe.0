Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA37C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 06:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7E310EE1A;
	Tue, 16 Apr 2024 06:04:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0510EC30;
 Tue, 16 Apr 2024 06:03:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleanup_and_fixes_in_drmm?=
 =?utf-8?q?=5Fadd=5Faction=5For=5Freset_usage_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 06:03:59 -0000
Message-ID: <171324743991.1424598.4775177662556449551@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev5)
URL   : https://patchwork.freedesktop.org/series/132150/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 493c2eed2a75f1fd6ef25c36589a149aaedc7a9d
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Apr 12 23:42:11 2024 +0530

    drm/xe/pm: Capture errors and handle them
    
    xe_pm_init may encounter failures for various reasons, such as a failure
    in initializing drmm_mutex, or when dealing with a d3cold-capable device
    for vram_threshold sysfs creation and setting default threshold.
    Presently, all these potential failures are disregarded.
    
    Move d3cold.lock initialization to xe_pm_init_early and cause driver
    abort if mutex initialization has failed.
    
    For xe_pm_init failures cleanup the driver and return error code
    
    -v2
    Make mutex init cleaner (Lucas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 5f7597e990bea547bd1261170497e7476fb781bb drm-intel
41e075dac739 drm/xe: Simplify function return using drmm_add_action_or_reset()
90d14e93e99f drm/xe: Remove sysfs only once on action add failure
aa2e43682a55 drm/xe: call free_gsc_pkt only once on action add failure
f4fa6c15b94a drm/xe: Return NULL in case of drmm_add_action_or_reset failure
b99e9b797fd5 drm/xe/gt: Abort driver load for sysfs creation failure
8afdd8b14638 drm/xe/tile: Abort driver load for sysfs creation failure
493c2eed2a75 drm/xe/pm: Capture errors and handle them


