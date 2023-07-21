Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3B6C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 14:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDBE10E68F;
	Fri, 21 Jul 2023 14:10:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1651B10E693;
 Fri, 21 Jul 2023 14:10:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 08CB1A00CC;
 Fri, 21 Jul 2023 14:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Fri, 21 Jul 2023 14:10:03 -0000
Message-ID: <168994860303.22545.13330204602489904150@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230721140745.16187-1-nirmoy.das@intel.com>
In-Reply-To: <20230721140745.16187-1-nirmoy.das@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Set_AE_PTE_bit_if_enable?=
 =?utf-8?q?d_on_smem?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/xe: Set AE PTE bit if enabled on smem
URL   : https://patchwork.freedesktop.org/series/121132/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0fc42ce677240e46c78febffe2cf713b8e672d33
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Jul 21 16:07:45 2023 +0200

    drm/xe: Enable device scope atomics with vm madvise
    
    Set XE_VMA_ATOMIC_PTE_BIT if user hints about device
    scoped atomics for a vma which will in turn set AE pte
    bit if atomics supported by the HW on the vma.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 786d2a4f30e168368b4d19d3e1d2f57d18ebecf8 drm-intel
6b86ea7f3 drm/xe: Set AE PTE bit if enabled on smem
0fc42ce67 drm/xe: Enable device scope atomics with vm madvise


