Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801C5C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3610E764;
	Thu,  9 May 2024 19:47:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FB810F1B6;
 Thu,  9 May 2024 19:47:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/7=5D_drm/xe=3A_Fix_xe=5Fpm=5Fruntime=5Fget=5Fif=5Factive_return?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 19:47:49 -0000
Message-ID: <171528406919.2038581.15843268683215742481@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
URL   : https://patchwork.freedesktop.org/series/133404/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f8ff9eb3b83983484e49a37e85fdb91fee4917d3
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu May 9 15:16:57 2024 -0400

    drm/xe: Enable D3Cold on 'low' VRAM utilization
    
    Now that we eliminated all the mem_access get/put with its
    locking issues from the inner calls of migration, we can
    allow D3Cold.
    
    Enable it when VRAM utilization is lower then 300Mb. On
    higher utilization we only allow D3hot so we don't increase
    so much the latency on runtime resume due to the memory
    restoration.
    
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch fa0763ee56bac0fea0c399b9f41f19439b07b616 drm-intel
d0c1f8c83f3d drm/xe: Fix xe_pm_runtime_get_if_active return
1fa71e7627f2 drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
09e63aae3628 drm/xe: Relax runtime pm protection during execution
413f95d23efc drm/xe: Relax runtime pm protection around VM
2337aa38c6dc drm/xe: Prepare display for D3Cold
3bebcd80760e drm/xe: Stop checking for power_lost on D3Cold
f8ff9eb3b839 drm/xe: Enable D3Cold on 'low' VRAM utilization


