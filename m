Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E19C25B79
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA87E10E004;
	Wed, 22 May 2024 17:08:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDA110E004;
 Wed, 22 May 2024 17:08:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/7=5D_drm/xe=3A_Fix_xe=5Fpm=5Fruntime=5Fget=5Fif=5Factive_re?=
 =?utf-8?q?turn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 17:08:49 -0000
Message-ID: <171639772937.2167935.4573167476682971160@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
URL   : https://patchwork.freedesktop.org/series/133929/
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
commit f1a41bc40dbcddb9ce3cdffa676b12700cd7f6f1
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed May 22 13:01:05 2024 -0400

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
+ /mt/dim checkpatch 42b9a14c5932c577019bf2f5d5ff25d208c1f921 drm-intel
6ebbe3f54dc9 drm/xe: Fix xe_pm_runtime_get_if_active return
f414b0e2d22c drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
491b677ef844 drm/xe: Relax runtime pm protection during execution
a22c71cbbdc0 drm/xe: Relax runtime pm protection around VM
31347e805a95 drm/xe: Prepare display for D3Cold
296cc9b92dbb drm/xe: Stop checking for power_lost on D3Cold
f1a41bc40dbc drm/xe: Enable D3Cold on 'low' VRAM utilization


