Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B89C25B4F
	for <intel-xe@archiver.kernel.org>; Sat,  4 May 2024 23:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2D010E992;
	Sat,  4 May 2024 23:40:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD0B10E992;
 Sat,  4 May 2024 23:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_Indirect_Ri?=
 =?utf-8?q?ng_State_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 May 2024 23:40:57 -0000
Message-ID: <171486605705.1906177.18192320185500446275@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add Indirect Ring State support
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
commit 0321d73e3fc2c2e84e0153bf116df40897eb1b6c
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Sat May 4 16:35:01 2024 -0700

    drm/xe/xe2: Enable Indirect Ring State support for Xe2
    
    Indirect Ring State is the recommended mode for Xe2 platforms,
    enable it by default.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch ca96a1c62451ea534391d1eafe3a0b5691658c02 drm-intel
4116256a9102 drm/xe: Minor cleanup in LRC handling
1e41623ec0e5 drm/xe: Add Indirect Ring State support
e3b30a81975b drm/xe: Dump Indirect Ring State registers
0321d73e3fc2 drm/xe/xe2: Enable Indirect Ring State support for Xe2


