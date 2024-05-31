Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A67C27C44
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 07:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55214A9B6;
	Fri, 31 May 2024 07:27:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB5114A9B8;
 Fri, 31 May 2024 07:27:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_overmap?=
 =?utf-8?q?_identity_VRAM_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 07:27:28 -0000
Message-ID: <171714044825.2240145.6625131583393156816@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531070717.1904762-1-matthew.brost@intel.com>
In-Reply-To: <20240531070717.1904762-1-matthew.brost@intel.com>
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

Series: drm/xe: Don't overmap identity VRAM mapping
URL   : https://patchwork.freedesktop.org/series/134282/
State : warning

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
commit 21d1ed6611b36f5b2a883a580c261687778a06c5
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri May 31 00:07:17 2024 -0700

    drm/xe: Don't overmap identity VRAM mapping
    
    Overmapping the identity VRAM mapping is triggering hardware bugs on
    certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM
    chunk.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Fei Yang <fei.yang@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4e2ea8adc72ce3d1f2968de789b7d068cd58b5df drm-intel
21d1ed6611b3 drm/xe: Don't overmap identity VRAM mapping
-:37: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#37: FILE: drivers/gpu/drm/xe/xe_migrate.c:144:
+	u64 entry, pt30_ofs;;

total: 0 errors, 1 warnings, 0 checks, 101 lines checked


