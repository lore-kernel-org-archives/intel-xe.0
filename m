Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3189C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 20:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989B10E0A5;
	Fri, 24 May 2024 20:32:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988610F67B;
 Fri, 24 May 2024 20:32:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_uniniti?=
 =?utf-8?q?alised_count_in_GuC_load_debug_prints?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 20:32:33 -0000
Message-ID: <171658275368.2207594.6689589528187236338@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Fix uninitialised count in GuC load debug prints
URL   : https://patchwork.freedesktop.org/series/134032/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47dda4d962d04f0563e7498b45bf367be56129e2
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri May 24 13:26:03 2024 -0700

    drm/xe/guc: Fix uninitialised count in GuC load debug prints
    
    The debug prints about how long the GuC load takes have a loop
    counter. However that was neither initialised nor incremented! Plus,
    counting loops is no longer meaningful given the wait function returns
    early for any change in the status value. So fix it to only count
    loops due to actual timeouts.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202405250151.IbH0l8FG-lkp@intel.com/
    Fixes: b0ac1b42dbdc ("drm/xe/guc: Port over the slow GuC loading support from i915")
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Fei Yang <fei.yang@intel.com>
    Cc: intel-xe@lists.freedesktop.org
+ /mt/dim checkpatch 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f drm-intel
47dda4d962d0 drm/xe/guc: Fix uninitialised count in GuC load debug prints


