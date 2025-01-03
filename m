Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCFEE77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 06:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067710E805;
	Fri,  3 Jan 2025 06:21:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2EC10E805;
 Fri,  3 Jan 2025 06:21:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Clean_and_Optimise_mtl=5F?=
 =?utf-8?q?ddi=5Fprepare=5Flink=5Fretrain?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Jan 2025 06:21:56 -0000
Message-ID: <173588531677.2447086.5093757982893117439@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103051705.145161-1-suraj.kandpal@intel.com>
In-Reply-To: <20250103051705.145161-1-suraj.kandpal@intel.com>
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

Series: Clean and Optimise mtl_ddi_prepare_link_retrain
URL   : https://patchwork.freedesktop.org/series/143079/
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
commit b15f2b907d90444ddc97407a5e1fb73383fd8aaa
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jan 3 10:47:05 2025 +0530

    drm/i915/ddi: Optimize mtl_port_buf_ctl_program
    
    A small optimization and cleanup for mtl_port_buf_ctl_program function
    which lets use intel_de_rmw instead of a intel_de_read and
    intel_de_write.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 048d83e7f9dae81c058d31c371634c1c317b3013 drm-intel
ec4780eab076 drm/i915/dp: Use intel_display instead of drm_i915_private
b15f2b907d90 drm/i915/ddi: Optimize mtl_port_buf_ctl_program


