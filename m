Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF7C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21B10E0A5;
	Fri, 24 May 2024 21:25:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7851D10E0A5;
 Fri, 24 May 2024 21:25:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Use_run=5Fticks_instead_of_runtime_for_client_sta?=
 =?utf-8?q?ts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 21:25:25 -0000
Message-ID: <171658592549.2210596.16224831399755368791@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
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

Series: series starting with [1/2] drm/xe: Use run_ticks instead of runtime for client stats
URL   : https://patchwork.freedesktop.org/series/134033/
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
commit 02d3c09c62628d5a7c8fdff7c6903f09dc860617
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Fri May 24 14:09:49 2024 -0700

    drm/xe: Do not access xe file when updating exec queue run_ticks
    
    The current code is running into a use after free case where xe file is
    closed before the exec queue run_ticks can be updated. This is occurring
    in the xe_file_close path. To fix that, do not access xe file when
    updating the exec queue run_ticks. Instead store the exec queue run_ticks
    locally in the exec queue object and accumulate it when the user dumps
    the drm client stats. We know that the xe file is valid when user is
    dumping the run_ticks for the drm client, so this effectively
    removes the dependency on xe file object in
    xe_exec_queue_update_run_ticks().
    
    v2:
    - Fix the accumulation of q->run_ticks delta into xe file run_ticks
    - s/runtime/run_ticks/ (Rodrigo)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908
    Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f drm-intel
6d1e61414020 drm/xe: Use run_ticks instead of runtime for client stats
02d3c09c6262 drm/xe: Do not access xe file when updating exec queue run_ticks


