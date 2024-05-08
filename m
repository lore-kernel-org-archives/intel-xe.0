Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3A3C25B4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836111295D;
	Wed,  8 May 2024 20:14:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B1D11295D;
 Wed,  8 May 2024 20:14:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/7=5D_drm/xe=3A_Fix_xe=5Fpm=5Fruntime=5Fget=5Fif=5Factive_return?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 20:14:09 -0000
Message-ID: <171519924956.2023341.7936066708024105024@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/133344/
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
commit c8095ec763d32b98db2f7d6df07b565ba81b79f9
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed May 8 16:07:07 2024 -0400

    drm/xe: Enable D3Cold on 'low' VRAM utilization
    
    Now that we eliminated all the mem_access get/put with its
    locking issues from the inner calls of migration, we can
    allow D3Cold.
    
    Enable it when VRAM utilization is lower then 300Mb. On
    higher utilization we only allow D3hot so we don't increase
    so much the latency on runtime resume due to the memory
    restoration.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 8476ff943d5bc96e47fd38df01b1d2c632c2dda6 drm-intel
27ce1e6e0f11 drm/xe: Fix xe_pm_runtime_get_if_active return
a6ba2ff8cb53 drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
3dd22db6807c drm/xe: Relax runtime pm protection during execution
1d01615dc30c drm/xe: Relax runtime pm protection around VM
4a2ee3321bdb drm/xe: Prepare display for D3Cold
a53ea09ed0e0 drm/xe: Stop checking for power_lost on D3Cold
c8095ec763d3 drm/xe: Enable D3Cold on 'low' VRAM utilization


