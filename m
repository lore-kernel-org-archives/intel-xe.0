Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DC7C04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60C010E6D5;
	Fri, 12 Apr 2024 09:58:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A92810ECD1;
 Fri, 12 Apr 2024 09:58:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_device_atomics_wit?=
 =?utf-8?q?h_a_VM_bind_flag_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Apr 2024 09:58:42 -0000
Message-ID: <171291592217.1356874.1460096722592771212@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412092249.3636-1-nirmoy.das@intel.com>
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
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

Series: Enable device atomics with a VM bind flag (rev2)
URL   : https://patchwork.freedesktop.org/series/132290/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c87357e7f6655908c0934a4f55fadf5b9aa9e88f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2ecf4e7e5e28b80b18c260b931c663438cac17ed
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Apr 12 11:22:49 2024 +0200

    drm/xe/uapi: Add a query flag for has_device_atomics_on_smem
    
    Add a query flag for xe->info.has_device_atomics_on_smem
    as this is platform dependent. This flag can be use to inform
    whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
    applied for a given platform.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch d9073a139e9edfd27d830c9c4af9683651044aff drm-intel
90c8fccfc682 drm/xe: Introduce has_atomic_enable_pte_bit device info
7b10e9b0adfd drm/xe: Consolidate setting PTE_AE into one place
f5965b256dad drm/xe: Add function to check if BO has single placement
7ae4c4d43c9c drm/xe: Move vm bind bo validation to a helper function
6938baaa5b5d drm/xe: Introduce has_device_atomics_on_smem device info
0010d3142e26 drm/xe/uapi: Introduce VMA bind flag for device atomics
2ecf4e7e5e28 drm/xe/uapi: Add a query flag for has_device_atomics_on_smem


