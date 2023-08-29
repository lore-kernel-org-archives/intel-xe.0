Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF9C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88FF10E2A3;
	Tue, 29 Aug 2023 14:14:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58B7410E2A3;
 Tue, 29 Aug 2023 14:14:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 546A9AADF3;
 Tue, 29 Aug 2023 14:14:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 29 Aug 2023 14:14:05 -0000
Message-ID: <169331844534.16747.2079851982658371292@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829094538.19551-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230829094538.19551-1-niranjana.vishwanathapura@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fi?=
 =?utf-8?q?xup!_drm/xe/pvc=3A_Use_fast_copy_engines_as_migrate_engine_on_P?=
 =?utf-8?b?VkMgKHJldjIp?=
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

Series: fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC (rev2)
URL   : https://patchwork.freedesktop.org/series/122998/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55e9b83bc52c41319623d28c65b16f5017c02249
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Aug 29 02:45:38 2023 -0700

    fixup! drm/xe/pvc: Use fast copy engines as migrate engine on PVC
    
    Update Makefile to generate OOB header file for xe_migrate.c
    
    v2: list targets in alphabetical order.
    
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch d8c08057a8990c7477e43ba175c8c0b5a662dbad drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


