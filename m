Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C11BC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 00:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA71120FC;
	Wed,  8 May 2024 00:25:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D6C1120FC;
 Wed,  8 May 2024 00:25:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_Indirect_Ri?=
 =?utf-8?q?ng_State_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 00:25:56 -0000
Message-ID: <171512795649.1963161.7102152805108305988@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add Indirect Ring State support (rev3)
URL   : https://patchwork.freedesktop.org/series/133207/
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
commit 37d6e09df6aac804e0e1e2e105651924e2f98b87
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue May 7 15:42:53 2024 -0700

    drm/xe/xe2: Enable Indirect Ring State support for Xe2
    
    Indirect Ring State is the recommended mode for Xe2 platforms,
    enable it by default.
    
    v2: Set has_indirect_ring_state to '1' instead of 'true'
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 703bc96550be8cd9f4995bfa5126ca8a2e98c58c drm-intel
b949430af8c0 drm/xe: Minor cleanup in LRC handling
740e260f9643 drm/xe: Add Indirect Ring State support
11ee004c305d drm/xe: Dump Indirect Ring State registers
37d6e09df6aa drm/xe/xe2: Enable Indirect Ring State support for Xe2


