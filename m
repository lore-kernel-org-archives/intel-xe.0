Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B61C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 20:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B680D1129A0;
	Fri,  3 May 2024 20:34:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070A01129A0;
 Fri,  3 May 2024 20:34:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Unlock_deeper_package-C_s?=
 =?utf-8?q?tates_=28PC-10=29_and_D3Cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 20:34:48 -0000
Message-ID: <171476848802.1888398.11042373969678389739@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
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

Series: Unlock deeper package-C states (PC-10) and D3Cold
URL   : https://patchwork.freedesktop.org/series/133186/
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
commit d468b68a8e0dac7c3ecb8a397418f9a6551a6ff7
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri May 3 15:13:09 2024 -0400

    drm/xe: Enable D3Cold on 'low' VRAM utilization
    
    Now that we eliminated all the mem_access get/put with its
    locking issues from the inner calls of migration, we can
    allow D3Cold.
    
    Enable it when VRAM utilization is lower then 300Mb. On
    higher utilization we only allow D3hot so we don't increase
    so much the latency on runtime resume due to the memory
    restoration.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e9ea5061461b07fcb7e19892a54a61aa8fa1d163 drm-intel
fadf69239a78 drm/xe: Fix xe_pm_runtime_get_if_active return
780aa1f19e68 drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
fc3df2bc9155 drm/xe: Relax runtime pm protection during execution
6cae889978db drm/xe: Relax runtime pm protection around VM
bb06506d9718 drm/xe: Prepare display for D3Cold
f21d6aff03cf drm/xe: Stop checking for power_lost on D3Cold
d468b68a8e0d drm/xe: Enable D3Cold on 'low' VRAM utilization


